#!/bin/sh

set -e

DIR=$(dirname "$0")

cd $DIR

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out public branch into public"
#git worktree add -B public public origin/public
git worktree add -B public public public

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo
echo "Updating public branch"
cd public && git add --all && git commit -m "Publishing to public (publish.sh)"
#git push origin public

rsync --size-only -Pvr public/ caddy-01.hez.yx.fi:/www/joneskoo.yx.fi/
