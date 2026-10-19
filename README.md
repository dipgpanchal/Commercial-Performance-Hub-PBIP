# Commercial Performance Hub

## Overview

Commercial Performance Hub is an end-to-end commercial analytics solution built with Power BI, SQL and dimensional data modelling to turn sales, margin, product, store and inventory data into actionable business insights.

Combining executive reporting, product and store performance analysis, inventory health monitoring and interactive pricing scenarios, the solution helps users investigate performance drivers, identify commercial opportunities and evaluate potential decisions.

The project demonstrates practical expertise in SQL-based data preparation, Power BI semantic modelling, DAX analytics and commercial decision support — bringing data engineering and business analysis together in one solution.

---

## Recruiter review route

1. Open the [Power BI Project](./Commercial_Performance_Hub.pbip) in Power BI Desktop.
2. Browse the [report definitions](./Commercial_Performance_Hub.Report/definition) and [semantic-model definitions](./Commercial_Performance_Hub.SemanticModel/definition).
3. Read [Architecture and setup](./docs/Architecture.md), [QA evidence and process](./QA.md), [the changelog](./CHANGELOG.md), and [dated change records](./Change%20Records/).
4. Explore the [MySQL SQL scripts](./sql/) covering the raw, staging and reporting layers.
5. The public repository also contains an older [QA PBIX snapshot](./Commercial_Performance_Hub_QA_Signed.pbix.pbix) (`Commercial_Performance_Hub_QA_Signed.pbix.pbix`).

**PBIP and PBIX status:** The PBIP report and semantic-model source is the authoritative, current project. The QA PBIX is an older QA snapshot. It may not include the latest approved report changes, and it should not be treated as the current recruiter-facing deliverable. A current, validated recruiter-facing PBIX has not yet been published.

The PBIP contains six visible report pages and three hidden tooltip pages. The six visible pages are listed below.

---

## Interactive Report and PDF Preview

[Open or download the six-page PDF preview](./docs/assets/Commercial_Performance_Hub.pdf) (about 3.5 MB).

