# Biblioteca Calibre

Reglas y procedimientos para mantener la biblioteca de ebooks. Este repo guarda
solo reglas y scripts; los libros y `metadata.db` viven en la Raspberry y nunca
se versionan acá.

## Setup

- **Biblioteca:** `books`, en la Raspberry (`192.168.1.15`), montada por SMB en
  la Mac como `/Volumes/media/books`.
- **Calibre de escritorio (Mac):** herramienta de curaduría. Su Content Server
  (`localhost:8080`) es lo que usa el MCP `calibre`.
- **Calibre-Web (Raspberry):** acceso desde afuera de casa, OPDS y subida de
  libros desde el celular.
- **Kindle (KOReader):** lee la biblioteca por OPDS contra Calibre-Web.

## Integridad

`metadata.db` es SQLite sobre un share de red, compartido entre Calibre y
Calibre-Web. Estas reglas existen para no corromperlo.

1. **Un escritor a la vez.** Calibre de escritorio se abre para una sesión de
   curaduría y se cierra al terminar. Calibre-Web solo puede escribir (subir
   libros) cuando Calibre de escritorio está cerrado.
2. **Calibre-Web sube, no edita.** Desde Calibre-Web solo se suben libros; los
   metadatos se corrigen después desde Calibre de escritorio / MCP.
3. **No tocar las carpetas a mano.** Nunca renombrar, mover ni borrar archivos
   dentro de `books/` por fuera de Calibre.
4. **Antes de escribir, verificar** que el MCP responde (`calibre_ping`) y que
   la biblioteca activa es `books`.
5. **Operaciones destructivas** (borrar libros, borrar formatos, fusionar):
   mostrar primero qué se va a hacer y esperar confirmación explícita.

## Convenciones de metadatos

| Campo | Regla |
|---|---|
| Título | Título real, subtítulo tras dos puntos. Sin año, editorial ni nombre de archivo. |
| Autor | "Nombre Apellido", una entrada por persona. Nunca "Apellido, Nombre". |
| Serie | Solo series reales (ficción o colecciones numeradas). No usar para agrupar temas. |
| Identificadores | ISBN siempre que exista. Sin identificadores inventados o mal tipados. |
| Idioma | Siempre cargado (`eng`, `spa`). |
| Editorial | Nombre normalizado, una sola grafía por editorial (p. ej. "O'Reilly Media"). |
| Fecha | Fecha de publicación de la edición, no la del archivo. |
| Tapa | La tapa real de la edición, no la primera página del PDF. |
| Comentarios | Sinopsis o vacío. Nunca restos del nombre de archivo. |

## Tags

Vocabulario cerrado: los tags son el menú de navegación de OPDS en el Kindle.

- **Exactamente un tag de tipo por libro:** `Técnico`, `No ficción`, `Ficción`.
- **Uno o dos tags de tema** de esta lista:
  - Técnico / No ficción: `C++`, `Embedded`, `Diseño de software`, `Carrera`,
    `Finanzas`, `Robótica`, `Ciencia y sociedad`
  - Ficción: el género (`Ciencia ficción`, `Policial`, ...)
- **Un tema nuevo** se agrega a esta lista solo cuando hay un segundo libro que
  lo justifique, y se pregunta antes de crearlo.
- Los tags que vienen en el archivo (BISAC, palabras clave del editor) se
  descartan siempre.
- El estado de lectura no va en tags.

## Formatos

- **EPUB** es el formato canónico.
- **PDF** solo si no existe EPUB o si el libro depende del layout.
- **MOBI** no se conserva cuando hay EPUB.

## Procedimientos

### Alta desde la Mac

1. El archivo va a `~/Downloads` (nunca directo a la biblioteca).
2. Importar con `calibre_add_book`.
3. Buscar ISBN (`calibre_extract_isbn`) y completar metadatos
   (`calibre_recover_metadata`).
4. Asignar tipo, tema e idioma según las reglas de arriba.
5. Mostrar el resultado antes de dar el alta por cerrada.

### Bandeja de entrada (libros subidos por Calibre-Web)

Un libro sin tag de tipo es un libro sin curar. Buscar con:

```
not tags:"=Técnico" and not tags:"=No ficción" and not tags:"=Ficción"
```

A cada resultado se le aplican los pasos 3 a 5 del alta.

### Mantenimiento (mensual o cada ~10 libros)

1. Revisar la bandeja de entrada.
2. `calibre_quality_report` y `calibre_find_duplicates`.
3. Verificar que no haya tags fuera del vocabulario.
4. Revisar las tapas mirándolas (ver abajo); el reporte de calidad no las evalúa.
5. Reportar solo lo que requiera una decisión.

### Tapas

Ninguna herramienta detecta una tapa incorrecta: hay que mirar la imagen. El
caso típico es un PDF cuya "tapa" es la portadilla interior o la primera página.

1. Bajar la tapa actual de `http://localhost:8080/get/cover/<id>/books` y mirarla.
2. Si está mal, buscar la real por ISBN (editorial, Amazon, Open Library) y
   mirarla antes de aplicarla; preferir la de mayor resolución.
3. Aplicar con `calibredb set_metadata <id> --field cover:<archivo>` contra el
   Content Server.
