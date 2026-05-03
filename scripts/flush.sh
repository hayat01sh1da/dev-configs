#!/bin/sh

# Delete Cache, History and Tmp Directories and/or files
targets=('.aws' '.azure' '.bash_history' '.cache/' '.irb_history' '.local/' '.node_repl_history' '.python_history' 'node_modules/' 'pnpm-lock.yaml' 'snap/' 'tmp/')

cd ~/

for target in "${targets[@]}";
do
  rm -rf $target
done

# Flush Gems
gem uninstall -I -a -x --user-install --force

# Flush Python Libraries
pip uninstall -y -r requirements.lock
