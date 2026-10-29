---
name: feedback-table-one-liners
description: "in planned-work.md tables: Item/Trigger cells are short keywords; Details cell carries the substance — all cells still one line"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 06c34500-63ce-4c6d-a977-2a11864cb922
---

In `docs/dev_journals/faction-manager/planned-work.md` (and any sibling `planned-work.md`), every table cell is a one-liner — no wrapping. Column roles differ:

- **Item / Trigger columns:** short, scan-friendly keywords or brief verb phrases. As few words as still unambiguous. These are the row's index key, not its explanation.
- **Details column:** carries the actual substance — this is where chars are earned. Still one line, but it can run longer than Item/Trigger because that's its job.

**Why:** Long Item/Trigger cells squeeze the Details column and make the table harder to scan. Details earns its length because it's the substance; Item and Trigger are just lookup keys. Long cells also force markdown renderers to wrap — which breaks IDs like `F-001` mid-token. Rule refined 2026-05-22.

**How to apply:** Only applies to `planned-work.md` tables. When writing a row: trim Item and Trigger first (cut articles, filler, redundant context), then use whatever space remains in Details. Check the longest Item/Trigger cell — it sets column width for everything. If a row can't be stated in one line anywhere, ask whether it earns the row at all. Elaboration belongs in the write-up section below the table, the discovery doc, or an external pointer. Related: [[feedback-yagni]].
