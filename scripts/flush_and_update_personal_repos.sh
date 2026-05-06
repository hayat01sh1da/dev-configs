#!/bin/sh

cd ~/Documents/development/

for project in $(ls -d ./*/);
do
  cd $project
  echo "===== Flushing and Updating $project ====="

  default_branch=$(git rev-parse --abbrev-ref origin/HEAD | cut -f2- -d/)
  default_remote_branch=$(git rev-parse --abbrev-ref origin/HEAD)

  if [ -n $default_branch ]; then
    git switch $default_branch
  fi

  if [ ! -n $default_branch ]; then
    git switch -c $default_branch $default_remote_branch
  fi

  git branch | sed s/^[[:space:]]*// | grep -Ev $default_branch | xargs -n1 git branch -D
  git branch -r | sed s/^[[:space:]]*// | grep -v ^origin/HEAD | grep -Ev $default_remote_branch | xargs -n1 git branch -rD
  git pull --recurse-submodules
  git submodule update --remote --merge
  git config --global submodule.recurse true
  git stash clear
  echo "===== Finished Flushing and Updating $project ====="
  cd ..
done
