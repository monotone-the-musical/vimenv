#!/bin/sh

if [ "$1" == "del" ]
then
  rm -rf ~/.vim_backup.*
fi

backupdir=".vim_backup.`date +%Y%m%d`"

mkdir -p ~/${backupdir}

mv ~/.vim ~/${backupdir}

mv ~/.vimrc ~/${backupdir}

cp -p -R ./dot_vim_downloaded ~/.vim 

cp ./dot_vimrc ~/.vimrc

# restore views
cp -p -R ~/${backupdir}/.vim/view ~/.vim/

echo ; echo "vim environment setup. Original environment backed up to ~/${backupdir}" ; echo

exit
