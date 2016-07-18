
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

echo "Set color mode to 256? (y|N):"
read userin
if [ "$userin" != "y" ]
then
  echo "not setting"
else
  echo "export TERM=xterm-256color" >> ~/.bashrc
  echo ; echo "256 color set" ; echo ; echo
fi

echo "Set zenburn to default color-scheme? (y|N):"
read userin
if [ "$userin" != "y" ]
then
  echo "not setting"
else
  echo "colorscheme zenburn" >> ~/.vimrc
  echo ; echo ; echo "zenburn set as default"
  destdir=`find /usr/share -type f -name peachpuff.vim | sed s/"peachpuff.vim"/""/g`
  echo ; echo "recomend copying zenburn to $destdir"
fi
echo ; echo ; echo
echo "-------------------------------------------------------------------------------------------" ; echo
echo "Setup complete. Re login then from vim run and run :PlugInstall to install any plugins."
echo ; echo "-------------------------------------------------------------------------------------------"
echo ; echo

