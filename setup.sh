#!/bin/sh


# setup folder structure
mkdir -p ~/bin
mkdir -p ~/Documents/workspace
mkdir -p ~/Documents/repos

# bin will need to be added to $PATH manually here in order have nave ready later on
export PATH=$HOME/bin:/usr/local/bin:$PATH

# brew setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Core utils
brew install coreutils
brew install findutils

# Dependencies
brew install jpeg-turbo
brew install optipng
brew install readline

# Apps
brew install the_silver_searcher
brew install git
brew install python3
brew install irssi
brew install unrar
brew install trash
brew install tree
brew install wget
brew install tig
brew install ffind
brew install wifi-password
brew install gpg
brew install hub
brew install asciinema
brew install neovim
brew install tmux
brew install fd

# setup nave
cd ~/Documents/repos
git clone https://github.com/isaacs/nave.git
ln -s ~/Documents/repos/nave/nave.sh ~/bin/nave

# setup node
nave install latest
nave use latest

# OSX native apps
brew tap caskroom/cask

function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask atom
installcask dropbox
installcask google-chrome
installcask firefox
installcask iterm2

# utils
installcask lastfm
installcask marshallofsound-google-play-music-player
installcask vlc
installcask 1password
installcask licecap
installcask skitch
installcask slack
installcask kap

# games
installcask steam
installcask minecraft
installcask openttd


# npm dependencies that I'm not likely to live without
npm install -g jsonlint
npm install -g eslint
npm install -g eslint_d
npm install -g eslintme
npm install -g grunt-cli
npm install -g gulp
npm install -g yo
npm install -g http-server
npm install -g ipt
npm install -g ntl
npm install -g fkill-cli
npm install -g localtunnel
npm install -g webtorrent-cli
npm install -g gzip-size-cli
npm install -g diff-so-fancy
npm install -g globby-cli
npm install -g svg-term
npm install -g json


# vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.config/nvim/autoload
ln -s ~/.vim/autoload/pathogen.vim ~/.config/nvim/autoload/pathogen.vim

# Go to bundle folder
cd ~/.vim/bundle/
ln -s ~/.vim/bundle ~/.config/nvim/bundle

# setup python support for neovim
pip2 install --user neovim
pip3 install --user neovim

# Get all plugins
git clone https://github.com/vim-scripts/bufkill.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/rking/ag.vim
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/simnalamburt/vim-mundo.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
echo "Syntastic will rely on code validation tools, such as jshint"
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/lifepillar/vim-solarized8
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/mhinz/vim-signify.git
git clone https://github.com/ruyadorno/vim-statline.git
git clone https://github.com/AndrewRadev/splitjoin.vim.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/ruyadorno/vim-change-indent.git
git clone https://github.com/groenewege/vim-less.git
git clone https://github.com/ap/vim-css-color.git
git clone https://github.com/hail2u/vim-css3-syntax
git clone https://github.com/othree/html5.vim.git
git clone https://github.com/othree/yajs.vim.git
git clone https://github.com/vim-scripts/SyntaxComplete.git
git clone https://github.com/othree/javascript-libraries-syntax.vim.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/ekalinin/Dockerfile.vim.git
git clone https://github.com/rizzatti/dash.vim.git
git clone https://github.com/tpope/vim-obsession.git
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/christoomey/vim-tmux-navigator.git


## Get dotfiles repo
cd ~/Documents/repos/
git clone https://github.com/ruyadorno/dotfiles.git
git clone https://github.com/rupa/z.git


## Setup symlinks
cd ~/
mkdir -p .config/nvim
ln -s Documents/repos/dotfiles/bashrc .bash_profile
ln -s Documents/repos/dotfiles/gitconfig .gitconfig
ln -s Documents/repos/dotfiles/gitignore_global .gitignore_global
ln -s Documents/repos/dotfiles/hgrc .hgrc
ln -s Documents/repos/dotfiles/vimrc .vimrc
ln -s Documents/repos/dotfiles/vimrc .config/nvim/init.vim
ln -s Documents/repos/dotfiles/tmux.conf .tmux.conf
ln -s Documents/repos/dotfiles/gpg.conf .gnupg/gpg.conf
ln -s Documents/repos/dotfiles/gpg-agent.conf .gnupg/gpg-agent.conf


## tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux start-server
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh


## Casks that needs password permission
installcask private-internet-access
installcask gpg-suite

