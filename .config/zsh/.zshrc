THEME_RAND=1 #$(( (RANDOM % 2) + 1 ))
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

if [[ $THEME_RAND -eq 1 ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  Z_THEME=catppuccin_mocha-zsh-syntax-highlighting.zsh
  source "${HOME}/.config/zsh/${Z_THEME}"
  ZSH_THEME="powerlevel10k/powerlevel10k"
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"
fi

#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
#


autoload bashcompinit
bashcompinit


export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CURRENT_DESKTOP=Unity
wmname LG3D
zstyle ':completion:*' hosts off

# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
#ZSH_THEME="emotty"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "arrow" "powerlevel10k/powerlevel10k" )
##source "$HOME/.vim/autoload/gruvbox_256palette.sh"
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"
unsetopt correct_all
setopt correct
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#eval 'dircolors ~/.dircolors' > /dev/null
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

plugins=(
  zbell
  git
  command-not-found
  node
  npm
  vi-mode
  pyenv
  zsh-syntax-highlighting
  colored-man-pages
)
source $ZSH/oh-my-zsh.sh
# User configuration
#ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export CTYPE=en_US.UTF-8
export MESSAGE=en_US.UTF-8
export MONETARY=en_US.UTF-8
export NUMERIC=en_US.UTF-8
export TIME=en_US.UTF-8
export ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=nvim
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
fpath+=${ZDOTDIR:-~}/.zsh_functions
source ${HOME}/.aliases
source ${HOME}/.bash_functions
alias luamake=${HOME}/lua-language-server/3rd/luamake/luamake
LF_ICONS=$(sed ~/.config/lf/diricons \
            -e '/^[ \t]*#/d'       \
            -e '/^[ \t]*$/d'       \
            -e 's/[ \t]\+/=/g'     \
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS
PROMPT_EOL_MARK=''
typeset -aU path

export WINEPREFIX="$XDG_DATA_HOME"/wine
export RUST=${HOME}/.cargo/bin
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH=/usr/local/bin:$JDTLS_HOME:$GO:$LTEX:$GEM:$TOMCAT:$SCALA_BIN:$LOCAL_BIN:$QT5:$RUST:$VSCodium:$VIMRUNTIME:$ANDROID_HOME:$ANDROID_EMULATOR_HOME:$ANDROID_PREFS_ROOT/build-tools/29.0.3:$P4MERGE:$JAVA_JDK:$ANDROID_PREFS_ROOT/emulator/:$LOCAL_BIN:$ANDROID_PREFS_ROOT/system-images/:$SASS:$DART:$ROBO_3T:$NODE:$GROOVY_BIN:$GRADEL_BIN:/usr/bin:/bin:/usr/local/games:/usr/games:$HOME/.local/bin:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/.local/bin:/usr/local/lib/nodejs/bin:/snap/bin:$MVN_HOME:$MVN_BIN:~/.config/composer/vendor/bin:$STUDIO_HOME:$PATH

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
function osc7 {
    local LC_ALL=C
    export LC_ALL

    setopt localoptions extendedglob
    input=( ${(s::)PWD} )
    uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
    print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
add-zsh-hook -Uz chpwd osc7

precmd() {
    print -Pn "\e]133;A\e\\"
}
source /usr/share/nvm/init-nvm.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export BEMENU_OPTS="--tb '#6272a4'\
 --tf '#f8f8f2'\
 --fb '#282a36'\
 --ff '#f8f8f2'\
 --nb '#282a36'\
 --nf '#6272a4'\
 --hb '#44475a'\
 --hf '#50fa7b'\
 --sb '#44475a'\
 --sf '#50fa7b'\
 --scb '#282a36'\
 --scf '#ff79c6'"
source ${HOME}/.zshenv
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source ${HOME}/.config/broot/launcher/bash/br

# bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
export PATH="$PATH:/opt/nvim-linux64/bin"
#compdef atlas
compdef _atlas atlas

# zsh completion for atlas                                -*- shell-script -*-

__atlas_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_atlas()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __atlas_debug "\n========= starting completion logic =========="
    __atlas_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __atlas_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __atlas_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., atlas -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __atlas_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __atlas_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __atlas_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __atlas_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __atlas_debug "No directive found.  Setting do default"
        directive=0
    fi

    __atlas_debug "directive: ${directive}"
    __atlas_debug "completions: ${out}"
    __atlas_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __atlas_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __atlas_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __atlas_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __atlas_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __atlas_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __atlas_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __atlas_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __atlas_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __atlas_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __atlas_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __atlas_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __atlas_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __atlas_debug "_describe did not find completions."
            __atlas_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __atlas_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __atlas_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_atlas" ]; then
    _atlas
fi
# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" && __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

function j() {
    __zoxide_z "$@"
}

function ji() {
    __zoxide_zi "$@"
}

# Completions.
if [[ -o zle ]]; then
    __zoxide_result=''

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            # Show completions for local directories.
            _files -/
        elif [[ "${words[-1]}" == '' ]]; then
            # Show completions for Space-Tab.
            # shellcheck disable=SC2086
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]})" || __zoxide_result=''

            # Bind '\e[0n' to helper function.
            \builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
            # Send '\e[0n' to console input.
            \builtin printf '\e[5n'
        fi

        # Report that the completion was successful, so that we don't fall back
        # to another completion function.
        return 0
    }

    function __zoxide_z_complete_helper() {
        if [[ -n "${__zoxide_result}" ]]; then
            # shellcheck disable=SC2034,SC2296
            BUFFER="j ${(q-)__zoxide_result}"
            \builtin zle reset-prompt
            \builtin zle accept-line
        else
            \builtin zle reset-prompt
        fi
    }
    \builtin zle -N __zoxide_z_complete_helper

    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete j
fi

ZELLIJ_AUTO_ATTACH="true"
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach mrlectus
    else
        zellij
    fi
fi
