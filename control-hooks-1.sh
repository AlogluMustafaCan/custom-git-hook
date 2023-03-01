#!/bin/sh -xv
git status -s > .git/MODIFIED_FILES
commit_type="dockerfile jenkinsfile makefile requirements"
for types in $commit_type; do
  echo "$types"
  if grep -q -i "$types" .git/MODIFIED_FILES; then
    if ! grep -e "ci" -e "build" .git/COMMIT_EDITMSG; then
      echo >&2 "Error: ci or build as a commit type"
      rm .git/MODIFIED_FILES
      exit 1
    fi
  fi
done
rm .git/MODIFIED_FILES
exit 0