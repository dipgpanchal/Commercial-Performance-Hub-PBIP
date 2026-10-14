# Commercial Performance Hub — QA Process

## Purpose

This document defines the quality assurance process for changes made to the Commercial Performance Hub Power BI Project (PBIP).

The objective is to ensure that changes are technically valid, numerically correct, visually correct and safely documented before they are committed and merged into the `main` branch.

---

## Evidence currently available on public `main`

- Public `main` is at commit `80490e6` (“PBIX QA Pass Hub”) and contains `Commercial_Performance_Hub_QA_Signed.pbix.pbix`. The PBIX file is an artifact, not a test log or proof of independently reproduced validation.
- The [Scenario Planner title change record](./Change%20Records/2026-08-18-Scenario-Planner-Title.md) records manual visual and interaction checks for that change. The corresponding [pull request #1](https://github.com/dipgpanchal/Commercial-Performance-Hub-PBIP/pull/1) was merged.
- These are project-recorded manual QA claims. No automated test suite or detailed automated test output is included in the repository, and the manual checks have not been independently rerun as part of this documentation update.
- The separately maintained Word case study, which is not included in this repository patch, has since been revised as V9 to align its measure count and Scenario Planner description with public `main`.

---

## QA Principles

Every change should be validated according to its scope and impact.

QA should be proportionate to the change.

A visual-only change does not require full semantic-model reconciliation.

A semantic-model or DAX change requires deeper numerical and functional validation.

Changes must not be considered complete until the applicable QA checks have passed.

---

## 1. Change Classification

Before testing, classify the change.

### Type A — Visual / Presentation

Examples:

- Title changes
- Icons
- Text
- Formatting
- Alignment
- Spacing
- Colours
- Visual layout

Typical QA:

- Visual rendering
- Text accuracy
- Alignment
- Clipping / truncation
- Page navigation
- Relevant interactions
- Numerical results unchanged

---

### Type B — Report / Functional

Examples:

- Slicers
- Filters
- Drill-through
- Tooltips
- Bookmarks
- Navigation
- Visual interactions
- Field parameters

Typical QA:

- Visual behaviour
- Filter behaviour
- Cross-filtering
- Navigation
- Tooltip behaviour
- Expected values after interaction

---

### Type C — Semantic Model / DAX

Examples:

- New measures
- Modified measures
- Calculation groups
- Calculation items
- Relationships
- Columns
- Display folders
- Field parameters
- Model metadata

Typical QA:

- DAX validation
- Measure validation
- Dependency validation
- Numerical reconciliation
- Filter-context validation
- Related visual validation
- Regression testing

---

### Type D — Data / Transformation

Examples:

- Source changes
- SQL changes
- Power Query changes
- Data type changes
- Transformation logic
- Table changes

Typical QA:

- Refresh validation
- Row / record validation
- Data type validation
- Reconciliation
- Transformation validation
- Downstream measure validation
- Report regression testing

---

## 2. Standard QA Workflow

### Step 1 — Define the Change

Record:

- Date
- Branch
- Change type
- What changed
- Why it changed
- Expected impact
- Dependencies

A detailed record should be created under:

`Change Records/`

Naming convention:

`YYYY-MM-DD-<short-description>.md`

---

### Step 2 — Review Git Working Tree

Before committing:

```text
git status
git diff