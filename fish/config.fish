set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set rbenv $HOME/.rbenv/bin $HOME/.rbenv/shims
set -x PATH $homebrew $rbenv $default_path

set -x NODE_PATH /usr/local/lib/node_modules

set -x VISUAL atom
set -x EDITOR atom

set -gx STUDIO_JDK /Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk

eval (direnv hook fish)
rbenv rehash >/dev/null ^&1

# General
alias flush "sudo dscacheutil -flushcache"

# top
alias ttop "top -ocpu -R -F -s 2 -n30"

# git
alias git hub
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gs "git status"

# Compression
alias z 'tar czf' # z [output_name.tgz] dir
alias uz 'tar xzf' # uz input.tgz

# IP
alias ip 'ifconfig en0 | grep inet\ | cut -d" " -f2'
alias exip 'http icanhazip.com --body'

# fish
alias fishconfig "atom ~/.config/fish"

# simple HTTP server
alias serve "ruby -run -e httpd -- -p 5000 ."

# vagrant
alias v "vagrant"
alias vreload "v reload"
alias vssh "v ssh"
alias vhalt "v halt"
alias vup "v up"
alias vsuspend "v suspend"
alias vresume "v resume"


# node
function usenode
  brew unlink iojs
  brew link node
  echo "Using Node.js"
end
# iojs
function useio
  brew unlink node
  brew link --force iojs
  echo "Using io.js"
end
