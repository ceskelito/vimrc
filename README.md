<h1 align="center" id="title">VIMRC</h1>

<p id="description">My vim configuration file</p>

<h2>🛠️ Installation Steps:</h2>

<p>0. install vim-plug: https://github.com/junegunn/vim-plug</p>

if you are on LINUX you can use this command 
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
<br>

<p>1. copy this commands in your shell</p>

```
cd                   
git clone https://github.com/ProssimoCentauro/vimrc.git proxvimrc
mv .vimrc .vimrc_before_prox
cp ./proxvimrc/.vimrc .
rm -rf proxvimrc
```
<br>

<p>2. enter vim and execute this command</p>

```
:PlugInstall
```

<h2>💖Like my work?</h2>

If you like this configuration remember to give a star to this repo ⭐!
