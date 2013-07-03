#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#linking fonts
xset +fp /usr/share/fonts/local
xset fp rehash

#source Xresource
xrdb -merge ~/.Xresources

#screen dimmer
xbacklight -set 10

#wallpaper set
sh $HOME/.fehbg &

#compton
compton --shadow-exclude-reg x20+0-747 -cCGb

#urxvt daemon
/usr/bin/urxvtd -q -o -f &

#automounting
/usr/bin/udiskie -s &

#screen locker
/usr/bin/xautolock &

#starting i3wm
exec i3
