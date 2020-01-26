#!/bin/bash

BOOK_NAME=midpoint-book
TARGET_DIR=target


rm -r $TARGET_DIR
mkdir -p $TARGET_DIR

echo "### BUILDING HTML (single page)"
asciidoctor -o $TARGET_DIR/$BOOK_NAME.html master.adoc

#echo "### BUILDING HTML (chunked)"

# Simple, obsolete
#asciidoctor -r ./extensions/multipage-html5-converter.rb -b multipage_html5 -o $TARGET_DIR/$BOOK_NAME.html master.adoc

# Does not work with 2.0, See https://github.com/owenh000/asciidoctor-multipage
#asciidoctor -r ./extensions/asciidoctor-multipage.rb -b multipage_html5 -o target/midpoint-book.html master.adoc

echo "### COPY IMAGES"
cp -R images target/images

echo "### BUILDING PDF"
asciidoctor-pdf -o $TARGET_DIR/$BOOK_NAME.pdf master.adoc

echo "### BUILDING EPUB3"
asciidoctor-epub3 -o $TARGET_DIR/$BOOK_NAME.epub master.adoc
