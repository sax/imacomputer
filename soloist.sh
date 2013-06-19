#!/bin/bash
# This shell script was created at solowizard.com
#
# Usage:
#   Running the script remotely:
#     bash < <(curl -s http://www.solowizard.com/soloist_scripts/qvbs9k.sh )
#   Running the script if you have downloaded it:
#     ./qvbs9k.sh
#
# http://github.com/tommyh/solo_wizard
# (c) 2012, Tom Hallett
# This script may be freely distributed under the MIT license.

pushd `pwd`
if [ $(gem list chef | grep -v chef) ]; then
  echo 'installing soloist'
  if rvm --version 2>/dev/null; then
    gem install soloist
  else
    sudo gem install chef --version 11.4.2 --no-ri --no-rdoc
    sudo gem install soloist --no-ri --no-rdoc 
  fi
fi

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::ack
- pivotal_workstation::bash_completion
- pivotal_workstation::ccmenu
- pivotal_workstation::chrome
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::defaults_fast_key_repeat_rate
- pivotal_workstation::disable_front_row
- pivotal_workstation::dropbox
- pivotal_workstation::enable_assistive_devices
- pivotal_workstation::firefox
- pivotal_workstation::flycut
- pivotal_workstation::function_keys
- pivotal_workstation::git
- pivotal_workstation::github_for_mac
- pivotal_workstation::gitx
- pivotal_workstation::git_config_global_defaults
- pivotal_workstation::git_scripts
- pivotal_workstation::global_environment_variables
- pivotal_workstation::homebrew
- pivotal_workstation::imagemagick
- pivotal_workstation::increase_shared_memory
- pivotal_workstation::inputrc
- pivotal_workstation::iterm2
- pivotal_workstation::keyboard_preferences
- pivotal_workstation::keycastr
- pivotal_workstation::locate_on
- pivotal_workstation::memcached
- pivotal_workstation::menubar_preferences
- pivotal_workstation::menumeters
- pivotal_workstation::mouse_locator
- pivotal_workstation::nginx
- pivotal_workstation::node_js
- pivotal_workstation::postgres
- pivotal_workstation::propane
- pivotal_workstation::qt
- pivotal_workstation::redis
- pivotal_workstation::remove_expose_keyboard_shortcuts
- pivotal_workstation::set_finder_show_user_home_in_sidebar
- pivotal_workstation::skype
- pivotal_workstation::textmate
- pivotal_workstation::textmate_bundles
- pivotal_workstation::textmate_preferences
- pivotal_workstation::tmux
- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::vim
- pivotal_workstation::virtualbox
- pivotal_workstation::workspace_directory
- pivotal_workstation::xquartz
- pivotal_workstation::sourcetree
EOF
if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
soloist
popd
