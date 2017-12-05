#!/bin/sh

# Copyright: Copyright (C) 2013-2017 YuanFanBin
# License: The MIT License
# Email: yuanfanbin@gmail.com

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

export I3_CONFIG_DIR="~/.config/i3"
export GOROOT=/usr/lib/go
export GOPATH=$HOME/workspace/golang
export PATH="$PATH:$I3_CONFIG_DIR/bin:$HOME/bin:$GOROOT/bin:$GOPATH/bin"
export TERMNAL="st"

# sysresources=/etc/X11/xinit/.Xresources
# if [ -f $sysresources ]; then
#     xrdb -merge $sysresources
# fi
# userresources=$HOME/.Xresources
# if [ -f "$userresources" ]; then
#     xrdb -merge "$userresources"
# fi


#-----------------------------------------------------------------------------#
# [Terminal Pinyin]
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

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

# [输入法]
fcitx &
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# [composite manager]
xcompmgr &

# [Reference]
# * [Xmodmap - Arch Wiki](https://wiki.archlinux.org/index.php/Xmodmap)
# * [Unclutter - Arch Wiki](https://wiki.archlinux.org/index.php/Unclutter)
# * [Udisks - Arch Wiki](https://wiki.archlinux.org/index.php/Udisks) 
# * [Fcitx - Arch Wiki](https://wiki.archlinux.org/index.php/Fcitx)
#-----------------------------------------------------------------------------#


# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

i3
