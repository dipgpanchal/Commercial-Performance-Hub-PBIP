# Commercial Performance Hub

## Overview

Commercial Performance Hub is an interactive Power BI analytics solution designed to provide a consolidated view of commercial performance across revenue, profit, margin, products, stores, inventory and scenario analysis.

The solution is designed to move beyond descriptive reporting by helping users identify performance drivers, investigate opportunities and evaluate potential commercial decisions.

---

## Business Areas

The solution currently contains the following analytical areas:

### Executive Summary

Provides a management-level view of:

- Total Revenue
- Trading Profit
- Trading Margin %
- Units Sold
- Transactions
- 24-month performance trends
- Selected KPI metric comparison
- Category performance
- Store performance
- Key Business Insights

### Product Performance

Provides product-level analysis including:

- Revenue
- Trading Profit
- Trading Margin %
- Units Sold
- Average Selling Price
- Average Cost
- Product ranking
- Margin improvement analysis
- Margin contribution / Pareto analysis
- Top and bottom product analysis

### Store Performance

Provides store-level analysis including:

- Revenue performance
- Store ranking
- Current vs previous period comparison
- Revenue change
- Revenue contribution
- ABC classification
- Top and bottom store analysis
- Store-level detail

### Inventory Health

Provides inventory position and replenishment analysis including:

- Inventory Cost
- Healthy Positions
- Replenishment Risk
- Excess Stock Risk
- Units Sold trend
- Stock on Hand
- Inventory Value
- Inventory Cost
- Weekly Velocity
- Weeks Cover
- Inventory Health
- Recommended Action
- Status

### Scenario Planner

Provides what-if analysis for commercial decisions using:

- Price Change %
- Cost Change %
- Volume Change %
- Elasticity
- Scenario Revenue
- Scenario Profit
- Scenario Margin %
- Scenario Units
- Profit Impact Waterfall
- Scenario Impact Details
- Top / Bottom Profit Impact

### Price Sensitivity

Provides price-demand sensitivity analysis using user-defined price and elasticity assumptions.

Key capabilities include:

- Price Change %
- Elasticity / Demand Sensitivity
- Scenario Revenue
- Scenario Profit
- Scenario Margin %
- Scenario Units
- Price Sensitivity Curve
- Outcome Comparison
- Product Opportunities
- Scenario profit impact
- Current vs scenario margin analysis

Elasticity assumptions currently include:

| Elasticity | Interpretation |
|---:|---|
| -2.0 | Very High |
| -1.0 | High |
| -0.5 | Moderate |
| 0.0 | No Impact |
| +0.5 | Inverse |

---

## Reporting Controls

The report supports common reporting selections including:

- Reporting Calendar
  - Calendar Year
  - Financial Year
- Period
  - Month
  - Quarter
  - Year
- Store
- Category
- Scenario assumptions where applicable

The report also provides a consistent current-period and previous-period comparison framework.

---

## Semantic Model

The semantic model contains:

- 274 measures
- Comparison calculation group
- Scenario analysis measures
- Price sensitivity calculations
- Ranking and performance calculations
- Reporting and presentation measures

Measures have been organised into display folders to improve model maintainability and usability.

---

## Version Control

The Power BI solution is maintained as a Power BI Project (`.pbip`) and version controlled using Git.

The repository provides:

- Change history
- Baseline recovery
- Controlled development
- Reviewable model changes
- Branch-based development
- Documentation alongside the Power BI project

The QA-approved baseline is maintained on the `main` branch.

---

## Development Philosophy

Changes should follow a controlled workflow:

1. Create or select a feature branch.
2. Define the requested change.
3. Make the change through Power BI Desktop, VS Code or approved automation.
4. Review the Git diff.
5. Validate the semantic model.
6. Open the report in Power BI Desktop.
7. Reconcile key numbers and visuals.
8. Perform visual / functional QA.
9. Commit the validated change.
10. Merge into `main`.

The `main` branch should represent a validated and usable version of the solution.

---

## Quality Assurance

QA validation includes:

- KPI reconciliation
- Measure validation
- Visual validation
- Filter validation
- Tooltip validation
- Scenario validation
- Calculation validation
- Report navigation validation
- Git working-tree validation

Changes should not be considered complete until both the technical model and report experience have been validated.

---

## Repository Structure


Commercial-Performance-Hub-PBIP/
│
├── Commercial_Performance_Hub.pbip
│
├── Commercial_Performance_Hub.Report/
│
├── Commercial_Performance_Hub.SemanticModel/
│
├── docs/
│   └── Architecture.md
│
├── Change Records/
│   └── YYYY-MM-DD-<change>.md
│
├── Templates/
│   ├── CHANGE_TEMPLATE.md
│   ├── COPILOT_PROMPTS.md
│   ├── NEW_PROJECT_CHECKLIST.md
│   └── QA_TEMPLATE.md
│
├── README.md
├── CHANGELOG.md
├── QA.md
└── .gitignore

### Documentation and Workflow

- `README.md` — Project overview, capabilities and development philosophy
- `docs/` — Project-specific architecture documentation
- `Change Records/` — Dated audit records for individual changes
- `Templates/` — Reusable templates and prompts for future Power BI projects
- `QA.md` — Quality assurance process and definition of done
- `CHANGELOG.md` — High-level project change history


## Project Status

**Status:** QA-approved baseline

**Version:** 1.0.0

**Development approach:** Power BI Project + Git + GitHub

---

## Author

Designed and developed by **Dip Panchal**.