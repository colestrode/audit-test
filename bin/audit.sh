#!/bin/bash
BRANCH=`git rev-parse --abbrev-ref HEAD`
MESSAGE="$BRANCH npm audit fix"

if [[ $BRANCH = 'master' ]] || [[ $BRANCH = 'develop' ]] ; then
  echo 'skipping audit on '$BRANCH' branch'
  exit 0
fi

npm audit fix
git add `package*.json` npm-shrinkwrap.json
git commit -m "$MESSAGE"

