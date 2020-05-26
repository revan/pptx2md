# pptx2md

## PowerPoint to Markdown converter

A bash script to convert a PowerPoint document to Markdown.
I hacked this together in the back of Psych 101 lecture in 2014 since the
professor was distributing quite possibly the ugliest slides I've ever seen,
but I stopped working on it when I dropped the class a week later.

It had gotten a bit more attention than I'd expected, as far as broken
scripts go, so I rewrote in 2020 with _slightly_ saner practices.
(As sane as [parsing XML with regex](https://stackoverflow.com/a/1732454) gets,
I guess?)

I'm not sure I actually recommend using this, especially since PowerPoint has
since gone free, but I think this should at least be functional now.

The main features here are extracting (slash guessing) headings into markdown
headings, and embedding images as standalone files.

Uses standard unix tools in the script, but I believe it relies on some
features only in GNU sed.
The more sensible thing to do would be to rewrite using BeautifulSoup.

See the `testdata/` folder for a before/after example of processing.
