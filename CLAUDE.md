# Calibre Library

Rules and procedures for maintaining the ebook library. This repo holds only
rules and scripts; the books and `metadata.db` live on the Raspberry Pi and are
never versioned here.

## Setup

- **Library:** `books`, on the Raspberry Pi (`192.168.1.15`), mounted over SMB
  on the Mac as `/Volumes/media/books`.
- **Calibre desktop (Mac):** the curation tool. Its Content Server
  (`localhost:8080`) is what the `calibre` MCP server talks to.
- **Calibre-Web (Raspberry Pi):** access from outside the house, OPDS, and book
  uploads from the phone.
- **Kindle (KOReader):** reads the library over OPDS from Calibre-Web.

## Integrity

`metadata.db` is SQLite on a network share, shared between Calibre and
Calibre-Web. These rules exist to keep it from getting corrupted.

1. **One writer at a time.** Calibre desktop is opened for a curation session
   and closed when done. Calibre-Web may only write (upload books) while
   Calibre desktop is closed.
2. **Calibre-Web uploads, it does not edit.** Only uploads happen in
   Calibre-Web; metadata is fixed afterwards from Calibre desktop / MCP.
3. **Never touch the folders by hand.** Never rename, move, or delete files
   inside `books/` outside of Calibre.
4. **Before writing, verify** that the MCP server responds (`calibre_ping`) and
   that the active library is `books`.
5. **Destructive operations** (deleting books, deleting formats, merging):
   show what is going to happen first and wait for explicit confirmation.

## Metadata conventions

| Field | Rule |
|---|---|
| Title | The real title, subtitle after a colon. No year, publisher, or filename leftovers. |
| Author | "First Last", one entry per person. Never "Last, First". |
| Series | Real series only (fiction or numbered collections). Not for grouping topics. |
| Identifiers | ISBN whenever one exists. No made-up or mistyped identifiers. |
| Language | Always set (`eng`, `spa`). |
| Publisher | Normalized name, one spelling per publisher (e.g. "O'Reilly Media"). |
| Date | Publication date of the edition, not the file's date. |
| Cover | The real cover of the edition, not the first page of the PDF. |
| Comments | A synopsis or empty. Never filename leftovers. |

## Tags

Closed vocabulary: tags are the OPDS navigation menu on the Kindle. Tag names
are in Spanish and must be used exactly as written here.

- **Exactly one type tag per book:** `Técnico`, `No ficción`, `Ficción`.
- **One or two topic tags** from this list:
  - Técnico / No ficción: `C++`, `Embedded`, `Diseño de software`, `Carrera`,
    `Finanzas`, `Robótica`, `Ciencia y sociedad`
  - Ficción: the genre (`Ciencia ficción`, `Policial`, ...)
- **A new topic** is added to this list only when a second book justifies it,
  and only after asking.
- Tags that come with the file (BISAC codes, publisher keywords) are always
  discarded.
- Reading status does not go in tags.

## Formats

- **EPUB** is the canonical format.
- **PDF** only when no EPUB exists or the book depends on its layout.
- **MOBI** is not kept when an EPUB exists.

## Procedures

### Adding a book from the Mac

1. The file goes to `~/Downloads` (never straight into the library).
2. Import it with `calibre_add_book`.
3. Find the ISBN (`calibre_extract_isbn`) and fill in the metadata
   (`calibre_recover_metadata`).
4. Assign type, topic, and language following the rules above.
5. Show the result before considering the book done.

### Inbox (books uploaded through Calibre-Web)

A book without a type tag is an uncurated book. Find them with:

```
not tags:"=Técnico" and not tags:"=No ficción" and not tags:"=Ficción"
```

Apply steps 3 to 5 of the procedure above to each result.

### Maintenance (monthly, or every ~10 books)

1. Go through the inbox.
2. Run `calibre_quality_report` and `calibre_find_duplicates`.
3. Check that no tags fall outside the vocabulary.
4. Review the covers by looking at them (see below); the quality report does
   not evaluate them.
5. Report only what needs a decision.

### Covers

No tool detects a wrong cover: the image has to be looked at. The typical case
is a PDF whose "cover" is the inner title page or its first page.

1. Download the current cover from
   `http://localhost:8080/get/cover/<id>/books` and look at it.
2. If it is wrong, find the real one by ISBN (publisher, Amazon, Open Library)
   and look at it before applying it; prefer the highest resolution.
3. Apply it with `calibredb set_metadata <id> --field cover:<file>` against the
   Content Server.
