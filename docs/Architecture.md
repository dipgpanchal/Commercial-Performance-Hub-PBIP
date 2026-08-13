# Commercial Performance Hub — Architecture

## 1. Purpose

This document describes the architecture and design approach used for the Commercial Performance Hub Power BI solution.

The solution combines commercial performance reporting, operational analysis and scenario modelling within a single Power BI project.

---

# 2. Solution Architecture

At a high level, the solution follows this structure:


Source Data
     ↓
MySQL (ELT / transformation layer)
     ↓
Transformed / curated data
     ↓
Power BI Semantic Model
     ↓
DAX / Calculation Logic
     ↓
Power BI Report
     ↓
Business Insights

### Data Transformation Approach

MySQL is used as the primary data transformation and preparation layer.

The solution follows an ELT-oriented approach, with data transformation performed upstream rather than placing the majority of transformation logic inside Power Query.

This approach allows the database layer to perform the heavy data preparation work while Power BI focuses on:

- Semantic modelling
- Business measures and DAX calculations
- Calculation groups
- Reporting-period logic
- Scenario analysis
- Price sensitivity modelling
- Visualisation and user interaction

This separation helps keep the Power BI model focused on analytical and presentation responsibilities while reducing unnecessary transformation workload within the report layer.