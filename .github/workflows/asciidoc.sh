#!/bin/bash
set -ex

mkdir -p ./output/homework-projects

CURRENT_PATH=`pwd`

asciidoctor --verbose -D ${CURRENT_PATH}/output/ index.adoc

asciidoctor-pdf --verbose -D ${CURRENT_PATH}/output/ -o technical-writing-course-brno.pdf index.adoc

find -iname "*index*.adoc" -path "*/homework-projects/*" -type f -exec asciidoctor --verbose {} \;

find -iname "*index*.adoc" -path "*/homework-projects/*" -type f -exec asciidoctor-pdf --verbose {} \;

find -path "*/homework-projects/*" -type d -exec cp -r --verbose {} ${CURRENT_PATH}/output/homework-projects/ \;

cp -r -t ${CURRENT_PATH}/output/ ${CURRENT_PATH}/slides/ ${CURRENT_PATH}/MUNI-students-spring2023.pdf

cp -t ${CURRENT_PATH}/output/homework-projects/ ${CURRENT_PATH}/homework-projects/index.html
