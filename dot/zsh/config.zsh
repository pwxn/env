# Find all functions
fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)
#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSH/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;
#add homebrew's site functions for completion
if test -f '$(brew --prefix)/share/zsh/site-functions/'
then
  fpath=($(brew --prefix)/share/zsh/site-functions/ $fpath)
fi


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt no_beep
setopt no_list_beep
setopt local_options # allow functions to have local options
setopt local_traps # allow functions to have local traps
setopt prompt_subst
setopt correct
setopt complete_in_word
setopt ignore_eof

setopt append_history # adds history
setopt inc_append_history share_history  # adds history incrementally and share it across sessions
setopt hist_ignore_all_dups  # don't record dupes in history
setopt hist_reduce_blanks

bindkey -e

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
