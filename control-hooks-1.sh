#!/bin/sh

git status -s > .git/MODIFIED_FILES
if grep -q "Makefile" .git/MODIFIED_FILES; then
  if ! grep -e "ci" -e "build" .git/COMMIT_EDITMSG; then
    echo >&2 "Error: ci or build as a commit type"
    rm .git/MODIFIED_FILES
    exit 1
  fi
fi
rm .git/MODIFIED_FILES
exit 0