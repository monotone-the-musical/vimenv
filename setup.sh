
cp -R .vim ~/

cp .vimrc ~/

mkdir -p ~/.vim/plugged/

cp ./pre_plugged/* ~/.vim/plugged/

cd ~/.vim/plugged/

for a in `ls -1 *.tgz`; do tar -zxvf $a; done

rm -f *.tgz

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install

cd -

cp dotfile.fzf.bash ~/.fzf.bash

cp dotfile.fzf-marks.plugin.bash ~/.fzf-marks.plugin.bash

cp dotfile.mymacros.bash ~/.mymacros.bash

echo "Set zenburn to default color-scheme? (y|N):"
read userin
if [ "$userin" != "y" ]
then
  echo "not setting"
else
  echo "colorscheme zenburn" >> ~/.vimrc
  mkdir -p ~/.vim/colors/
  cp vim_color_schemes/zenburn.vim ~/.vim/colors/
  echo "export TERM=xterm-256color" >> ~/.bashrc
  echo ; echo ; echo "zenburn set as default"
fi
echo ; echo ; echo
echo "-------------------------------------------------------------------------------------------" ; echo
echo "Setup complete. Re login then from vim run and run :PlugInstall to install any plugins."
echo ; echo "-------------------------------------------------------------------------------------------"
echo ; echo
exit