The PDF is a **static export** of the report from Power BI Desktop, taken with the Calendar Year / Year period, all stores and all categories selected. It does not include slicers, drill-through, tooltips or refresh. The interactive experience is the Power BI project itself: open [Commercial_Performance_Hub.pbip](./Commercial_Performance_Hub.pbip) in Power BI Desktop and refresh it as described in [Data and setup](#data-and-setup).

| Page | Report page | What it shows |
|---|---|---|
| 1 | Executive Summary | Headline revenue, profit, margin, units and transactions with prior-period comparison, category and store rankings, and key business insights. |
| 2 | Product Performance | Product KPIs, 24-month trend, top-10 product growth and details, and Pareto analysis. |
| 3 | Store Performance | Store revenue trend, top and bottom store changes, Pareto analysis and store details. |
| 4 | Inventory Health | Stock position, weeks cover, health classification and recommended actions by product and store. |
| 5 | Scenario Planner | Price Change %, Cost Change %, Volume Change % and Elasticity inputs driving scenario revenue, profit, margin and units against the current period. |
| 6 | Price Sensitivity | Elasticity-based demand, revenue and profit outcomes at a selected price change, with a sensitivity curve and product opportunities. |

Notes on the preview:

- **Scenario Planner and Price Sensitivity (pages 5 and 6)** are assumption-driven estimates based on the selected price, cost, volume and elasticity inputs. They are illustrative analysis, not validated forecasts.
- **The “Sample - TOP 10 - BRAND PERFORMANCE” panel on page 2 is intentionally blank.** The dataset does not contain brand-level data, so the panel is a placeholder for a possible future visual.
- The PDF is a visual preview only. It is not evidence of automated testing; see [QA](./QA.md) for the recorded manual QA.

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

On public `main`, the effective scenario volume change is the selected Volume Change % plus Price Change % × selected Elasticity. That effective volume change drives the core scenario units, revenue, and cost calculations. The separately maintained Word case study V9, which is not included in this repository patch, has been revised to match this implementation.

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

The elasticity-driven demand component is **Price Change % × Selected Elasticity**. Outcome measures also incorporate the selected Volume Change %; scenario revenue applies the price change, while scenario cost applies the volume and cost assumptions. These are user-defined what-if assumptions, not statistically validated causal estimates or forecasts.

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

- 36 tables
- 9 relationships
- 275 measures
- 1 Comparison calculation group with 4 calculation items
- Scenario analysis measures
- Price sensitivity calculations
- Ranking and performance calculations
- Reporting and presentation measures

Measures have been organised into display folders to improve model maintainability and usability.

These counts are from public `main` at commit `80490e6`; the measure count includes hidden/helper measures and is not the count of user-facing measures. The separately maintained Word case study V9, which is not included in this repository patch, reports 274 measures and describes the same four-input Scenario Planner and effective-volume calculation.

---

## Data and setup

The model imports `dim_date`, `dim_products`, `dim_stores`, `fact_sales`, `fact_inventory_snapshot`, `vw_fact_product_weekly`, and `vw_fact_product_rolling` from MySQL at `localhost:3306`, database/schema `practise`.

Prerequisites for opening and refreshing the report:

- Power BI Desktop with PBIP support.
- Access to a MySQL server and credentials for the expected `practise` database and imported objects.
- Configure MySQL credentials in Power BI Desktop data source settings, then refresh.

The public repository does **not** include source CSVs or SQL creation/transformation scripts. A clone alone cannot recreate the database or perform a fresh data refresh. See [Architecture](./docs/Architecture.md) for the import boundary and reproduction limitations.

The local MySQL schema queried on 2026-10-14 returned 829,262 `fact_sales` rows (2022-01-01 to 2023-09-30), 1,593 `fact_inventory_snapshot` rows, 4,018 `dim_date` rows, 35 products, 50 stores, 2,761 weekly-view rows, and 11,044 rolling-view rows. These are an author-environment query snapshot, not counts verified from the checked-in PBIX; they may change after refresh. `fact_inventory_snapshot.load_dt` records data load timing, not the physical stock observation date. The 24-month trend visual has only 21 calendar months of observed sales in this snapshot.

Both analytical views are imported, but the public-main report bindings and DAX definitions reviewed did not show them used by current visuals or measures. They should be described as loaded, not currently consumed.

### Dataset source and licence

The separately maintained Word case study describes the dataset as “Mexico Toy Sales” / “Toy Sales” from Kaggle, but the exact listing URL, creator attribution, real/synthetic status, licence, and redistribution terms could not be confirmed from the repository or case-study text. Confirm these before making provenance or reuse claims.

Source links supplied by the project owner, listed for review:

- Dataset: [Toy Sales on Kaggle](https://www.kaggle.com/datasets/mysarahmadbhat/toy-sales)
- Licence reference: [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)

The CC0 link is a reference supplied by the project owner. It has **not** been verified against the Kaggle listing's licence metadata, so this repository does not assert that the dataset is CC0-licensed. The dataset creator's attribution and the real/synthetic status have likewise not been confirmed, and this project is not endorsed by the dataset creator. The repository includes a PBIX artifact that may contain imported data; verify its contents and reuse permissions before redistributing it.

### Screenshot status

A six-page PDF preview of the report is published (see [Interactive Report and PDF Preview](#interactive-report-and-pdf-preview)). No separate standalone dashboard screenshots are embedded in this README or stored in the repository. Although the narrative in the separately maintained Word case study V9 (not included in this repository patch) now matches public `main`, its screenshots have not yet been verified against the current public-main report. Add screenshots only after checking them against that report.

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

Public `main` is the recruiter-facing source baseline; the documented QA evidence is scoped in [QA.md](./QA.md).

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

QA is documented as a risk-based manual process. The repository contains a project-authored manual QA record for the Scenario Planner title change and a QA PBIX artifact; it does not provide an automated test suite or independently reproduced test logs. See [QA.md](./QA.md).

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
├── sql/
│   ├── raw/
│   ├── staging/
│   └── practise/
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

### SQL and MySQL Data Architecture

The repository includes MySQL table and view definitions organised across three schemas:

- `raw` — source data / extract layer
- `staging` — transformation layer
- `practise` — reporting layer, including dimensional tables and analytical views used by the Power BI project

The SQL scripts document the current database objects. They are provided for code review and portfolio transparency; they do not constitute a complete, independently reproducible ELT pipeline.

[Browse SQL scripts](sql/)

---

## Project Status

**Recruiter-facing baseline:** public `main` at `80490e6`

**Release status:** the documented `1.0.0` baseline is not backed by a Git tag.

**Development approach:** Power BI Project + Git + GitHub

---

## Author

Designed and developed by **Dip Panchal**.
