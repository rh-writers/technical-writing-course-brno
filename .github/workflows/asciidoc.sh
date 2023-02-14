#!/bin/sh
set -ex

mkdir -p ./output

CURRENT_PATH=`pwd`

asciidoctor --verbose -D ${CURRENT_PATH}/output/ index.adoc

asciidoctor-pdf --verbose -D ${CURRENT_PATH}/output/ -o technical-writing-course-brno.pdf index.adoc

cp -t ${CURRENT_PATH}/output/ README.md MUNI-students-spring2023.pdf
