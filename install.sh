mv ${HOME}/.vim ${HOME}/.vimbak$(date -d "today" +"%Y%m%d_%H%M")
mkdir -p ${HOME}/.vim
mkdir -p ${HOME}/.vim/colors && cd ${HOME}/.vim/colors && wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
xrdb -merge ${HOME}/.Xresources
mkdir -p ${HOME}/.vim/autoload ${HOME}/.vim/bundle
#curl -LSso ${HOME}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ${HOME}/.vim
git clone https://github.com/tpope/vim-pathogen.git
cd ${HOME}/.vim/autoload
ln -s ../vim-pathogen/autoload/pathogen.vim ./pathogen.vim
cd ${HOME}/.vim/vim-pathogen
git checkout tags/v2.3
cd ${HOME}/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
git clone git://github.com/tpope/vim-commentary.git
git clone git://github.com/tpope/vim-surround.git
git clone https://github.com/ervandew/supertab
git clone https://github.com/majutsushi/tagbar.git
cp ${HOME}/syncfiles/patches/tagbar.patch ${HOME}/.vim/bundle/tagbar/plugin/
patch ${HOME}/.vim/bundle/tagbar/plugin/tagbar.vim -bnN -i ${HOME}/.vim/bundle/tagbar/plugin/tagbar.patch
mkdir -p ${HOME}/.vim/plugin
wget http://www.vim.org/scripts/download_script.php?src_id=13834 -O toggle.vim
cp toggle.vim ${HOME}/.vim/plugin && rm toggle.vim

rm -f ${HOME}/.bashrc && ln -s ${HOME}/syncfiles/dotfiles/bashrc ${HOME}/.bashrc
rm -f ${HOME}/.screenrc && ln -s ${HOME}/syncfiles/dotfiles/screenrc ${HOME}/.screenrc
rm -f ${HOME}/.vimrc && ln -s ${HOME}/syncfiles/dotfiles/vimrc ${HOME}/.vimrc
rm -f ${HOME}/.Xresources && ln -s ${HOME}/syncfiles/dotfiles/Xresources ${HOME}/.Xresources
rm -f ${HOME}/.tmux.conf && ln -s ${HOME}/syncfiles/dotfiles/tmuxrc ${HOME}/.tmux.conf
