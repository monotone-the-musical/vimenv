
cp -R .vim ~/

cp .vimrc ~/

mkdir -p ~/.vim/plugged/

cp ./pre_plugged/* ~/.vim/plugged/

cd ~/.vim/plugged/

for a in `ls -1 *.tgz`; do tar -zxvf $a; done

rm -f *.tgz

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install

cp dotfile.fzf.bash ~/.fzf.bash

cp dotfile.fzf-marks.plugin.bash ~/.fzf-marks.plugin.bash

echo ; echo ; echo
echo "-------------------------------------------------------------------------------------------" ; echo
echo "Setup complete. Re login then from vim run and run :PlugInstall to install any plugins."
echo ; echo "-------------------------------------------------------------------------------------------" 
echo ; echo
