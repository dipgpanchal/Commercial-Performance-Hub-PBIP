# Changelog

All significant changes to the Commercial Performance Hub are documented here.

---

# Documented Initial Baseline — Unversioned

## Status

The repository documentation labels the initial baseline as QA-approved. This is a project-recorded status, not a formal release tag; no Git tags are present.

## Report Areas

The baseline includes:

- Executive Summary
- Product Performance
- Store Performance
- Inventory Health
- Scenario Planner
- Price Sensitivity

## Executive Summary

Includes:

- Revenue KPI
- Trading Profit KPI
- Trading Margin KPI
- Units Sold KPI
- Transactions KPI
- 24-month trend analysis
- Selected KPI metric comparison
- Category analysis
- Store analysis
- Key Business Insights

## Product Performance

Includes:

- Product revenue analysis
- Product profit analysis
- Trading margin analysis
- Product ranking
- Margin improvement analysis
- Pareto analysis
- Product detail table
- Product KPI summary

## Store Performance

Includes:

- Store revenue analysis
- Top / bottom store analysis
- Store ranking
- Revenue contribution
- ABC classification
- Store detail analysis

## Inventory Health

Includes:

- Inventory cost
- Healthy positions
- Replenishment risk
- Excess stock risk
- Units sold trend
- Inventory health detail
- Recommended actions
- Status indicators

## Scenario Planner

Includes:

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

On this public-main baseline, the effective volume change is the selected Volume Change % plus Price Change % multiplied by selected Elasticity. The separately maintained Word case study V9, which is not included in this repository patch, has been revised to match this implementation.

## Price Sensitivity

Includes:

- Price Change %
- Elasticity
- Scenario Revenue
- Scenario Profit
- Scenario Margin %
- Scenario Units
- Price Sensitivity Curve
- Outcome Comparison
- Product Opportunities

Elasticity assumptions:

| Value | Label |
|---:|---|
| -2.0 | Very High |
| -1.0 | High |
| -0.5 | Moderate |
| 0.0 | No Impact |
| +0.5 | Inverse |

## Semantic Model

- 36 tables
- 9 relationships
- 274 measures
- 1 Comparison calculation group
- 4 calculation items
- Measure naming standardised
- Display folders applied
- Visibility rules applied
- Dependent references updated
- Field parameter bindings updated

## QA

The original baseline documentation records the following checks as completed:

- KPI reconciliation
- Measure validation
- Visual validation
- Filter validation
- Tooltip validation
- Scenario validation
- Report navigation validation

No automated test suite or detailed test-output logs are included in the repository. See [QA.md](./QA.md) for the evidence scope.

## Version Control

The solution was converted from PBIX to PBIP for source control.

Initial Git baseline:

`Initial QA Signed Baseline`

The baseline was pushed to the GitHub repository.

No formal version tag was found in Git history.

---

## 2026-10-14 — Documentation alignment

Updated recruiter-facing documentation to describe the public-main model and its scenario logic, document MySQL import and refresh limitations, and qualify QA/provenance claims. The separately maintained Word case study, which is not included in this repository patch, was subsequently revised as V9 to align its measure count and Scenario Planner description with public `main`.

---

## 2026-10-01

### Added

- Added `Commercial_Performance_Hub_QA_Signed.pbix.pbix` to public `main` (commit `80490e6`, “PBIX QA Pass Hub”). The artifact is not an automated test report.

---

## 18/08/2026

### Changed

- Updated the Scenario Planner title icon from 📅 to 📐.

---

# Future Releases

Future changes will be recorded using the following structure:

## [Version] — YYYY-MM-DD

### Added

### Changed

### Fixed

### Removed

### QA