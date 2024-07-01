export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
fi
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk/
export AWT_TOOLKIT=MToolkit
. "/home/brown/.local/share/cargo/env"
export QT_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_STYLE_OVERRIDE=kvantum
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminalexport XDG_CACHE_HOME=/home/brown/.cache/
export QT_STYLE_OVERRIDE=kvantum
export YARN_BIN=/home/brown/.local/share/npm/bin
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CURRENT_DESKTOP=sway
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_PICTURES_DIR=/home/brown/Pictures/
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
. "/home/brown/.local/share/cargo/env"
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export ANDROID_EMULATOR_HOME=/home/brown/.android
export ANDROID_HOME=${HOME}/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=${HOME}/Android/sdk
export ANDROID_PREFS_ROOT=/home/brown/Android/sdk
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export EDITOR=$VISUAL
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export GEM=/home/brown/.local/share/gem/ruby/3.0.0/bin
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GO=/home/brown/go/bin
export GOPATH="$XDG_DATA_HOME/go"
export GRIM_DEFAULT_DIR=/home/brown/Pictures/Screenshots/
export GROOVY_BIN=/home/brown/groovy/bin
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK_USE_PORTAL=0
export HTML=/var/www/html
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export JAVA_JDK=/usr/lib/jvm/java-17-openjdk/bin
export JAVA_BIN=/usr/lib/jvm/java-17-openjdk/bin
export IDEA_JDK=/usr/lib/jvm/java-17-openjdk
export CHROME_EXECUTABLE=google-chrome-stable
export JDTLS_HOME=/home/brown/eclipse.jdt.ls
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export KITTY_DISABLE_WAYLAND=1
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;45;01m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LOCAL_BIN=/home/brown/.local/bin
export LTEX=/home/brown/ltex-ls/bin
export MSFDB=/usr/share/metasploit-framework/config/database.yml
export MVN_BIN=/home/brown/Maven/bin
export MVN_HOME=/home/brown/Maven
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NMAP_SCRIPT=/usr/share/nmap/scripts
export NODE=/home/brown/node/bin
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export P4MERGE=/home/brown/p4v/bin
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PKG_CONFIG_PATH
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export ROBO_3T=/home/brown/robo3t/bin
export SASS=/home/brown/dart-sass
export SCALA_BIN=/home/brown/sbt/bin
export FLYIO_BIN=/home/brown/.fly/bin
export STUDIO_HOME=/home/brown/AStudio/bin
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk
export TOMCAT=/home/brown/ApacheTomCat/bin
export VISUAL=nvim
export VSCodium=/home/VSCodium/bin
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ZDOTDIR="$HOME"/.config/zsh
export ZSH="/home/brown/.oh-my-zsh"
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
# export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$HOME/bin:/usr/local/bin:$PATH
export QT5=/usr/local/qt5/bin
export QT_SCALE_FACTOR=1.2
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export PATH="$PATH:$HOME/flutter/bin"
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
export PATH="/opt/clang-format-static:$GROOVY_BIN:$GOPATH/bin:$GEM:$GRADLE_BIN:$FLYIO_BIN:$LTEX:$TOMCAT:$P4MERGE:$NODE:$MVN_BIN:$LOCAL_BIN:$STUDIO_HOME:$SCALA_BIN:$ROBO_3T:$YARN_BIN:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export RANGER_LOAD_DEFAULT_RC=false
export PATH="$PATH":"$HOME/.pub-cache/bin"
eval "$(pyenv init --path)"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export ZELLIJ_AUTO_ATTACH="true"
export PATH="/home/brown/.local/share/solana/install/active_release/bin:$PATH"
export DOCKER_BUILDKIT=1
export XDG_CACHE_HOME=$HOME/.cache
export SRC_ENDPOINT=https://sourcegraph.com
export SRC_ACCESS_TOKEN=sgp_a0d7ccb4f752ea73_fb98e60a58013683feb2c1ca0303666cc8a8a29a
