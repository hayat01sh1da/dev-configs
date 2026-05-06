#!/bin/sh

links=('Desktop' 'Downloads' 'Videos' 'Music' 'Pictures' 'Documents')
user='binlh'

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
