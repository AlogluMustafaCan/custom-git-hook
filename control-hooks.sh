#!/bin/sh

# Check if commit message
if ! grep -q "ref:" .git/COMMIT_EDITMSG; then
  echo >&2 "Error: Commit message must contain ref as a footer exp:'ref: NELD-1212'"
  exit 1
fi