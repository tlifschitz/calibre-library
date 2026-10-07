# KOReader news feeds

RSS feeds for KOReader's News Downloader plugin on the Kindle. Last reviewed
2026-10-07: every feed below was fetched that day to check that it responds,
how often it publishes, and whether it carries full article text.

`feed_config.lua` in this folder is a copy of the active configuration. On the
Kindle it lives at `koreader/news/feed_config.lua`.

## How the plugin behaves

- Each sync downloads the newest `limit` items per feed and skips the ones
  already on the device. Every feed is set to `limit = 20`.
- Nothing is ever deleted automatically. Clean up with "Delete all downloaded
  items" in the plugin menu; the next sync downloads the newest items again.
- Each feed gets its own folder under `koreader/news/`.
- `download_full_article=true` is only needed for feeds that publish summaries.
- `max_age` skips items older than the given duration. It is not set, because
  it hides older posts from feeds that publish rarely.

## Active

### Embedded and hardware

| Feed | URL | Notes |
|---|---|---|
| Embedded Artistry | `https://embeddedartistry.com/feed/` | |
| Embedded.fm blog | `https://embedded.fm/blog?format=rss` | Elecia White |
| Interrupt (Memfault) | `https://interrupt.memfault.com/feed.xml` | Summary feed; full article download on. 219 items |
| Ken Shirriff | `https://www.righto.com/feeds/posts/default` | Chip reverse engineering; image heavy |

### C++ and software

| Feed | URL | Notes |
|---|---|---|
| Herb Sutter | `https://herbsutter.com/feed/` | |
| Sandor Dargo | `https://www.sandordargo.com/feed.xml` | Weekly |
| Julia Evans | `https://jvns.ca/atom.xml` | |
| Dan Luu | `https://danluu.com/atom.xml` | 6 MB feed with all 128 posts; may be too heavy for the Kindle |

### Career

| Feed | URL | Notes |
|---|---|---|
| The Pragmatic Engineer | `https://newsletter.pragmaticengineer.com/feed` | Gergely Orosz; paid posts are truncated |
| Will Larson | `https://lethain.com/feeds.xml` | Summary feed; full article download on |

### Science, technology and economics

| Feed | URL | Notes |
|---|---|---|
| Construction Physics | `https://www.construction-physics.com/feed` | Brian Potter |
| Works in Progress | `https://www.worksinprogress.news/feed` | |
| Quanta Magazine | `https://www.quantamagazine.org/feed/` | |
| Our World in Data | `https://ourworldindata.org/atom.xml` | Full article download on |
| The Chip Letter | `https://thechipletter.substack.com/feed` | Semiconductor history; about 2 a month |
| Stratechery | `https://stratechery.com/feed/` | Free weekly articles |
| Noahpinion | `https://www.noahpinion.blog/feed` | About 15 a month, long |
| Bits about Money | `https://www.bitsaboutmoney.com/archive/rss/` | Patrick McKenzie; monthly |
| Tech.eu | `https://tech.eu/feed/` | European startup funding news; daily, short |

### Argentina

| Feed | URL | Notes |
|---|---|---|
| Cenital | `https://cenital.com/feed/` | Political and economic analysis; daily |
| Seúl | `https://seul.ar/feed/` | Essays, liberal leaning |
| Panamá Revista | `https://panamarevista.com/feed/` | Essays and interviews, national-popular leaning |
| Alquimias Económicas | `https://alquimiaseconomicas.com/feed/` | Argentine economics; about 2 a month |

### Self-improvement

| Feed | URL | Notes |
|---|---|---|
| Of Dollars and Data | `https://ofdollarsanddata.com/feed/` | Nick Maggiulli; weekly |
| Farnam Street | `https://fs.blog/feed/` | About 3 a month, long |
| Cal Newport | `https://calnewport.com/feed/` | Weekly |
| Kevin Kelly | `https://kk.org/thetechnium/feed/` | |
| Morgan Housel | `https://collabfund.com/feed.xml` | Collab Fund blog |
| Henrik Karlsson | `https://www.henrikkarlsson.xyz/feed` | |
| Derek Sivers | `https://sive.rs/en.atom` | Very short posts |
| Charles Duhigg | `https://charlesduhigg.substack.com/feed` | |
| Suma Positiva | `https://www.sumapositiva.com/feed` | In Spanish; weekly, long |
| The Marginalian | `https://www.themarginalian.org/feed/` | Daily |
| Seth Godin | `https://seths.blog/feed/` | Daily, very short |
| James Clear | `https://jamesclear.com/feed` | Frozen since January 2020; an archive of 10 essays |

