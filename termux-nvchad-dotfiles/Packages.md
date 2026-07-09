#### Packages
pkg update && pkg upgrade -y

pkg install nvim

pkg install -y git curl nodejs npm ripgrep unzip clang \
  openjdk-21 python ruby wget tar tmux yazi which starship \
  maven composer php mariadb

##### Packages 2

pip install python-lsp-server --break-system-packages
pip install black --break-system-packages
gem install solargraph
npm install -g typescript-language-server typescript \
  vscode-langservers-extracted intelephense prettier

pip show pyflakes pycodestyle mccabe
pip install python-lsp-server[all] --break-system-packages

### others (pkg)

mono
neovim
git
curl
nodejs
npm
ripgrep
unzip
clang
openjdk-21
python
python-tkinter
ruby
wget
tar
tmux
yazi
which
starship
maven
composer
php
mariadb

### others 2 (pip install --break-system-packages)

python-lsp-server
black
psycopg2-binary
mysql-connector-python
python-dotenv
django
flet

### others 3 (gem install)

solargraph

### others 4 (npm install -g)

typescript-language-server
typescript
vscode-langservers-extracted
intelephense
prettier

### others 5 inside neovim (:MasonInstall)

jdtls

### others 6 inside neovim (:TSInstall)

c
cpp
java
html
javascript
css
python
ruby
php
typescript
json
bash
lua

### after config Jrun,dev,newproject,newprojectweb and startx
chmod +x /data/data/com.termux/files/usr/bin/jrun
chmod +x /data/data/com.termux/files/usr/bin/dev
chmod +x /data/data/com.termux/files/usr/bin/startx
chmod +x /data/data/com.termux/files/usr/bin/newprojectweb
chmod +x /data/data/com.termux/files/usr/bin/newproject

### final steps inside neovim
:Lazy sync
:MasonInstall jdtls
:TSInstall c cpp java html javascript css python ruby php typescript json bash lua
