# Pin Copy

Query my Pin Tracker for every row where Stage = "Ready".
- Data Source ID: [YOUR DATA SOURCE ID]

If there are none, tell me and stop.

For each Ready row, using ONLY the keyword in that row (never invent or add keywords):

1. **Pin titles:** 5 options, 40-60 characters each (100 hard max), keyword as close to the front as possible.
2. **Pin description:** one, with the keyword inside the first 50-60 characters (that is all that shows in-feed before truncation), 150-220 characters total, natural language, one soft call to action pointing at the Source Content.
3. **Alt text:** under 125 characters, describing a plausible pin image for this topic, keyword included naturally.

Write all of it back into the row: best title in Pin Title, the other 4 title options appended to Pin Description after a "---" line, alt text in Alt Text. Set Stage = "Copy Written".

Then summarize: how many rows processed, and remind me the only thing left is designing the images and scheduling (that part stays human).
