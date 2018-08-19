#!/bin/sh

rm -rf dot_vim_downloaded

cp -p -R -P dot_vim dot_vim_downloaded

cd dot_vim_downloaded/bundle/

./create_plugins.sh

find . -type d -name ".git" | xargs -I{} sh -c 'rm -rf {}'

exit
