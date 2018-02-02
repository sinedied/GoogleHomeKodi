#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then

rm -rf * .*
git clone https://${GH_TOKEN}@github.com/sinedied/GoogleHomeKodi.git .
git remote add upstream https://github.com/OmerTu/GoogleHomeKodi.git
(
  set -e
  git checkout master
  git pull --rebase upstream master
  git push --force
)
(
  set -e
  git checkout origin/develop -b develop
  git pull --rebase upstream develop
  git push --force
)
echo "Updated from upstream"

fi
