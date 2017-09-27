alias vim='nvim'
export EDITOR=nvim
export NVM_DIR="/home/blittle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME="/home/blittle/bin/java"
export ANDROID_HOME="/home/blittle/Android/Sdk"

PATH="$PATH:$JAVA_HOME/bin"
PATH="$PATH:/home/blittle/.tmuxifier/bin"
PATH="$PATH:/home/blittle/.local/bin"
PATH="$PATH:/home/blittle/dev/sputnik/bin"
# PATH="$PATH:/home/blittle/Android/Sdk/platform-tools"

dclean() { docker rm -v $(docker ps -a -q -f status=exited); docker rmi $(docker images -f "dangling=true" -q); }
alias dc=docker-compose

prompt sorin
export VISUAL=vim
export EDITOR="$VISUAL"
