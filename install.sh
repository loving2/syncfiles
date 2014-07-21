mv ~/.vim ~/.vimbak$(date -d "today" +"%Y%m%d_%H%M")
mkdir -p ~/.vim
mkdir -p ~/.vim/colors && cd ~/.vim/colors && wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
xrdb -merge ~/.Xresources
mkdir -p ~/.vim/autoload ~/.vim/bundle
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim
git clone https://github.com/tpope/vim-pathogen.git
cd ~/.vim/autoload
ln -s ../vim-pathogen/autoload/pathogen.vim ./pathogen.vim
cd ~/.vim/vim-pathogen
git checkout tags/v2.3
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
git clone git://github.com/tpope/vim-commentary.git
git clone git://github.com/tpope/vim-surround.git
git clone https://github.com/ervandew/supertab
git clone https://github.com/majutsushi/tagbar.git
cp ~/syncfiles/patches/tagbar.patch ~/.vim/bundle/tagbar/plugin/
patch ~/.vim/bundle/tagbar/plugin/tagbar.vim -bnN -i ~/.vim/bundle/tagbar/plugin/tagbar.patch
mkdir -p ~/.vim/plugin
wget http://www.vim.org/scripts/download_script.php?src_id=13834 -O toggle.vim
cp toggle.vim ~/.vim/plugin && rm toggle.vim

rm -f ~/.bashrc && ln -s ~/syncfiles/dotfiles/bashrc ~/.bashrc
rm -f ~/.screenrc && ln -s ~/syncfiles/dotfiles/screenrc ~/.screenrc
rm -f ~/.vimrc && ln -s ~/syncfiles/dotfiles/vimrc ~/.vimrc
rm -f ~/.Xresources && ln -s ~/syncfiles/dotfiles/Xresources ~/.Xresources
rm -f ~/.tmux.conf && ln -s ~/syncfiles/dotfiles/tmuxrc ~/.tmux.conf
