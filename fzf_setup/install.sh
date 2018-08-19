#!/bin/sh

echo "Setting up FZF..."

echo "Do you have access to internet? (y|N)?"
read userin
if [ "$userin" != "y" ]
then
  tar -xvf files/fzf.tgz -C ~/.fzf
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install
cp dotfile.fzf.bash ~/.fzf.bash
cp dotfile.fzf-marks.plugin.bash ~/.fzf-marks.plugin.bash
cp dotfile.mymacros.bash ~/.mymacros.bash
echo "FZF (bookmarks and macros) now setup. Re-login for changes to take effect."

exit
