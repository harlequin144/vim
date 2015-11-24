# Yet another man's vim files. 
This repo contains all my vim configs, plugins and notes. It also carries my vsvimrc
along with. 

## Windows Setup
In gvim, use `:version` to get the path for vim's xonfig directory.

Clone the repo to `$HOME\vimfiles`.

```bash
git clone https://github/harlequin144/vim.git ~/.vim
```

That should be it. The `_vimrc` file will be in there and will point vim to `vimrc`.

## Windows Setup
Clone into `~\.vim`

There are two options:
symlink `~/.vimrc` in this repo to `.vimrc` 

```bash
cd ~
ln .vimrc .vim/.vimrc
```

or make `~/.vimrc` look like this:

```bash
runtime vimrc
```


