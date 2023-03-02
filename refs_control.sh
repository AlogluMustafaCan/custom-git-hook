#!/bin/sh

# Check if commit message
if ! grep -q "Refs:" .git/COMMIT_EDITMSG; then
  echo >&2 "Error: Commit message must contain ref as a footer exp:'Refs: <Taskname>'"
  exit 1
fi