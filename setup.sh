#!/bin/sh


echo "--- SETUP FOLDER STRUCTURE"
mkdir -p ~/bin
mkdir -p ~/Documents/repos
mkdir -p ~/Documents/ruyadorno
mkdir -p ~/Documents/workspace

# bin will need to be added to $PATH manually here in order have nave ready later on
export PATH=$HOME/bin:/usr/local/bin:$PATH

echo "--- SETUP BREW"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

echo "--- BREW INSTALL COREUTILS"
brew install coreutils
brew install findutils

echo "--- BREW INSTALL DEPS"
brew install jpeg-turbo
brew install optipng
brew install readline

echo "--- BREW INSTALL CLIs"
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
brew install gpg2
brew install pinentry-mac
brew install hub
brew install asciinema
brew install neovim
brew install tmux
brew install fd
brew install ccache
brew install github/gh/gh
brew install bat
brew install hyperfine
brew install exa
brew install highlight

echo "--- SETUP NAVE"
cd ~/Documents/repos
git clone https://github.com/isaacs/nave.git
ln -s ~/Documents/repos/nave/nave.sh ~/bin/nave

echo "--- SETUP NODE"
nave install latest

echo "--- BREW INSTALL APPS"
brew install google-chrome
brew install firefox
brew install iterm2

echo "--- BREW INSTALL UTILS APPS"
brew install vlc
brew install 1password
brew install licecap
brew install slack
brew install kap

echo "--- BREW INSTALL GAMES"
brew install steam
brew install minecraft
brew install openttd


echo "--- SETUP VIM"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.config/nvim/autoload
ln -s ~/.vim/autoload/pathogen.vim ~/.config/nvim/autoload/pathogen.vim

cd ~/.vim/bundle/
ln -s ~/.vim/bundle ~/.config/nvim/bundle

echo "--- NEOVIM PYTHON3 SUPPORT"
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
echo "--- NOTE: Syntastic will rely on code validation tools, such as jshint"
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/lifepillar/vim-solarized8
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/mhinz/vim-signify.git
git clone https://github.com/ruyadorno/vim-statline.git
git clone https://github.com/AndrewRadev/splitjoin.vim.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/ap/vim-css-color.git
git clone https://github.com/hail2u/vim-css3-syntax
git clone https://github.com/othree/html5.vim.git
git clone https://github.com/vim-scripts/SyntaxComplete.git
git clone https://github.com/othree/javascript-libraries-syntax.vim.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/ekalinin/Dockerfile.vim.git
git clone https://github.com/tpope/vim-obsession.git
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/christoomey/vim-tmux-navigator.git


echo "--- SETUP DOTFILES REPO"
cd ~/Documents/repos/
git clone https://github.com/ruyadorno/dotfiles.git
git clone https://github.com/rupa/z.git


echo "--- SETUP SYMLINKS"
cd ~/
mkdir -p .config/nvim
ln -s $HOME/Documents/repos/dotfiles/.bashrc $HOME/.bash_profile
ln -s $HOME/Documents/repos/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/Documents/repos/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/Documents/repos/dotfiles/.npmrc $HOME/.npmrc
ln -s $HOME/Documents/repos/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/Documents/repos/dotfiles/.vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/Documents/repos/dotfiles/.tmux.conf $HOME/.tmux.conf


echo "--- SETUP TMUX"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux start-server
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh


echo "--- SETUP GPG SUITE"
brew install gpg-suite

## Link gpg config into place
ln -s $HOME/Documents/repos/dotfiles/gpg.conf $HOME/.gnupg/gpg.conf
ln -s $HOME/Documents/repos/dotfiles/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf


echo "--- SETUP MY NPM DEPS"
function npm () {
    nave use latest npm "${@}"
}

cd $HOME/Documents/ruyadorno
git clone https://github.com/ruyadorno/eslintme.git
git clone https://github.com/ruyadorno/ipt.git
git clone https://github.com/ruyadorno/ntl.git
cd $HOME/Documents/ruyadorno/eslintme && npm link
cd $HOME/Documents/ruyadorno/ipt && npm link
cd $HOME/Documents/ruyadorno/ntl && npm link


echo "--- SETUP NODE/NPM"
cd $HOME/Documents/ruyadorno
git clone https://github.com/nodejs/node.git
git clone https://github.com/npm/cli.git
cd $HOME/Documents/ruyadorno/cli && npm run resetdeps


echo "--- INSTALL NPM GLOBAL DEPS"
npm install -g eslint
npm install -g http-server
npm install -g fkill-cli
npm install -g diff-so-fancy
npm install -g svg-term
npm install -g json
npm install -g vmd


echo "--- COMPILE NODEJS FOR THE FIRST TIME"
echo "--- NOTE: this may take a while, cancel if needed"
cd $HOME/Documents/ruyadorno/node
./configure
make -j16

# Put binaries at the default node install location
sudo ln -s $HOME/Documents/ruyadorno/node/out/Release/node /usr/local/bin/node
sudo ln -s $HOME/Documents/ruyadorno/cli/bin/npm-cli.js /usr/local/bin/npm

echo "--- NPM LOGIN"
npm login
