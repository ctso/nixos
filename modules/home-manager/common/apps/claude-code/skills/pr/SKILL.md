---
name: pr
description: Commit changes using conventional commits and open a pull request via gh CLI.
disable-model-invocation: true
allowed-tools: Read, Bash, Glob, Grep
---

## Safety Rules

**CRITICAL — these rules must NEVER be violated:**

- **NEVER commit to `main` or `master`.** If the current branch is `main` or `master`, stop immediately and inform the user.
- **NEVER push to `main` or `master`.** Only push feature/topic branches.
- **NEVER force push.** Do not use `--force`, `--force-with-lease`, or `-f` with `git push`.

## Step 1: Verify Branch

```bash
git branch --show-current
```

If the current branch is `main` or `master`, **STOP** and tell the user they must create or switch to a feature branch first. Do not proceed.

## Step 2: Check for a PR Description Template

Look for a PR template in the repository:

```bash
ls .github/pull_request_template.md .github/PULL_REQUEST_TEMPLATE.md .github/PULL_REQUEST_TEMPLATE/ 2>/dev/null
```

If a template exists, read it and use it as the basis for the PR body — fill in its sections based on the changes. If no template exists, use the default template in Step 5.

## Step 3: Commit Uncommitted Changes

1. Run `git status` to check for uncommitted changes.
2. If there are staged or unstaged changes:
   a. Stage relevant changes with `git add <files>`.
   b. Write a commit message following [Conventional Commits](https://www.conventionalcommits.org/):
      - Format: `<type>(<optional scope>): <description>`
      - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`
      - Example: `feat(auth): add OAuth2 login flow`
      - Run `git log --format="%s" -n 10` to match existing scope/style conventions if present.
   c. Always include a co-author trailer in the commit message:
      ```
      Co-Authored-By: Claude <noreply@anthropic.com>
      ```
   d. Commit the changes.
3. If there are no changes to commit, continue to Step 4.

## Step 4: Gather PR Context

1. Determine the base branch:
   ```bash
   git config --local --get "branch.$(git branch --show-current).workmux-base" 2>/dev/null || echo "main"
   ```
2. Get the diff: `git diff <base>...HEAD`
3. Get commit messages: `git log <base>...HEAD --format="%s"`
4. Read changed files if needed to understand broader context.

## Step 5: Write PR Description

**Always prefix the PR body with this notice:**

```
✨🤖 This pull request was co-authored by Claude Code.
```

If a PR template was found in Step 2, fill it in below the AI notice. Otherwise, use this default template:

```markdown
✨🤖 This pull request was co-authored by Claude Code.

## Summary

[1-2 sentences: what this PR does and why]

## Changes

- [Key change 1]
- [Key change 2]
- [Key change 3]

## Testing

[How the changes were verified]
```

Guidelines:

- Lead with a concise summary of what the PR does.
- Explain the "why" before the "how."
- Use conversation context to inform the description.
- Be direct and to the point.

## Step 6: Push and Create PR

1. Push the branch to the remote:
   ```bash
   git push -u origin HEAD
   ```
   **Reminder: NEVER force push. NEVER push to main/master.**

2. Create the PR with `gh`:
   ```bash
   gh pr create --base <base-branch> --title "<title>" --body "<body>"
   ```
   - PR title: max 72 characters, clear and descriptive.

3. Output the PR URL when complete.
