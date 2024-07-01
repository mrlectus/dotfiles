#!/bin/env bash
yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

lg() {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

  lazygit "$@"

  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
    cd "$(cat $LAZYGIT_NEW_DIR_FILE)" || exit
    rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
  fi
}

fem_images() {
  ls | awk ' { x=$0; gsub(".svg|.jpg|.png", "", $0); printf "\x27"$0"\x27:" } { print " \x22url(\x27../../" x "\x27)\x22,"}'
}

yt() {
  yt-dlp "$1" --output "%(title)s" "$@"
}

ytp() {
  yt-dlp "$1" --output "%(playlist_autonumber)s. %(title)s" "$@"
}

slock() {
  systemctl suspend && ~/.config/sway/lockman.sh
}
