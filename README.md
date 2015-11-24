# Yet another man's vim files. 
This repo contains all my vim configs, plugins and notes. It also carries my vsvimrc
along with. 

## Setup
Clone the repo into the vim directory. For linux, this is `~/.vim`. On windows,
use `~/vimfiles`. In gvim, this can be verified with `:version`.

```bash
git clone https://github/harlequin144/vim.git ~/.vim
```

#Create The `vimrc` and `gvimrc` Files
For linux:

```bash
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

Skip this step for windows. The `_vimrc` file within the vim repo serves this 
purpose. 


#Update The Submodules

```bash
git submodule init
git submodule update
```

#Upgrading Plugins
```bash
cd ~/.vim/bundle/plugin_dir
git pull origin master
```
or

```bash
cd ~/.vim/
git submodule foreach git pull origin master
```

