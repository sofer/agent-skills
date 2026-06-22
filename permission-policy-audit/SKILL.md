---
name: permission-policy-audit
description: Compare permission and approval policies across Codex, Claude, and shared agent policy files. Use when the user asks whether agent permissions are consistent, why one platform asks for approval and another does not, whether Codex and Claude allow/deny equivalent commands or tools, or whether permissioning should be aligned before editing provider config.
---

# Permission policy audit

## Purpose

Audit permission intent and enforcement across agent platforms, focused on significant differences that affect what agents may do without asking. Produce a decision-ready report; do not silently change permissions.

Use `agent-config-audit` instead when the request is broader than permissions, such as skills, hooks, MCP servers, plugins, startup behaviour, or provider compatibility in general.

## Inspect

Read only the files needed for the comparison. Start with:

- Shared intent: `~/.agents/config/command-permission-policy.md`
- Shared instructions: `~/.agents/AGENTS.md`
- Codex config: `~/.codex/config.toml`, `~/.codex/config.json`, `~/.codex/rules/default.rules`
- Claude config: `~/.claude/settings.json`, `~/.claude/settings.local.json`
- Provider docs only if local config names are unclear; prefer local CLI help and config files before web search.

Avoid large histories, logs, session transcripts, caches, telemetry, and auth files unless the user explicitly asks and the data is necessary. Never print secrets.

## Normalise

Convert each platform into the same comparison categories:

- Approval mode: when the platform asks the user before running a command or tool.
- Filesystem scope: what paths are readable/writable without extra confirmation.
- Command allow rules: broad allows, prefix allows, trusted command classes, and exact-command allows.
- Command deny rules: destructive commands, secret exposure, production writes, git pushes, commits, package installs, deploys.
- Network and external side effects: web access, APIs, email, comments, issue trackers, production databases.
- MCP/tool permissions: tools that are always allowed, require approval, or are denied.
- Runtime constraints: sandbox settings, trusted project rules, current-session approval policy, and provider-specific enforcement that can override shared policy.

Treat shared policy as intended behaviour, and provider config as enforcement. When they disagree, call it drift.

## Significance

Report only differences that change real agent behaviour or user risk. Significant drift includes:

- One platform can write, push, deploy, install, email, comment, or mutate production data without approval while another cannot.
- One platform blocks a common approved workflow, causing repeated unnecessary prompts.
- One platform allows a high-risk command class that shared policy says should require confirmation.
- A provider-specific sandbox or trusted-project rule prevents the shared policy from working as intended.
- Secrets or auth files are readable by one platform in a way that matters for the requested workflow.

Usually ignore cosmetic differences, duplicated exact-command allows, provider-specific cache/history paths, and rules that are stricter but do not affect the requested workflow.

## Workflow

1. Restate the requested comparison scope: platforms, workflow area, and whether the user asked for reporting only or permission edits.
2. Inspect the shared policy and relevant provider configs.
3. Build a small matrix of allowed, denied, and ask-first behaviours for the requested workflow area.
4. Classify drift by severity:
   - `High`: could permit destructive, external, or production-affecting actions without the intended confirmation.
   - `Medium`: blocks or prompts for workflows the shared policy explicitly allows, or allows non-destructive actions inconsistently.
   - `Low`: confusing or stale config with little practical effect.
5. Recommend options, not automatic edits, unless the user explicitly asked to update config. For each option, state which file to change and what behaviour changes.
6. If edits are requested, keep them minimal, provider-local where possible, and avoid changing secrets, auth, caches, histories, or generated runtime state.
7. After edits, state whether a restart, new session, or provider reload is needed.

## Output

Use this structure:

```markdown
## Summary

<one paragraph explaining whether permissioning is aligned enough for the requested workflow>

## Significant drift

- Severity: <High|Medium|Low>
  Area: <approval mode / filesystem / command allow / command deny / external side effects / tools>
  Evidence: <file paths and exact setting names, no secrets>
  Impact: <what behaviour differs>
  Option: <leave as-is or update one/both platforms>

## No material drift

- <areas checked where differences were cosmetic or provider-specific only>

## Recommended changes

- <specific config edit, rationale, and whether user confirmation is needed>

## Verification

- <files inspected and commands used>
- <what needs a fresh session or live test>
```

If there is no significant drift, say so clearly and list residual uncertainty.
