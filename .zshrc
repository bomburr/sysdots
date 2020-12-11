# Timothy Devon Morris .zshrc
skip_global_compinit=1

# If you aren't running a desktop manager like gdm, this file won't get loaded
# So we will load it manually
source $HOME/.profile

# Skips the global compinit
skip_global_compinit=1

# Install zinit if not installed
if [ ! -d "${HOME}/.zinit" ]; then
  mkdir ${HOME}/.zinit
	git clone https://github.com/zdharma/zinit ${HOME}/.zinit/bin
	zcompile ${HOME}/.zinit/bin/zinit.zsh
fi

#AUTO_LS_COMMANDS=(ls git-status '/usr/bin/lsd --group-dirs first -al')
#AUTO_LS_COMMANDS=('/usr/bin/lsd --group-dirs first -al' git-status)
#AUTO_LS_NEWLINE=false

### Added by Zplugin's installer
source "${HOME}/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### Functions to make zinit configuration less verbose
zpt() { zinit ice wait"${1}" lucid               "${@:2}"; } # Turbo
zpi() { zinit ice lucid                            "${@}"; } # Regular Ice
zp()  { [ -z $2 ] && zinit light "${@}" || zinit "${@}"; } # zinit

### Oh-my-zsh libs
zpi atinit'ZSH_CACHE_DIR="$HOME/.zcompcache"'
zp snippet OMZ::lib/history.zsh

zpt 0a
zp snippet OMZ::lib/completion.zsh

zpt 0a
zp arzzen/calc.plugin.zsh

zp snippet OMZ::lib/git.zsh

zp snippet OMZ::plugins/git/git.plugin.zsh
setopt promptsubst

zp snippet OMZ::lib/theme-and-appearance.zsh
zp snippet OMZ::lib/spectrum.zsh
zp snippet OMZ::themes/pygmalion-virtualenv.zsh-theme


### Zplugins
# Remember to make the last plugin loaded in turbo mode have atload'zpcompinit' for
# completion support, this will make plugin loading super snappy!
zp eendroroy/zed-zsh

zp wfxr/forgit

zpi as"completion"
zp snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zpt 0a blockf atpull'zinit creinstall -q .'
zp zsh-users/zsh-completions

zpt 0a
zp ael-code/zsh-colored-man-pages

#zpt 0a
#zp desyncr/auto-ls

zpt 0b '{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
zp zsh-users/zsh-autosuggestions

zpt 0b atload'zpcompinit;zpcdreplay'
zp zdharma/fast-syntax-highlighting

### Zplugin Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

### all hail the one true editor
export EDITOR='code'

### Keybindings
source $HOME/.zinit/keybindings.zsh


### myconf




#
# Aliases
#

alias zhedit="sudo $EDITOR ~/.zshrc --user-data-dir"
alias pacman="sudo pacman"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias repos="cd /media/hd0/doganakyildiz/repos"
alias mail="exec prospect-mail & disown"
alias teams="exec teams-for-linux & disown"
alias vm="exec sudo virtualbox & disown"
alias ls="ls -la"
alias discord="exec /media/hd0/doganlibs/Discord/Discord & disown"
 
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/rti_connext_dds-5.3.1/bin:$PATH
export PATH=/snap/bin:$PATH

#  Load fzf zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt share_history

# Function for managing dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}


PATH="/home/utku2/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/utku2/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/utku2/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/utku2/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/utku2/perl5"; export PERL_MM_OPT;

