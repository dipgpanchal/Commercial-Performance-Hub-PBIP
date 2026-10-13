# Change Record

## Change

**Date:** 2026-10-13
**Branch:** `fix/scenario-planner-volume`
**Change Type:** Fixed

### What changed?

- Scenario Planner: `Scenario Volume Change %` now uses `[Selected Volume Change %]` directly. It no longer adds a price-elasticity volume effect.
- Price Sensitivity: `Outcome Scenario Units`, `Outcome Scenario Revenue` and `Outcome Scenario Cost` now fall back to `[Selected Elasticity]` when no elasticity row is in scope.
- Price Sensitivity: added the hidden measure `Outcome Scenario Margin %` (Outcome Scenario Profit ÷ Outcome Scenario Revenue).
- Price Sensitivity: the Scenario Revenue, Scenario Profit, Scenario Margin % and Scenario Units cards, and the margin column of the Product Opportunities table, are bound to the `Outcome Scenario` measures.
- Footer text updated on the Scenario Planner page (corrected) and on the Price Sensitivity page ("Demand Change % = Price Change % × Selected Elasticity | Margin Impact (pp) = Scenario Margin % − Current Margin %").

### Why was it changed?

- Scenario Planner Price Change %, Cost Change % and Volume Change % must be independent assumptions.
- Elasticity-based demand response belongs on the Price Sensitivity page.
- After the Scenario Planner correction, the Price Sensitivity cards no longer responded to the Elasticity selection.

### Impact

- Semantic Model: `_Scenario&PS_Engine` measures only. No relationship, parameter table or other table changes.
- Measures / DAX: `Scenario Volume Change %`, `Outcome Scenario Units`, `Outcome Scenario Revenue`, `Outcome Scenario Cost`, new `Outcome Scenario Margin %`. `Elasticity Volume Change %` is retained and unchanged.
- Report / Visuals: Price Sensitivity cards and Product Opportunities margin column rebinding; footer text on both pages.
- Data / Transformation: None

### Dependencies

- `Elasticity Volume Change %` is still used by `Scenario Rating` and `Commercial Insight`.
- Measure count increases from 274 to 275.

### QA

- **Result:** PASS (tested in Power BI Desktop; report saved, closed and reopened successfully)
- Scenario Planner Price Change, Cost Change and Volume Change behave as independent assumptions.
- Scenario Planner tests for +10% volume, +10% price and +10% cost passed.
- Price Change +10% with Elasticity -2.0: demand decreases by 20%.
- Price Change +10% with Elasticity 0.0: demand remains unchanged.
- Price Sensitivity cards and the Product Opportunities table respond to elasticity changes.
- Scenario Planner and Price Sensitivity footers verified.

### Git

**Branch:** `fix/scenario-planner-volume`
**Feature Commit:** `fix: correct scenario volume and price sensitivity elasticity`
**Documentation Commit:** Included in the same commit
