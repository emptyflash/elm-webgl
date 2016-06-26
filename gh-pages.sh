#!/bin/bash
set -e

rm -rf gh-pages || exit 0;

mkdir gh-pages

# compile JS using Elm
cd examples
for i in crate cube first-person thwomp triangle; do
  elm make $i.elm --yes --output ../gh-pages/$i.html
done

# copy the textures
cp -R texture ../gh-pages
cp -R screenshots ../gh-pages

# init branch and commit
cd ../gh-pages
git init
git add .
git commit -m "Deploying to GH Pages"
git push --force "git@github.com:elm-community/elm-webgl.git" master:gh-pages
