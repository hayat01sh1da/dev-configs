#!/bin/sh

# Delete Cache, History and Tmp Directories and/or files
targets=(
'.aws'
'.azure'
'.bash_history'
'.cache/'
'.irb_history'
'.local/'
'.node_repl_history'
'.python_history'
'node_modules/'
'pnpm-lock.yaml'
'snap/'
'tmp/'
)

cd ~/

echo "========== Flushing Cache, History and Tmp Directories and/or files =========="
for target in "${targets[@]}";
do
  rm -rf $target
done
echo "========== Done Flushing Cache, History and Tmp Directories and/or files =========="

echo "========== Flushing Gems =========="
# Flush Gems
gem uninstall -I -a -x --user-install --force
echo "========== Done Flushing Gems =========="

echo "========== Flushing Python Libraries =========="
# Flush Python Libraries
pip uninstall -y -r requirements.lock
echo "========== Finished Flushing Python Libraries =========="

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"