### Other

| Feed | URL | Notes |
|---|---|---|
| KOReader releases | `https://github.com/koreader/koreader/releases.atom` | Came with the default config |

## Reserve

Tested and working, not loaded. Candidates for rotating in.

| Feed | URL | Notes |
|---|---|---|
| Anfibia | `https://www.revistaanfibia.com/feed/` | Argentine long-form journalism; about 16 a month, very long |
| Buenos Aires Herald | `https://buenosairesherald.com/feed` | Argentine daily news in English |
| Latin America Risk Report | `https://boz.substack.com/feed` | Regional politics, in English |
| La Jungla del Poder | `https://lajungla.substack.com/feed` | Argentine politics; about 4 a month |
| Politico Europe Tech | `https://www.politico.eu/section/technology/feed/` | EU tech policy; daily |
| Sifted | `https://sifted.eu/feed` | European startups; summary feed, partly paywalled |
| Climate Tech VC | `https://www.ctvc.co/rss/` | About 5 a month, long |
| The Diff | `https://www.thediff.co/archive/rss/` | Finance and tech; partly paywalled |
| Import AI | `https://importai.substack.com/feed` | Weekly AI research digest |
| Interconnects | `https://www.interconnects.ai/feed` | AI; about 8 a month |
| Not Boring | `https://www.notboring.co/feed` | Long tech and business essays |
| IEEE Spectrum Robotics | `https://spectrum.ieee.org/feeds/topic/robotics.rss` | About 12 a month |
| IEEE Spectrum Semiconductors | `https://spectrum.ieee.org/feeds/topic/semiconductors.rss` | About 4 a month |
| Moontower | `https://moontower.substack.com/feed` | Options and quantitative thinking |
| Alpha Architect | `https://alphaarchitect.com/feed/` | Quant research summaries |
| Net Interest | `https://www.netinterest.co/feed` | Financial sector analysis |
| Zephyr Project | `https://www.zephyrproject.org/feed/` | About 10 a month |
| Arthur O'Dwyer | `https://quuxplusone.github.io/blog/feed.xml` | C++; about 3 a month |
| Espressif Developer | `https://developer.espressif.com/index.xml` | Summary feed |
| Old New Thing | `https://devblogs.microsoft.com/oldnewthing/feed` | Raymond Chen; daily, short |
| mcyoung | `https://mcyoung.xyz/atom.xml` | Deep systems posts; rare |
| Tanya Reilly | `https://noidea.dog/blog?format=rss` | Rarely updated |
| Raptitude | `https://www.raptitude.com/feed/` | About 2 a month |
| More To That | `https://moretothat.com/feed/` | Illustrated essays; about 2 a month |
| Ryan Holiday | `https://ryanholiday.net/feed/` | Weekly |
| Mo Gawdat | `https://mogawdat.substack.com/feed` | About 1 a month |
| Experimental History | `https://www.experimental-history.com/feed` | About 2 a month |
| Dynomight | `https://dynomight.net/feed.xml` | |

## Rejected

| Feed | Reason |
|---|---|
| La Nación, Infobae, El Cronista, Bloomberg Línea | About 100 items a day |
| Clarín, Ámbito, El Economista, Letra P | Headlines only |
| La Nación Tecnología | Consumer gadget coverage |
| Chequeado, elDiarioAR, Revista Crisis | Feed has no usable text or dates |
| Rest of World, Aeon, Psyche | Headlines only |
| Startupeable | Podcast episode notes |
| Contxto, LatamList | Infrequent or very short |
| EU-Startups, Silicon Canals, UKTN | Press-release style, high volume |
| Bert Hubert | Recent posts mostly in Dutch |
| Hackaday, IEEE Spectrum (main), LWN, EmbeddedRelated, CNX Software | High volume or summaries only |
| isocpp.org | Link aggregator |
| Nir Eyal, BJ Fogg, Peter Attia, Huberman | Headlines or minimal summaries |
| Mark Manson, Wait But Why, Tiago Forte, Ali Abdaal, David Perell | Inactive |
| Tim Ferriss | Podcast transcripts of about 9,000 words |
| Fluent C++, All About Circuits, Seedtable, Euractiv, Americas Quarterly | Feed blocked or unreachable |
| Oliver Burkeman, Simon Sinek, Sahil Bloom, Arthur Brooks, Zen Habits, Paul Graham, Inside European Deep Tech, Página 12 | No usable feed found |
