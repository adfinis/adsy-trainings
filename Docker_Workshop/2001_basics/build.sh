#!/bin/bash

for md in *.md; do
  echo "Converting ${md}"
  pandoc \
    --to revealjs \
    --template revealjs-template.pandoc \
    --standalone \
    --section-divs \
    "${md}" \
    -o "${md%.md}.html"
done
