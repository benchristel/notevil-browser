#!/usr/bin/env bash

which browserify || npm i -g browserify
which uglifyjs || npm i -g uglifyjs

browserify index.js \
  | uglifyjs -m -c unsafe=true,hoist_vars=true,join_vars=true --support-ie8 --mangle-props \
  > notevil-browser.min.js

cat original-license.js \
    notevil-browser.min.js \
  > notevil-browser.min.js.tmp

mv notevil-browser.min.js.tmp notevil-browser.min.js
