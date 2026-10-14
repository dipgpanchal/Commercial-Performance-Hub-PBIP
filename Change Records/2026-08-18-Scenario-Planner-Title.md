# Change Record

## Change

**Date:** 2026-08-18
**Branch:** `feature/pbip-workflow-test`
**Change Type:** Changed

### What changed?

- Replaced the Scenario Planner title icon from calendar to triangle-ruler.
- Retained the `SCENARIO PLANNER` title text.

### Why was it changed?

- To use the intended title icon for the Scenario Planner visual.

### Impact

- Semantic Model: None
- Measures / DAX: None
- Report / Visuals: Scenario Planner title textbox only
- Data / Transformation: None

### Dependencies

- None identified.

### QA

- **Project-recorded result:** PASS (manual checks; not an automated or independently reproduced test)
- Icon rendering verified.
- Title text verified.
- Icon-to-text spacing verified.
- No clipping or truncation.
- Scenario Planner page and interactions verified.
- Numerical results unchanged.

### Git
**Date:** 2026-08-18
**Branch:** `feature/pbip-workflow-test`
**Feature Commit:** `feat: update Scenario Planner title icon`
**Documentation Commit:** `docs: record Scenario Planner change and QA`

This feature branch was merged to public `main` in [pull request #1](https://github.com/dipgpanchal/Commercial-Performance-Hub-PBIP/pull/1). The checks above apply to the title-icon change only; they do not establish QA coverage for the entire report or later changes.
