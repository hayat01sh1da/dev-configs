#!/bin/sh

cd ~/

# Update System Packages
sudo apt update && sudo apt full-upgrade -y && sudo apt auto-remove -y && sudo apt clean

# Flush and Update `.lang_env` Repositories
lang_envs=('ndenv' 'rbenv' 'pyenv')
langs=('node' 'ruby' 'python')

for i in "${!lang_envs[@]}";
do
  cd .${lang_envs[$i]#*.}
  git branch | grep -v 'origin/HEAD' | xargs -n1 git branch -D
  git branch -r | sed 's/^[[:space:]]*//' | grep -v '^origin/HEAD' | grep -v '^upstream/HEAD' | grep -Ev '^upstream/(master|main)$' | xargs -n1 git branch -rD
  git rev-parse --abbrev-ref HEAD | xargs git pull origin

  cd ./plugins/${langs[$i]}-build/
  git branch | grep -v 'origin/HEAD' | xargs -n1 git branch -D
  git branch -r | sed 's/^[[:space:]]*//' | grep -v '^origin/HEAD' | grep -v '^upstream/HEAD' | grep -Ev '^upstream/(master|main)$' | xargs -n1 git branch -rD
  git rev-parse --abbrev-ref HEAD | xargs git pull origin
  cd ~/
done

# Update Gems via Gemfile and Bundler
gem update --system
gem install bundler
bundle install
bundle lock --add-checksums
bundle update --all
cp ~/Gemfile ~/dev-scripts/lib/
cp ~/Gemfile.lock ~/dev-scripts/lib/

# Update Python Libraries via pip and `requirements.txt`
pip install --upgrade pip
pip install -r ~/requirements.txt --upgrade
pip freeze > ~/requirements.lock
cp ~/requirements.txt ~/dev-scripts/lib/
cp ~/requirements.lock ~/dev-scripts/lib/

# Update Node Packages via pnpm and `package.json`
npm install -g pnpm
pnpm update
pnpm install
pnpm update
cp ~/package.json ~/dev-scripts/lib/
cp ~/pnpm-lock.yaml ~/dev-scripts/lib/
