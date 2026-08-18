# Commercial Performance Hub — QA Process

## Purpose

This document defines the quality assurance process for changes made to the Commercial Performance Hub Power BI Project (PBIP).

The objective is to ensure that changes are technically valid, numerically correct, visually correct and safely documented before they are committed and merged into the `main` branch.

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