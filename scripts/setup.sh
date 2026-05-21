#!/bin/sh

cd ~/

echo "========== Updating System Packages =========="
# Update System Packages
sudo apt update && sudo apt full-upgrade -y && sudo apt auto-remove -y && sudo apt clean
echo "========== Finished Updating System Packages =========="

# Flush and Update `.lang_env` Repositories
lang_envs=('ndenv' 'rbenv' 'pyenv')
langs=('node' 'ruby' 'python')

for i in "${!lang_envs[@]}";
do
  echo "========== Flushing and Updating ${lang_envs[$i]} =========="
  cd .${lang_envs[$i]#*.}
  git branch | grep -v 'origin/HEAD' | xargs -n1 git branch -D
  git branch -r | sed 's/^[[:space:]]*//' | grep -v '^origin/HEAD' | grep -v '^upstream/HEAD' | grep -Ev '^upstream/(master|main)$' | xargs -n1 git branch -rD
  git rev-parse --abbrev-ref HEAD | xargs git pull origin

  cd ./plugins/${langs[$i]}-build/
  git branch | grep -v 'origin/HEAD' | xargs -n1 git branch -D
  git branch -r | sed 's/^[[:space:]]*//' | grep -v '^origin/HEAD' | grep -v '^upstream/HEAD' | grep -Ev '^upstream/(master|main)$' | xargs -n1 git branch -rD
  git rev-parse --abbrev-ref HEAD | xargs git pull origin
  echo "========== Finished Flushing and Updating ${lang_envs[$i]} =========="
  cd ~/
done

# Update Gems via Gemfile and Bundler
echo "========== Updating Gems via Gemfile and Bundler =========="
gem update --system
gem install bundler
bundle install
bundle lock --add-checksums
bundle update --all
cp ~/Gemfile ~/dev-configs/lib/
cp ~/Gemfile.lock ~/dev-configs/lib/
echo "========== Finished Updating Gems via Gemfile and Bundler =========="

# Update Python Libraries via pip and `requirements.txt`
echo "========== Updating Python Libraries via pip and 'requirements.txt' =========="
pip install --upgrade pip
pip install -r ~/requirements.txt --upgrade
pip freeze > ~/requirements.lock
cp ~/requirements.txt ~/dev-configs/lib/
cp ~/requirements.lock ~/dev-configs/lib/
echo "========== Finished Updating Python Libraries via pip and 'requirements.txt' =========="

# Update Node Packages via pnpm and `package.json`
echo "========== Updating Node Packages via pnpm and 'package.json' =========="
npm install -g pnpm
pnpm update
pnpm install
pnpm update
cp ~/package.json ~/dev-configs/lib/
cp ~/pnpm-lock.yaml ~/dev-configs/lib/
echo "========== Finished Updating Node Packages via pnpm and 'package.json' =========="

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"
