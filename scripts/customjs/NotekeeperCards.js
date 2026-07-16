/* NotekeeperCards.js — customJS startup helper for the Journal card view.
   DOM-only jobs (never reads or writes note files):
     1. Split the leading YYYY-MM-DD out of each card title into a tiny
        .keep-card-date chip, and title-case the remaining slug.
     2. Hide the duplicate H1 at the top of the card body (KeepSidian
        import always writes "# Title" as the first line, which repeats
        the card title above it).
     3. Hide the leftover "*[Original Keep note](...)*" import line.
     4. Hide the auto-generated "Connections: [[hub]]" line from the
        CARD VIEW only (it stays in the file — the Journal Web hub
        system depends on it) and tag the "Related notes" list so only
        THAT list gets chip styling, not arbitrary content bullets.
     5. Stamp data-tag-color="1..5" on every .keep-card-tag by hashing
        the tag name, so every real tag in the vault lands on one of
        the 5 brand pastels instead of falling back to a single default
        the moment it isn't in a hardcoded name list.
   Everything is wrapped in try/catch and guarded, so a failure is a
   silent no-op — cards just fall back to the CSS defaults.
   Registered as a customJS startup script (see plugins/customjs/data.json).
   (Larry + design team, 2026-07-13) */
class NotekeeperCards {
  async invoke() {
    try {
      const MONTHS = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
      const titleCase = (s) =>
        s.replace(/-/g, " ").replace(/\s+/g, " ").trim()
         .replace(/^\w/, (c) => c.toUpperCase());

      const hashTagColor = (s) => {
        let h = 0;
        for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) >>> 0;
        return (h % 5) + 1;
      };

      const processTitle = (card) => {
        const titleEl = card.querySelector(".keep-card-title");
        if (titleEl && titleEl.dataset.nkDone !== "1") {
          const raw = (titleEl.textContent || "").trim();
          const m = raw.match(/^(\d{4})-(\d{2})-(\d{2})[-\s]+(.+)$/);
          if (m && !card.querySelector(".keep-card-date")) {
            const y = m[1], mo = parseInt(m[2], 10), d = parseInt(m[3], 10), rest = m[4];
            titleEl.textContent = titleCase(rest);
            const chip = document.createElement("div");
            chip.className = "keep-card-date";
            const mi = Math.max(1, Math.min(12, mo)) - 1;
            chip.textContent = MONTHS[mi] + " " + d + " " + y;
            card.insertBefore(chip, titleEl);
          }
          titleEl.dataset.nkDone = "1";
        }
      };

      const processBody = (card) => {
        const body = card.querySelector(".keep-card-body");
        if (!body) return;

        // Obsidian wraps every top-level block in its own container
        // (e.g. <div class="el-h1"><h1>...</h1></div>), so operate on
        // body's direct children as "blocks" and look inside each one
        // rather than assuming the tag itself sits at the top level.
        // Each block gets its own idempotent flag (not a single
        // body-wide flag) so blocks that stream in later, after an
        // early block already got scanned, still get processed.
        const blocks = Array.from(body.children);
        let relatedLabelBlock = null;

        blocks.forEach((block) => {
          if (block.dataset.nkChecked === "1") {
            if (block.dataset.nkRelated === "1") relatedLabelBlock = block;
            return;
          }
          block.dataset.nkChecked = "1";

          // duplicate title heading -- block itself may BE the h1/h2/h3,
          // or it may be wrapped one level down; querySelector alone
          // only catches the wrapped case since it never matches the
          // element it's called on.
          if (block === blocks[0] && (block.matches("h1, h2, h3") || block.querySelector("h1, h2, h3"))) {
            block.classList.add("keep-hide");
            return;
          }

          // leftover "Original Keep note" import link
          const link = block.querySelector("a");
          if (link) {
            const txt = (link.textContent || "").trim().toLowerCase();
            const href = (link.getAttribute("href") || "").toLowerCase();
            if (txt === "original keep note" || href.includes("keep.google.com")) {
              block.classList.add("keep-hide");
              return;
            }
          }

          // "Related notes" label -> flag this block so the very next
          // block, if it's a list, gets chip styling. "Connections:"
          // line -> hide from the card view (stays in the file).
          const p = block.matches("p") ? block : block.querySelector("p");
          const first = p && p.firstElementChild;
          if (first && first.tagName === "STRONG") {
            const label = (first.textContent || "").trim().toLowerCase().replace(/:$/, "");
            if (label === "related notes") {
              block.dataset.nkRelated = "1";
              relatedLabelBlock = block;
            } else if (label === "connections") {
              block.classList.add("keep-hide");
            }
          }
        });

        if (relatedLabelBlock) {
          const idx = blocks.indexOf(relatedLabelBlock);
          const next = blocks[idx + 1];
          const list = next && (next.matches("ul, ol") ? next : next.querySelector("ul, ol"));
          if (list) list.classList.add("keep-related-list");
        }
      };

      const processTags = (card) => {
        const tags = card.querySelectorAll(".keep-card-tag");
        for (const t of tags) {
          const key = (t.textContent || "").trim().toLowerCase()
            .replace(/^#/, "").replace(/\s+/g, "-");
          if (!key) continue;
          t.setAttribute("data-tag", key);
          if (!t.dataset.tagColor) {
            t.setAttribute("data-tag-color", String(hashTagColor(key)));
          }
        }
      };

      const processCard = (card) => {
        try {
          processTitle(card);
          processBody(card);
          processTags(card);
        } catch (e) { /* per-card: ignore */ }
      };

      const scanAll = () => {
        try { document.querySelectorAll(".keep-card").forEach(processCard); } catch (e) {}
      };

      scanAll();

      if (this._obs) this._obs.disconnect();
      this._obs = new MutationObserver((muts) => {
        const touchedCards = new Set();
        for (const mu of muts) {
          if (!mu.addedNodes) continue;
          mu.addedNodes.forEach((n) => {
            if (n.nodeType !== 1) return;
            if (n.classList && n.classList.contains("keep-card")) {
              touchedCards.add(n);
              return;
            }
            const parentCard = n.closest ? n.closest(".keep-card") : null;
            if (parentCard) { touchedCards.add(parentCard); return; }
            if (n.querySelectorAll) {
              n.querySelectorAll(".keep-card").forEach((c) => touchedCards.add(c));
            }
          });
        }
        touchedCards.forEach(processCard);
      });
      this._obs.observe(document.body, { childList: true, subtree: true });
      console.log("[NotekeeperCards] active");
    } catch (e) {
      console.error("[NotekeeperCards] setup failed:", e);
    }
  }
}
