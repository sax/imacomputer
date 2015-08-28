brew install Caskroom/cask/iterm2
brew install Caskroom/cask/bittorrent-sync
brew install Caskroom/cask/google-drive
brew install Caskroom/cask/rubymine
brew install Caskroom/cask/shiftit
brew install Caskroom/cask/1password
brew install Caskroom/cask/java
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/atom
brew install Caskroom/cask/rowanj-gitx
brew install Caskroom/cask/virtualbox
brew install postgresql
brew install memcached
brew install redis
brew install rabbitmq
brew install elasticsearch
brew install nginx
brew install hub
brew install libxslt
brew install qt
brew install chruby
brew install ruby-build
brew install watch
brew install the_silver_searcher

echo "===== installing rubies"
sudo mkdir -m0755 /opt/rubies
sudo chown sax /opt/rubies
ruby-build 2.1.7 /opt/rubies/2.1.7
echo "source /usr/local/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "chruby 2.1.7 >> ~/.bash_profile"

echo "===== configuring vagrant"
vagrant plugin install vagrant-smartos-zones
vagrant smartos install latest

echo "===== installing bash-it"
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

