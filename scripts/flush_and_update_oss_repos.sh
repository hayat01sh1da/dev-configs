#!/bin/sh

cd ~/Home/Development/oss/

for project in $(ls -d ./*/);
do
  cd $project
  echo "========== Flushing and Updating $project =========="

  default_branch=$(git rev-parse --abbrev-ref origin/HEAD | cut -f2- -d/)
  default_remote_branch=$(git rev-parse --abbrev-ref origin/HEAD)
  default_upstream_branch=$(git rev-parse --abbrev-ref upstream/HEAD)

  if [ -n $default_branch ]; then
    git switch $default_branch
  fi

  if [ ! -n $default_branch ]; then
    git switch -c $default_branch $default_remote_branch
  fi

  git remote set-head upstream --auto
  git branch | sed s/^[[:space:]]*// | grep -Ev $default_branch | xargs -n1 git branch -D
  git branch -r | sed s/^[[:space:]]*// | grep -v '^(origin|upstream)$/HEAD' | grep -Ev $default_remote_branch | grep -Ev $default_upstream_branch | xargs -n1 git branch -rD
  git submodule update --remote --merge
  git config --global submodule.recurse true
  echo $default_branch | xargs -n1 git pull origin
  echo $default_branch | xargs -n1 git fetch upstream
  echo $default_upstream_branch | xargs -n1 git merge
  echo $default_branch | xargs -n1 git push origin
  git stash clear
  echo "========== Finished Flushing and Updating $project =========="
  cd ..
done

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"
