# Copilot Prompts — Commercial Performance Hub

This document contains reusable GitHub Copilot prompts for maintaining the Commercial Performance Hub and future Power BI projects.

The prompts are designed to make development, documentation, change analysis and QA repeatable.

---

# 1. Change Analysis

Use after making a change and before committing.


Review the current Git diff for this Power BI project.

Do not modify any files.

Provide a concise change-impact report containing:

1. What changed
2. Why the change appears to have been made
3. Semantic-model impact
4. Measure / DAX impact
5. Report / visual impact
6. Dependencies affected
7. Potential breaking changes
8. Recommended QA checks

Separate confirmed findings from assumptions.

Do not invent business logic or requirements.
Use the actual Git diff and project files as the source of truth.


## 2. Generate Change Record (Use after the change has been implemented and reviewed.)

Review the current Git diff and create a Change Record using:

docs/templates/CHANGE_TEMPLATE.md

Do not modify the Power BI model or report.

Populate only information supported by the Git diff and project files.

Include:

- Date
- Branch
- Change type
- What changed
- Why
- Impact
- Dependencies
- Recommended QA

Do not invent information.

If the reason for a change cannot be determined from the available information, state:

"Reason not determinable from repository evidence."

Return the proposed Change Record for review.
Do not write it to disk until I approve it.


## 3. Generate QA Checklist (Use after implementing a feature or change.)

Review the current Git diff and identify the QA checks required for this change.

Do not modify any files.

Use docs/templates/QA_TEMPLATE.md as the structure.

Determine which validation areas are relevant:

- Data / KPI validation
- Semantic model
- Measures / DAX
- Calculation groups
- Relationships
- Field parameters
- Visuals
- Filters
- Tooltips
- Bookmarks
- Navigation
- Scenario functionality
- Price sensitivity
- Performance

Do not require irrelevant tests.

Return:

1. Required QA checks
2. Reason each check is relevant
3. Potential regression areas

Do not claim that QA has passed.
QA must be performed separately.


## 4. Update CHANGELOG (Use only after QA has passed.)

Review the approved Git diff and completed QA record.

Prepare a concise CHANGELOG entry using the existing CHANGELOG.md format.

Include only confirmed changes.

Use:

### Added
### Changed
### Fixed
### Removed
### QA

Only include headings that contain information.

Do not invent functionality.

Do not modify CHANGELOG.md yet.

Return the proposed entry for review first.


## 5. Documentation Impact Analysis (Use when making a significant architectural or modelling change.)

Review the current Git diff.

Determine whether the change requires updates to:

- README.md
- docs/Architecture.md
- docs/Development.md
- docs/QA.md
- CHANGELOG.md

For each document return:

Document | Update Required? | Reason | Suggested Section

Do not modify files.

Only recommend documentation changes that are supported by the actual project change.


## 6. Architecture Documentation Update (Use when the architecture genuinely changes.)

Review the current Power BI project and Git diff.

Determine whether the documented architecture remains accurate.

Compare the implementation against:

docs/Architecture.md

Identify:

1. Outdated statements
2. Missing architectural components
3. Incorrect assumptions
4. Sections requiring updates

Do not rewrite the entire document.

Provide only the minimum required changes.

Do not modify files until approved.


## 7. Measure Documentation (Use when measures are added, renamed or significantly changed.)

Review the semantic-model Git diff.

Identify measures that were:

- Added
- Removed
- Renamed
- Significantly changed

For each affected measure provide:

Measure
Previous Name
New Name
Folder
Purpose
Dependencies
Business Logic Impact
QA Recommendation

Use the actual semantic-model definitions as the source of truth.

Do not infer business meaning where it cannot be established from the model.

Do not modify any files.


## 8. Rename Impact Analysis (Use before renaming measures.)

Before making any measure renames, analyse the proposed changes.

For each rename identify:

- Direct DAX dependencies
- Calculation group references
- Field parameter references
- Visual/report references where available
- Tooltip references
- Filter references
- Conditional formatting references
- Other report-layer dependencies

Return:

Current Name | Proposed Name | Dependency Count | Risk | Recommended Action

Do not rename anything.

