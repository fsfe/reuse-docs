#!/bin/bash
set -e
files=$1
dir_in=$2
dir_out=$3
for i in $files; do
  echo "Pre-generating and converting ${dir_in}/${i} to ${dir_out}/reuse-${i%.*}.pdf"
  sed '/<!--START_HTML-->/,/<!--END_HTML-->/d' < "${dir_in}"/"${i}" \
  | sed -e 's/<\(a\|br\)\s[^>]*>//g' \
  | sed -e 's/<\/[^>]*>//g' \
  | sed '/+++/,/+++/d' > "${dir_in}"/pdf-"${i}"

  # convert source to pdf while stripping away file extension
  pandoc -s "${dir_in}"/pdf-"${i}" -o "${dir_out}"/reuse-"${i%.*}".pdf
done
