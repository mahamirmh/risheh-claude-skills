# Engineering Consolidation Notice

## Source of Truth

Reusable company-wide engineering behavior belongs to:

`mahamirmh/risheh-engineering-agent`

## Status: staged skills consolidation

This repository remains a source for reusable Claude-oriented skills while the unified Agent establishes a provider-independent `skills` module.

Migration goal:

- preserve useful skill procedures,
- remove provider-specific assumptions where possible,
- bind skills to Engineering Laws and permission levels,
- keep deterministic automation outside skill prompts,
- expose reusable skills through the Agent/MCP layer rather than copying them into every project.

Do not create new company-wide engineering policy here. New shared skills should target the unified Agent unless they are intentionally provider-specific compatibility assets.

Do not archive until active skills have been inventoried and either migrated, replaced or explicitly retained as compatibility adapters.
