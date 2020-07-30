# Source Code of Practical Identity Management With MidPoint Book

This is source code of "Practical Identity Management With MidPoint" book.

## Asciidoc

The Book is written in asciidoc and built using acsiidoctor.
Plain asciidoc is used.
We try to avoid use of asciidoctor-specific features and extensions whenever possible.

The book source code follows the "one sentence per line" convention.
Each chapter of the book is placed in a separate file, as are all the chapter-like blocks (colophon, introduction, etc.)
The entire book is assembled in `master.adoc` file.

All images for the book are maintained in `images` directory.
Filename of the image should start with a chapter number to keep the images organized.
Images that are used in many places in the book, title image and colophon images are not prefixed.

The book is rendered in three versions: HTML, PDF and EPUB.
Most asciidoc features work consistently in all three output formats.
However, there are some differences, given by the nature of the format:

* Table of contents (TOC) is handled differently for each format.
 We want TOC on the left side in HTML versions, we want dedicated TOC pages in PDF and EPUB is handling TOC in a native way.
 The `ifdef`s in `master.adoc` are used to handle that.

* Section numbering is handled differently for EPUB.
 In fact, current EPUB handling in asciidoctor quite strictly requires file-per-chapter structure and relies on it.
 It also relies on chapter numbering.
 Therefore `ifdef`s in `master.adoc` are used to set up the numbering needed for EPUB rendering.
 
* Cross-references are handled differently in every output format.
 Overall, handling of cross-references is very sensitive and tricky.
 The method that is used in the text now is the only way that seems to work well in all three output formats.
 It is important to main this precise way of cross-referencing. 

## Building The Book

The book can be built using asciidoctor.
The `master.adoc` is the master file used for building entire book.
All the chapters, introduction, conclusion, colophon and everything else is "included" from the master file. 

Plain asciidoctor can be used to build HTML version of the book:

`asciidoctor master.adoc`

PDF version of the book can be built using `asciidoctor-pdf`:

`asciidoctor-pdf master.adoc`

EPUB version of the book can be built using `asciidoctor-epub3`:

`asciidoctor-epub3 master.adoc`

There is a `build.sh` script that builds all the versions of the book, sets correct file names, copies the images and so on.

## Copyright

© 2015-2020 Radovan Semančík and Evolveum, s.r.o. All rights reserved.

This book is **not** open source.
Finished version of this book is distributed under the terms of Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License (CC BY-NC-ND).
However, the Creative Commons license **does not** apply to the source code.
Full copyright stated above applies to the source code.
You may use this source code only in accordance with a special license granted to you by Evolveum.
If you do not have such a license, you must not use this source code at all.
 