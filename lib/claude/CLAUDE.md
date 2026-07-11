# Workspace Guide

This directory contains multiple independent GitHub repositories owned by `hayat01sh1da` (one git repository per subdirectory; this parent directory itself is not a git repository).  
`github-wiki-organisers-wiki` is a wiki mirror and `working-report` is empty — exclude both from cross-repo tasks unless explicitly requested.

## 1. Recurring Task: Topic-Branch Summary Reports

When asked to summarise the changes of topic branches in each repository (in any phrasing, e.g. "Summarise the changes of topic branches in each repository according to PR template and export the reports as markdown files under each repository"), do the following:

Trigger phrases (non-exhaustive — match the intent, not the exact words):

- "Summarise the topic branches" — run the full task across all repositories.
- "Summarise the topic branch in `<repo>`" — run the task for that repository only.
- "Regenerate the PR descriptions" / "Update the PR descriptions for the new commits" — re-export the reports after further commits on the branches.

A one-off deviation stated in the same message (different filename, only committed changes, include working-tree changes, etc.) overrides these defaults for that run.

1. For each repository, diff the current topic branch against `master` (`git diff master...HEAD`).
2. Write the summary to `PR_DESCRIPTION.md` at the repository root, following that repository's `.github/PULL_REQUEST_TEMPLATE.md` structure exactly:
   - `## 1. Overview` — prose describing what the branch does and why.
   - `## 2. Key Changes & Differences` — the template's 4-column table
     (`|<Items> |Before |After |Changes & Differences |`). Adapt the first column's noun to the subject of the change (Gems / Libraries / Packages / Workflows / files). One row per changed item, derived from the actual diff.
   - `## 3. Summary` — outcome counts, follow-up actions, and operational notes.
   - `## 4. References` — absolute GitHub URLs to the changed files on the topic branch (`https://github.com/hayat01sh1da/<repo>/blob/<branch>/<path>`) plus relevant docs.
3. Leave `PR_DESCRIPTION.md` untracked — never commit or push unless explicitly asked.
4. Skip repositories whose topic branch has no diff against `master`.

## 2. Recurring Task: Opening Pull Requests

When explicitly asked to commit, push, and open PRs for work in the repositories, follow these conventions (a one-off deviation stated in the same message overrides them for that run).

Trigger phrases (non-exhaustive — match the intent, not the exact words):

- "Open PRs" / "Open pull requests in each repository" — run the full flow below (branch → commit → push → PR) in every repository with relevant changes.
- "Open a PR in `<repo>`" — run the full flow for that repository only.
- "Commit and push the changes" — create the branch, commit, and push only; do not open PRs.
- "Update the PRs" / "Reflect the new changes in the PRs" — commit and push further changes to the existing topic branches and refresh the PR descriptions.

1. Branch: `hayat01sh1da/<topic>/<kebab-case-summary>` created from `master`
   (e.g. `hayat01sh1da/github-actions/define-reviewers-and-assignees-in-daily-library-dependencies-update`).
2. Commit: one commit per repository containing only the files relevant to the task; message is an imperative sentence matching the branch summary (e.g. "Define reviewers and assignees in daily library dependencies update").
3. PR title: `[<topic>] <Summary in Title Case>`
   (e.g. `[github-actions] Define Reviewers and Assignees in Daily Library Dependencies Update`).
4. PR description: the same 4-section `.github/PULL_REQUEST_TEMPLATE.md` structure as section 1, with References linking the changed files on the topic branch.
5. Reviewers: request `hayat01sh1da`. GitHub rejects this on PRs authored by hayat01sh1da's own token ("Review cannot be requested from pull request author") — skip in that case rather than failing; it only works on PRs authored by someone else (e.g. `github-actions[bot]`).
6. Assignees: `claude[bot]` if assignable. The API silently ignores unassignable users (HTTP 201 but empty assignees) — as of 2026-07-08 no Claude GitHub App is installed, so this is a no-op; `github-actions[bot]` IS assignable even though `GET /repos/.../assignees/{user}` returns 404 for it.
7. Base branch is always `master`; cross-repo runs cover every repo with relevant changes and skip the rest.

## 3. Conventions

- Never commit, push, or open PRs unless explicitly asked; when asked, follow section 2.
- Never commit diffs until the user has committed them himself. Task requests like "fix it" authorize editing working trees (and API-side changes) only — leave all changes as uncommitted working-tree edits and report what is ready. Only run the branch/commit/push/PR flow when the message unambiguously asks for it (e.g. "commit and push", "open PRs").
- The `gh` CLI is not installed. Use the GitHub REST API instead, with the token from Git Credential Manager (`printf 'protocol=https\nhost=github.com\n\n' | git credential fill`); never print the token. Repo-level GitHub settings (e.g. Actions permissions) can be changed the same way.
- GitHub Actions workflow files follow `{language}--ci.yml` and
  `{language}--daily-dependencies-update.yml` naming; workflow names follow
  `{Language} - CI` and `{Language} - Daily Dependencies Update`.
- Scheduled workflows document cron times in JST (e.g. `0 15 * * *` = 0:00 JST).
- README Actions Status badges use the legacy name-based URL format
  (`https://github.com/hayat01sh1da/<repo>/workflows/<Workflow%20Name>/badge.svg`); keep them in sync with workflow name changes.
