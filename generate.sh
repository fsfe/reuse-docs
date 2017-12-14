#! /bin/bash
for i in 1.2 2.0; do
  sed '/<!--START_HTML-->/,/<!--END_HTML-->/d' < /usr/share/blog/content/practices/$i.md \
 | sed -e 's/<\(a\|br\)\s[^>]*>//g' \
 | sed -e 's/<\/[^>]*>//g' \
 | sed '/+++/,/+++/d' > /page-pdf-$i.md
