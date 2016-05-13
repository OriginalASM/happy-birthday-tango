#!/bin/bash
shopt -s globstar nullglob

echo "Building HTML Template"
mkdir -p dist
rm -rf dist/*

for file in src/**/*.{html,htm}
do
  htmlmin -o dist/${file#*/} $file
done

for less in src/**/*.less
do
  css=${less%.less}
  css=${css#*/}.css
  lessc $less dist/${css} -x
done

