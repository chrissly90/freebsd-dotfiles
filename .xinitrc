setxkbmap de
eval "$(gpg-agent --daemon --pinentry-program /usr/local/bin/pinentry-tty --sh)"
exec /usr/local/bin/i3
