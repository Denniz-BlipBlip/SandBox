#### Packages
pkg update && pkg upgrade -y

pkg install -y git curl nodejs npm ripgrep unzip clang \
  openjdk-21 python ruby wget tar tmux yazi which starship \
  maven composer php mariadb

#####

pip install python-lsp-server --break-system-packages
pip install black --break-system-packages
gem install solargraph
npm install -g typescript-language-server typescript \
  vscode-langservers-extracted intelephense prettier
