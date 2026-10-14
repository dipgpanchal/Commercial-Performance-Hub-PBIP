# Commercial Performance Hub — Architecture

## Purpose and flow

The solution combines commercial performance reporting, inventory analysis, and assumption-based scenario modelling in a Power BI Project (PBIP):

```text
MySQL database `practise`
    -> Power Query imports
    -> Power BI semantic model and DAX
    -> six visible report pages
    -> business decision support
```

This documents the import boundary visible in the public PBIP definitions. It does not claim that the upstream database build is reproducible from the GitHub repository.

## MySQL import boundary

The Power Query M definitions specify a MySQL endpoint of `localhost:3306` and database/schema `practise`. The imported objects are:

| Object | Model role |
|---|---|
| `dim_date` | Calendar, week, ISO-week, and fiscal-period attributes |
| `dim_products` | Product identifiers, names, category, cost, and price |
| `dim_stores` | Store identifiers, names, location, and opening date |
| `fact_sales` | Sale date, store, product, units, revenue, cost, and profit fields |
| `fact_inventory_snapshot` | Store/product stock on hand, inventory cost/value, and `load_dt` |
| `vw_fact_product_weekly` | Imported weekly product measures and week-over-week fields |
| `vw_fact_product_rolling` | Imported rolling product measures and history fields |

The model relates `fact_sales` to product, store, and date dimensions; `fact_inventory_snapshot` to product and store dimensions; and both analytical-view tables to product and date dimensions. Public `main` at `80490e6` contains 36 tables, 9 relationships, 274 measures (including hidden/helper measures), one calculation group, and four calculation items.

Both product analytical views are loaded into the semantic model. A search of public-main report visual bindings and DAX definitions did not identify references to their columns in current visuals or measures. They should not be described as currently powering report analysis; whether they are reserved for later use is not established here.

## Transformation and reproducibility boundary

The repository contains the PBIP model and report definitions, but no tracked `.sql` files or source CSVs. SQL scripts exist in the author’s separate local project folder, not in this public repository. Consequently, the table/view creation, raw-data loading, and upstream transformation steps cannot be recreated from a GitHub clone alone.

The Power BI model uses Power Query imports from MySQL for the seven objects above. DAX measures and a Comparison calculation group implement report calculations. The current model definitions do not establish every transformation performed before those imports.

## Scenario and inventory logic

The public-main Scenario Planner exposes price, cost, volume, and elasticity assumptions. Its effective volume change is selected volume change plus price change multiplied by selected elasticity; this drives core scenario units, revenue, and cost. The separately maintained Word case study V9, which is not included in this repository patch, has been revised to match this implementation.

For Price Sensitivity, the elasticity-driven demand component is price change multiplied by selected elasticity. The outcome calculations also include the selected volume assumption and relevant price/cost assumptions. These are user-defined what-if calculations, not statistically validated forecasts.

Inventory weeks cover is stock on hand divided by average weekly units sold over the last eight weeks when both are positive. Classifications and actions are:

| Classification condition | Classification | Recommended action |
|---|---|---|
| No inventory row | Blank | — |
| Stock on hand = 0 and recent sales > 0 | Out of Stock | Replenish Now |
| Stock on hand > 0 and recent sales = 0 | Dead Stock | Clearance Required |
| Weeks Cover < 2 | Low Stock | Replenish Soon |
| Weeks Cover ≤ 12 | Healthy | No Action |
| Weeks Cover ≤ 26 | Overstock | Reduce Purchase Orders |
| Weeks Cover > 26 | Excess Stock | Review / Markdown |

`fact_inventory_snapshot.load_dt` is a data-load date, not evidence of the physical stock observation date. No separate physical observation date is established by the model definition.

## Setup

To open the report, install Power BI Desktop with PBIP support and open `Commercial_Performance_Hub.pbip`. To refresh, provide a MySQL server, credentials, and a `practise` database containing all seven imported objects. Power BI Desktop manages MySQL credentials through its data source settings.

The current connection definitions expect `localhost:3306`. This repository does not provide database DDL, view-creation scripts, or input CSV files; a fresh setup requires those sources separately. No credentials are stored in this architecture documentation.

## Source and licence status

The supplied case study refers to “Mexico Toy Sales” / “Toy Sales” on Kaggle, but the exact listing URL, dataset creator, real/synthetic status, licence, and redistribution terms have not been verified from the repository materials. Confirm the source and permissions before making attribution or reuse claims.