
cp -R .vim ~/

cp .vimrc ~/

mkdir -p ~/.vim/plugged/

cp ./pre_plugged/* ~/.vim/plugged/

cd ~/.vim/plugged/

for a in `ls -1 *.tgz`; do tar -zxvf $a; done

rm -f *.tgz


echo ; echo
echo "Setup complete. Re login then from vim run :PlugInstall"
echo "Then run setup2.sh"
echo ; echo
