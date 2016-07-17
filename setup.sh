
cp -R .vim ~/

cp .vimrc ~/

cp pre_plugged/* ~/.vim/plugged/

cd ~/.vim/plugged/

tar xvf *.tgz

rm -f *.tgz

cp dotfile.fzf.bash ~/.fzf.bash

cp dotfile.fzf-marks.plugin.bash ~/.fzf-marks.plugin.bash

echo ; echo
echo "Setup complete. Re login then from vim run :PlugInstall"
echo ; echo
