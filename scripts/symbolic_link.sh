#!/bin/sh

cd ~/

links=('Desktop' 'Downloads' 'Videos' 'Music' 'Pictures' 'Documents')
user='binlh'

echo "========== Creating Symbolic Links for Windows User Directories =========="
for link in ${links[@]}
do
  if [ ! -n $link ]; then
    ln -s /mnt/c/Users/$user/$link ~/
  fi
done

if [ ! -n 'Home' ]; then
  ln -s /mnt/c/Users/$user/ ~/Home
  mv $user Home
fi
echo "========== Finished Creating Symbolic Links for Windows User Directories =========="

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"