Clearly identify dependencies that cannot be inspected with the available project metadata.


## 9. Delete Safety Check (Use before deleting measures, columns or other model objects.)

Before deleting the proposed objects, perform a dependency and report-usage analysis.

Check:

1. Semantic-model dependencies
2. DAX references
3. Calculation groups
4. Field parameters
5. Report visuals
6. Filters
7. Tooltips
8. Bookmarks
9. Conditional formatting
10. Other report-layer references available in the PBIP project

For each object return:

Object | Semantic Dependencies | Report Usage | Risk | Safe to Delete?

Do not delete anything.

If report-layer usage cannot be verified, mark it as:

"Unavailable"

and classify the object as:

"Not safe to delete."

Do not assume zero usage when the report layer cannot be inspected.


## 10. Pre-Commit Review (Use before committing a feature branch.)

Perform a pre-commit review of the current Git diff.

Do not modify files.

Check for:

- Unexpected files
- Unrelated changes
- Accidental DAX changes
- Unexpected measure changes
- Unexpected report changes
- Debug/test artefacts
- Local settings/cache files
- Documentation inconsistencies
- Potential breaking changes

Return:

1. Expected changes
2. Unexpected changes
3. Risks
4. Recommended action

Do not approve the commit automatically.


## 11. Post-QA Commit Summary (Use after manual QA is complete.)

The change has now been manually validated in Power BI Desktop.

Using:

- Git diff
- QA results
- Existing project documentation

prepare a concise commit message.

Format:

<type>: <short description>

Use one of:

feat
fix
refactor
docs
perf
test
chore

Do not include claims that are not supported by the change and QA results.


## 12. New Dashboard Documentation (Use when starting a new Power BI project.)

Review the current Power BI project.

Do not modify the project.

Generate a documentation starter pack using the repository templates.

Identify what can be established from the project itself:

- Report pages
- Semantic model
- Tables
- Relationships
- Measures
- Calculation groups
- Parameters
- Data sources
- Transformation approach
- Major business capabilities

Create proposed content for:

- README.md
- Architecture.md
- CHANGELOG.md
- QA.md
- Development.md

Do not invent business requirements.

Clearly mark information that requires confirmation from the developer/business owner.

Return the proposed documentation for review before writing files.


## 13. Documentation QA (Use before committing documentation.)

Review all project documentation.

Check:

README.md
Architecture.md
CHANGELOG.md
QA.md
Development.md

Validate:

1. Accuracy against the actual Power BI project
2. Consistent terminology
3. Consistent measure names
4. Consistent page names
5. Consistent architecture
6. No unsupported claims
7. No duplicated information
8. No contradictory statements
9. Correct version numbers
10. Correct Git workflow
11. Correct repository structure
12. Markdown formatting

Return:

Document | Issue | Severity | Recommended Change

Do not modify files.


## 14. Final Release Audit (Use before merging a release into main.)

Perform a final release audit.

Review:

- Git diff
- Semantic model
- Report definition
- Documentation
- CHANGELOG
- QA record

Confirm:

1. Intended changes are present
2. No unrelated changes are present
3. Required QA has been completed
4. Documentation reflects the release
5. CHANGELOG is updated
6. No known unresolved defects remain
7. Working tree is clean after commit

Return:

Release Status: PASS / FAIL

Then provide:

- Changes confirmed
- QA confirmed
- Documentation confirmed
- Outstanding risks
- Recommended next action

Do not modify files.


# Copilot Operating Rules

Copilot should follow these principles for this project.

1. Do not assume

Use repository evidence as the source of truth.

2. Do not silently change unrelated objects

Changes should remain within the requested scope.

3. Separate analysis from execution

When requested to analyse, do not modify files.

4. Identify uncertainty

If something cannot be verified, explicitly state:

"Unable to verify from available project metadata."

5. Preserve business logic

Do not change DAX logic unless explicitly requested.

6. Review before deletion

Never delete model objects based only on semantic-model dependency results when report-layer usage cannot be confirmed.

7. Human QA remains mandatory

Copilot analysis does not replace Power BI Desktop validation.

8. Git diff is the change boundary

The Git diff should be reviewed before committing significant changes.