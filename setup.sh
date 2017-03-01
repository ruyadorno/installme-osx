#!/bin/sh


# setup folder structure
mkdir ~/Documents/workspace
mkdir ~/Documents/repos


# brew setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
brew install ant
brew install git
brew install git-lfs
brew install mercurial
brew install node
brew install irssi
brew install phantomjs
brew install unrar
brew install trash
brew install tree
brew install wget
brew install tig
brew install ffind
brew install openconnect
brew install wifi-password
brew install gpg
brew install gpg-agent
brew install pinentry-mac
brew install hub
brew install asciinema

# MacVim for terminal
brew install macvim
alias vim='mvim -v'

# OSX native apps
brew tap caskroom/cask

function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask atom
installcask dropbox
installcask copy
installcask google-chrome
installcask firefox
installcask iterm2

# utils
installcask skype
installcask lastfm
installcask spotify
installcask vlc
installcask 1password
installcask licecap
installcask skitch
installcask slack
installcask google-drive
installcask google-photos-backup
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


# vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Go to bundle folder
cd ~/.vim/bundle/

# Get all plugins
git clone https://github.com/vim-scripts/bufkill.vim
git clone https://github.com/wincent/Command-T.git
git clone https://github.com/tpope/vim-fugitive.git
echo "Command-T will need extra setup, please review its docs"
open https://github.com/wincent/Command-T/blob/master/doc/command-t.txt#L174
git clone https://github.com/rking/ag.vim
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/mitechie/pyflakes-pathogen.git
git clone https://github.com/scrooloose/syntastic.git
echo "Syntastic will rely on code validation tools, such as jshint"
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/mhinz/vim-signify.git
git clone https://github.com/millermedeiros/vim-statline.git
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
git clone https://github.com/ternjs/tern_for_vim.git
git clone https://github.com/rizzatti/dash.vim.git


# Configure tern_for_vim
cd ~/.vim/bundle/tern_for_vim
npm install


# Configure Command-T
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make


## Get dotfiles repo
cd ~/Documents/repos/
git clone https://github.com/ruyadorno/dotfiles.git
git clone https://github.com/rupa/z.git


## Setup symlinks
cd ~/
ln -s Documents/repos/dotfiles/bashrc .bash_profile
ln -s Documents/repos/dotfiles/gitconfig .gitconfig
ln -s Documents/repos/dotfiles/gitignore_global .gitignore_global
ln -s Documents/repos/dotfiles/hgrc .hgrc
ln -s Documents/repos/dotfiles/vimrc .vimrc
ln -s Documents/repos/dotfiles/gpg.conf .gnupg/gpg.conf
ln -s Documents/repos/dotfiles/gpg-agent.conf .gnupg/gpg-agent.conf


## Casks that needs password permission
installcask private-internet-access
installcask dockertoolbox

