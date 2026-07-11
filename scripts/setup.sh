#!/bin/sh

cd ~/ || { echo "Failed to cd to home directory; aborting." >&2; exit 1; }

echo "========== Updating System Packages =========="
# Update System Packages
sudo apt update && sudo apt full-upgrade -y && sudo apt auto-remove -y && sudo apt clean
sudo apt list --installed > ~/dev-configs/lib/apt/apt-installed-packages.lock
echo "========== Finished Updating System Packages =========="

# Flush and Update `.lang_env` Repositories
lang_envs=('ndenv' 'rbenv' 'pyenv')
langs=('node' 'ruby' 'python')

for i in "${!lang_envs[@]}";
do
  echo "========== Flushing and Updating ${lang_envs[$i]} =========="
  # Guard each cd: the branch -D commands below must only run inside the
  # intended repository, never in whatever directory we happened to be in.
  cd ".${lang_envs[$i]#*.}" || { echo "Skipping ${lang_envs[$i]}: directory not found." >&2; continue; }
  git branch | grep -v 'origin/HEAD' | xargs -n1 git branch -D
  git branch -r | sed 's/^[[:space:]]*//' | grep -v '^origin/HEAD' | grep -v '^upstream/HEAD' | grep -Ev '^upstream/(master|main)$' | xargs -n1 git branch -rD
  git rev-parse --abbrev-ref HEAD | xargs git pull origin

  cd "./plugins/${langs[$i]}-build/" || { echo "Skipping ${langs[$i]}-build: directory not found." >&2; cd ~/ || exit 1; continue; }
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
bundle update --bundler
bundle install
bundle lock --add-checksums
bundle update --all
cp ~/Gemfile ~/dev-configs/lib/gem/
cp ~/Gemfile.lock ~/dev-configs/lib/gem/
echo "========== Finished Updating Gems via Gemfile and Bundler =========="

# Update Python Libraries via pip and `requirements.txt`
echo "========== Updating Python Libraries via pip and 'requirements.txt' =========="
pip install --upgrade pip
pip install -r ~/requirements.txt --upgrade
pip freeze > ~/requirements.lock
cp ~/requirements.txt ~/dev-configs/lib/pip/
cp ~/requirements.lock ~/dev-configs/lib/pip/
echo "========== Finished Updating Python Libraries via pip and 'requirements.txt' =========="

# Update Node Packages via pnpm and `package.json`
echo "========== Updating Node Packages via pnpm and 'package.json' =========="
npm install -g pnpm
pnpm update
pnpm install
pnpm update
cp ~/package.json ~/dev-configs/lib/pnpm/
cp ~/pnpm-lock.yaml ~/dev-configs/lib/pnpm/
cp ~/pnpm-workspace.yaml ~/dev-configs/lib/pnpm/
echo "========== Finished Updating Node Packages via pnpm and 'package.json' =========="

# Claude Code
cp ~/Home/Development/personal/CLAUDE.md ~/dev-configs/lib/claude/CLAUDE.md

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"

exit 0
