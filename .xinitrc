#!/bin/sh

#-----------------------------------------------------------------------------#
# cp /etc/X11/xinit/xinitrc
# [Reference]
# * [xinitrc - Arch Wiki](https://wiki.archlinux.org/index.php/Xinitrc)
#-----------------------------------------------------------------------------#


#-----------------------------------------------------------------------------#
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#-----------------------------------------------------------------------------#


# sysresources=/etc/X11/xinit/.Xresources
# if [ -f $sysresources ]; then
#     xrdb -merge $sysresources
# fi
# userresources=$HOME/.Xresources
# if [ -f "$userresources" ]; then
#     xrdb -merge "$userresources"
# fi


#-----------------------------------------------------------------------------#
# [Keyboard]
# system .Xmodmap
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
# user .Xmodmap 
# [~/.Xmodmap](https://github.com/YuanFanBin/dotfile/.Xmodmap)
usermodmap=$HOME/.Xmodmap
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# [Mouse]
# 鼠标自动隐藏
unclutter -root -visible &

# [Auto Mount]
udiskie &

# [Reference]
# * [Xmodmap - Arch Wiki](https://wiki.archlinux.org/index.php/Xmodmap)
# * [Unclutter - Arch Wiki](https://wiki.archlinux.org/index.php/Unclutter)
# * [Udisks - Arch Wiki](https://wiki.archlinux.org/index.php/Udisks) 
#-----------------------------------------------------------------------------#


# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login
