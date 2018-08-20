#!/bin/sh

backupdir="~/.vim_backup.`date +%Y%m%d`"

mkdir -p ${backupdir}

mv ~/.vim ${backupdir}

mv ~/.vimrc ${backupdir}

cp -R -P ./dot_vim_downloaded ~/.vim 

cp ./dot_vimrc ~/.vimrc

echo ; echo "vim environment setup. Original environment backed up to ${backupdir}" ; echo

exit
