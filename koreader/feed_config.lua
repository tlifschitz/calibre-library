return {--do NOT change this line

 --HELP:
 -- use syntax: {"http://your-url.com", limit=max_number_of_items_to_be_created, download_full_article=true/false},

 -- remember to put coma at the end of each line!

 -- you can also edit this file in external text editor. Config file is located under:
 -- <your_download_directory>/feed_config.lua
 -- default: <koreader_dir>/news/feed_config.lua


 -- DETAILS:
 -- set 'limit' to "0" means no limit.

 -- 'download_full_article=true' - means download full article (may not always work correctly)
 -- 'download_full_article=false' - means use only feed description to create feeds. Sometimes this is only a summary or the first few lines, sometimes it's the full article.
 -- default value is 'false' (if no 'download_full_article' entry)

 -- 'include_images=true' - means download any images on the page and include them in the article
 -- 'include_images=false' - means ignore any images, only download the text (faster download, smaller file sizes)
 -- default value is 'false' (if no 'include_images' entry)

 -- 'enable_filter=true' - means filter using a CSS selector to delimit part of the page to just that and removes broken/annoying elements (does not apply if download_full_article=false)
 -- 'enable_filter=false' - means no such filtering and including the full page
 -- default value is 'false'

 -- 'filter_element="name_of_css.element.class" - means to filter the chosen CSS selector, it can be easily picked using a modern web browser
 -- The default value is empty. The default list of common selectors is used as fallback if this value is set.

 -- 'block_element="name_of_css.element.class" - means to remove the chosen CSS element, it can be easily picked using a modern web browser
 -- The default value is empty. The default list of common annoyances is used as fallback if this value is set.

 -- 'max_age = "7d"' - skip items older than this duration.
 --   Format: <integer><unit>. Units: s (second), m (minute), h (hour),
 --   d (day), w (week), M (month=30d), y (year=365d).
 --   M and y are fixed-length approximations (not calendar months/leap years).
 --   Examples: "30m", "12h", "7d", "1M".
 --   Feed must provide <pubDate> (RSS) or <updated>/<published> (Atom).
 --   If the feed lacks a date field, sync will error and ask you to remove
 --   this option.
 --   Default: not set (no age filter).

-- Optional 'credentials' element is used to authenticate on subscription based articles.
-- It is itself comprised of a 'url' strings, that is the url of the connexion form,
-- and an 'auth' table that contains form data used for user authentication {form_key = value, …}.
-- Exampple: credentials={url="https://secure.lemonde.fr/sfuser/connexion", auth={email="titi@gmouil.com", password="xxxx"}}

 -- comment out line ("--" at line start) to stop downloading source


 -- LIST YOUR FEEDS HERE:

 { "https://github.com/koreader/koreader/releases.atom", limit = 20, download_full_article=false, include_images=false, enable_filter=true, filter_element = "div.release-main-section", block_element = ""},
 { "https://ourworldindata.org/atom.xml", limit = 20 , download_full_article=true, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://embeddedartistry.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://embedded.fm/blog?format=rss", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.righto.com/feeds/posts/default", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://herbsutter.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.sandordargo.com/feed.xml", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://newsletter.pragmaticengineer.com/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.construction-physics.com/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.worksinprogress.news/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.quantamagazine.org/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.bitsaboutmoney.com/archive/rss/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://jvns.ca/atom.xml", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://interrupt.memfault.com/feed.xml", limit = 20, download_full_article=true, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://lethain.com/feeds.xml", limit = 20, download_full_article=true, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://cenital.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://seul.ar/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://panamarevista.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://alquimiaseconomicas.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://tech.eu/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://thechipletter.substack.com/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://stratechery.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.noahpinion.blog/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://danluu.com/atom.xml", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://jamesclear.com/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://ofdollarsanddata.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://fs.blog/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://calnewport.com/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://kk.org/thetechnium/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://collabfund.com/feed.xml", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.henrikkarlsson.xyz/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://sive.rs/en.atom", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://charlesduhigg.substack.com/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.sumapositiva.com/feed", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://www.themarginalian.org/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},
 { "https://seths.blog/feed/", limit = 20, download_full_article=false, include_images=true, enable_filter=false, filter_element = "", block_element = ""},

}--do NOT change this line
