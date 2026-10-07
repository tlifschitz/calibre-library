# calibre-library

Rules and procedures for keeping a personal [Calibre](https://calibre-ebook.com)
library tidy, written to be carried out by an agent
([Claude Code](https://claude.com/claude-code)) through
[calibre-mcp](https://github.com/caelum29/calibre-mcp).

This repo contains no books and no Calibre database: only the conventions and
the way of working.

## How it is set up

```
Mac (curation)                       Raspberry Pi (server)
┌──────────────────────────┐         ┌─────────────────────────┐
│ Claude Code              │         │ Calibre library         │
│   └─ calibre-mcp         │         │ (books + metadata.db)   │
│        └─ Calibre        │── SMB ──│                         │
│           Content Server │         │ Calibre-Web ── OPDS ────┼──▶ Kindle (KOReader)
└──────────────────────────┘         └─────────────────────────┘
```

- **Calibre desktop** is the curation tool; the agent writes through its
  Content Server.
- **Calibre-Web** serves the library outside the house and over OPDS, and
  allows uploading books from a phone.
- **KOReader** on the Kindle browses the library over OPDS, so the tags are
  literally its menu.

## What is in here

- [`CLAUDE.md`](./CLAUDE.md): the full rules. Claude Code loads them
  automatically when a session is opened in this directory.

In short:

- **Integrity:** a single writer at a time on `metadata.db`; Calibre-Web
  uploads books but does not edit metadata.
- **Metadata:** real title, authors as "First Last", ISBN, language, normalized
  publisher, and the real cover.
- **Tags:** a closed vocabulary, with one type tag (`Technical`,
  `Non-fiction`, `Fiction`) and one or two topic tags per book.
- **Formats:** EPUB is canonical; PDF only when there is no alternative.
- **Inbox:** a book without a type tag is an uncurated book.

## Usage

1. Open Calibre (with the Content Server running) and Claude Code in this
   directory.
2. Ask for whatever is needed, for example:
   - "add the book that is in Downloads"
   - "go through the inbox"
   - "run the maintenance"
3. Close Calibre when done.

## Requirements

- Calibre with the Content Server running and local writes allowed.
- `calibre-mcp` registered in Claude Code with `CALIBRE_MCP_ENABLE_WRITE=1`.
