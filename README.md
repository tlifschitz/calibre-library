# calibre-library

Reglas y procedimientos para mantener prolija una biblioteca personal de
[Calibre](https://calibre-ebook.com), pensados para que los ejecute un agente
([Claude Code](https://claude.com/claude-code)) a través de
[calibre-mcp](https://github.com/caelum29/calibre-mcp).

Este repo no contiene libros ni la base de datos de Calibre: solo las
convenciones y el modo de trabajo.

## Cómo está armado

```
Mac (curaduría)                      Raspberry Pi (servidor)
┌──────────────────────────┐         ┌─────────────────────────┐
│ Claude Code              │         │ biblioteca Calibre      │
│   └─ calibre-mcp         │         │ (libros + metadata.db)  │
│        └─ Content Server │── SMB ──│                         │
│           de Calibre     │         │ Calibre-Web ── OPDS ────┼──▶ Kindle (KOReader)
└──────────────────────────┘         └─────────────────────────┘
```

- **Calibre de escritorio** es la herramienta de curaduría; el agente escribe a
  través de su Content Server.
- **Calibre-Web** sirve la biblioteca fuera de casa y por OPDS, y permite subir
  libros desde el celular.
- **KOReader** en el Kindle navega la biblioteca por OPDS, así que los tags son
  literalmente su menú.

## Qué hay acá

- [`CLAUDE.md`](./CLAUDE.md): las reglas completas. Claude Code las carga
  automáticamente al abrir una sesión en este directorio.

En resumen:

- **Integridad:** un solo escritor a la vez sobre `metadata.db`; Calibre-Web
  sube libros pero no edita metadatos.
- **Metadatos:** título real, autores como "Nombre Apellido", ISBN, idioma,
  editorial normalizada y tapa real.
- **Tags:** vocabulario cerrado, con un tag de tipo (`Técnico`, `No ficción`,
  `Ficción`) y uno o dos de tema por libro.
- **Formatos:** EPUB como canónico; PDF solo cuando no hay alternativa.
- **Bandeja de entrada:** un libro sin tag de tipo es un libro sin curar.

## Uso

1. Abrir Calibre (con el Content Server activo) y Claude Code en este directorio.
2. Pedir lo que haga falta, por ejemplo:
   - "agregá el libro que está en Downloads"
   - "revisá la bandeja de entrada"
   - "hacé el mantenimiento"
3. Cerrar Calibre al terminar.

## Requisitos

- Calibre con el Content Server activo y escrituras locales permitidas.
- `calibre-mcp` registrado en Claude Code con `CALIBRE_MCP_ENABLE_WRITE=1`.
