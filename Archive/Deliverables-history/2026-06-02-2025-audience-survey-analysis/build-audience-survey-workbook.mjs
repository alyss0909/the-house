import fs from "node:fs/promises";
import path from "node:path";
import { SpreadsheetFile, Workbook } from "@oai/artifact-tool";

const outDir = path.resolve("Deliverables/2026-06-02-2025-audience-survey-analysis");
const summary = JSON.parse(await fs.readFile(path.join(outDir, "analysis-summary.json"), "utf8"));

const workbook = Workbook.create();

function colName(n) {
  let s = "";
  while (n >= 0) {
    s = String.fromCharCode((n % 26) + 65) + s;
    n = Math.floor(n / 26) - 1;
  }
  return s;
}

function writeTable(sheet, startRow, startCol, headers, rows) {
  const matrix = [headers, ...rows];
  const range = sheet.getRangeByIndexes(startRow, startCol, matrix.length, headers.length);
  range.values = matrix;
  const headerRange = sheet.getRangeByIndexes(startRow, startCol, 1, headers.length);
  headerRange.format = {
    fill: "#204E4A",
    font: { bold: true, color: "#FFFFFF" },
    wrapText: true,
  };
  return range;
}

function pct(v) {
  return `${Number(v).toFixed(1)}%`;
}

function prepSheet(name) {
  const sheet = workbook.worksheets.add(name);
  sheet.showGridLines = false;
  return sheet;
}

const summarySheet = prepSheet("Executive Summary");
summarySheet.getRange("A1:H1").merge();
summarySheet.getRange("A1").values = [["2025 Audience Survey Analysis"]];
summarySheet.getRange("A1").format = {
  fill: "#204E4A",
  font: { bold: true, color: "#FFFFFF" },
};
summarySheet.getRange("A3:B8").values = [
  ["Responses", summary.n_responses],
  ["Columns", summary.n_columns],
  ["First response", summary.date_range.first.slice(0, 10)],
  ["Last response", summary.date_range.last.slice(0, 10)],
  ["Primary audience stage", summary.stage_counts[0].item],
  ["Primary need", "More clients through calmer, more automated marketing"],
];
summarySheet.getRange("A3:A8").format = { font: { bold: true }, fill: "#E7F0ED" };

writeTable(summarySheet, 10, 0, ["Key finding", "What it means"], [
  ["Client generation is the central demand", "52.1% are established but need more clients; open text repeatedly asks for leads, sales, buyers, and reliable client flow."],
  ["The audience wants slower marketing, not more noise", "Replacing social content with slow marketing was the top selected content topic, chosen by 70.8% of respondents."],
  ["Email is wanted but underbuilt", "66.7% selected automated sales from email and 62.5% selected growing an email list, while 46.9% described email marketing as inconsistent."],
  ["Pinterest is attractive as a lower-pressure channel", "59.4% selected more leads from Pinterest, but 52.1% described Pinterest as inconsistent."],
  ["Courses need support", "Top barriers are overwhelm, follow-through concern, and cost; no-brainer support asks cluster around hands-on help, templates, clarity, and accountability."],
]);
summarySheet.getRange("A11:B15").format = { wrapText: true };
summarySheet.getRange("A12:B16").format.rowHeightPx = 46;
summarySheet.getRange("A:A").format.columnWidthPx = 240;
summarySheet.getRange("B:B").format.columnWidthPx = 620;

const demandSheet = prepSheet("Content Demand");
const demandRows = summary.content_wants.map((r) => [r.item, r.count, r.pct_responses / 100]);
writeTable(demandSheet, 0, 0, ["Content topic", "Count", "% of responses"], demandRows);
demandSheet.getRange(`C2:C${demandRows.length + 1}`).format.numberFormat = "0.0%";
demandSheet.getRange("A:A").format.columnWidthPx = 360;
demandSheet.getRange("B:C").format.columnWidthPx = 120;

