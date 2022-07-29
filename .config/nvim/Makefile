#  ____  _                             
# |  _ \| |_   _ _ __  _ __   ___      
# | |_) | | | | | '_ \| '_ \ / _ \     
# |  __/| | |_| | | | | | | |  __/     
# |_|  _|_|\__,_|_| |_|_| |_|\___|     
# |  \/  | __ _| | _____ / _(_) | ___  
# | |\/| |/ _` | |/ / _ \ |_| | |/ _ \ 
# | |  | | (_| |   <  __/  _| | |  __/ 
# |_|  |_|\__,_|_|\_\___|_| |_|_|\___| 
#
# creator : Lena aka Plunne
# more infos : https://gitlab.com/Plunne/plunne_dotfiles
#
# Everyone can use and edit this file #ShareYourCode <3
#________________________________________________________#

DISTRIB_PKG = yay -S

########################
#     INSTALLATION     #
########################

all: install languages

.PHONY: all

install:
	$(DISTRIB_PKG) nodejs npm
	sudo pip install pynvim
	sudo npm i -g neovim
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


############################
#     LANGUAGE SERVERS     #
############################

languages:
	npm i -g yarn
	sudo pip install $(PY)
	sudo npm i -g $(BASH) $(VSCODE) $(VIM) $(YAML)

# Node Js plugins
BASH = bash-language-server
VSCODE = vscode-langservers-extracted
CSS = vscode-css-language-server
HTML = vscode-html-languageserver
JSON = vscode-json-languageserver
SQL = sql-language-server
VIM = vim-language-server
YAML = yaml-language-server

# Python plugins
PY = 'python-lsp-server[all]'

