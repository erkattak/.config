set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

set -gx STUDIO_JDK /Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk
set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8.0)

set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set rbenv $HOME/.rbenv/bin $HOME/.rbenv/shims
set android $HOME/Library/Android/sdk/platform-tools
set -x PATH $homebrew $rbenv $android JAVA_HOME $default_path

set -x NODE_PATH /usr/local/lib/node_modules

set -x VISUAL atom
set -x EDITOR atom


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

# mysql
alias "mysql start" "mysql.server start"
alias "mysql stop" "mysql.server stop"


# Node.js vs io.js
# Install both via Homebrew
# Then use the following functions to switch between them
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

# Quick project switching using "c" with tab-completion
set -x CDPATH /Users/brkattk/Code
function c -d "Activate virtual environment in $WORKON_HOME"
  cd /Users/brkattk/Code/$argv[1]
end
complete -c c -a "(__fish_complete_cd)"