const stageSheet = prepSheet("Stage Segments");
const stageRows = summary.stage_counts.map((r) => [r.item, r.count, r.pct_responses / 100]);
writeTable(stageSheet, 0, 0, ["Business stage", "Count", "% of responses"], stageRows);
stageSheet.getRange(`C2:C${stageRows.length + 1}`).format.numberFormat = "0.0%";
stageSheet.getRange("A:A").format.columnWidthPx = 430;
stageSheet.getRange("B:C").format.columnWidthPx = 120;

const stageContentHeaders = ["Stage", "Stage n", "Topic", "Count", "% within stage"];
const topStageContent = summary.stage_content
  .sort((a, b) => a.stage.localeCompare(b.stage) || b.count - a.count)
  .filter((r) => r.count > 0);
writeTable(stageSheet, 18, 0, stageContentHeaders, topStageContent.map((r) => [r.stage, r.stage_n, r.item, r.count, r.count / r.stage_n]));
stageSheet.getRange(`E20:E${topStageContent.length + 19}`).format.numberFormat = "0.0%";
stageSheet.getRange("A:E").format.wrapText = true;

const channelSheet = prepSheet("Channel Vibes");
const channelLabels = { social: "Social Media", email_mkt: "Email Marketing", pinterest: "Pinterest" };
const channelRows = summary.channel_counts.map((r) => [channelLabels[r.channel] || r.channel, r.feeling, r.count, r.pct_responses / 100]);
writeTable(channelSheet, 0, 0, ["Channel", "Feeling", "Count", "% of responses"], channelRows);
channelSheet.getRange(`D2:D${channelRows.length + 1}`).format.numberFormat = "0.0%";
channelSheet.getRange("A:B").format.columnWidthPx = 240;
channelSheet.getRange("C:D").format.columnWidthPx = 120;

const barrierSheet = prepSheet("Purchase Barriers");
const barrierRows = summary.purchase_barriers.map((r) => [r.item, r.count, r.pct_responses / 100]);
writeTable(barrierSheet, 0, 0, ["Barrier", "Count", "% of responses"], barrierRows);
barrierSheet.getRange(`C2:C${barrierRows.length + 1}`).format.numberFormat = "0.0%";
barrierSheet.getRange("A:A").format.columnWidthPx = 360;

const themesSheet = prepSheet("Open Text Themes");
const priorityFields = new Set(["magic", "holding", "showme", "advice", "worth"]);
const themeRows = summary.theme_counts
  .filter((r) => priorityFields.has(r.field))
  .sort((a, b) => a.field.localeCompare(b.field) || b.count - a.count)
  .map((r) => [r.field, r.theme, r.count, r.pct_responses / 100, (summary.theme_examples[`${r.field}|${r.theme}`] || []).join(" / ")]);
writeTable(themesSheet, 0, 0, ["Question area", "Theme", "Count", "% of responses", "Example snippets"], themeRows);
themesSheet.getRange(`D2:D${themeRows.length + 1}`).format.numberFormat = "0.0%";
themesSheet.getRange("A:B").format.columnWidthPx = 210;
themesSheet.getRange("C:D").format.columnWidthPx = 110;
themesSheet.getRange("E:E").format.columnWidthPx = 620;
themesSheet.getRange("A:E").format.wrapText = true;

await fs.mkdir(outDir, { recursive: true });
const errors = await workbook.inspect({
  kind: "match",
  searchTerm: "#REF!|#DIV/0!|#VALUE!|#NAME\\?|#N/A",
  options: { useRegex: true, maxResults: 100 },
  summary: "formula error scan",
});
await fs.writeFile(path.join(outDir, "workbook-error-scan.ndjson"), errors.ndjson, "utf8");
const output = await SpreadsheetFile.exportXlsx(workbook);
await output.save(path.join(outDir, "2025-audience-survey-analysis.xlsx"));
const preview = await workbook.render({ sheetName: "Executive Summary", autoCrop: "all", scale: 1, format: "png" });
await fs.writeFile(path.join(outDir, "executive-summary-preview.png"), new Uint8Array(await preview.arrayBuffer()));
