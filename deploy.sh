#!/bin/bash

# adopted from https://github.com/timwis/static-api
set -ev && \
cd ./dist && \
remote_repo="https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "Travis CI" && \
git config user.email "travis@srehwald.github.io" && \
git add . && \
git commit -m'build' && \
git push --force --quiet $remote_repo master:$remote_branch > /dev/null 2>&1 && \
rm -fr .git && \
cd ../