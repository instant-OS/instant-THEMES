#!/bin/bash

source <(curl -Ls https://git.io/JerLG)
pb git
pb gtk
pb unpack

mkdir -p ~/.cache/mactheme
cd ~/.cache/mactheme

# gtk theme
if ! themeexists Mojave-light &> /dev/null; then
    gitclone vinceliuice/Mojave-gtk-theme
    cd Mojave-gtk-theme
    ./install.sh
    cd ..
fi

gtktheme Mojave-light

# gtk icons
if ! icons_exist McMojave-circle &> /dev/null; then
    gitclone vinceliuice/McMojave-circle
    cd McMojave-circle
    ./install.sh
    cd ..
fi
gtkicons McMojave-circle

setcursor osx

curl -s "https://raw.githubusercontent.com/paperbenni/dotfiles/master/fonts/sfpro.sh" | bash

rofitheme mac
dunsttheme mac

gtkfont 'SF Pro Display 10'
gtkdocumentfont 'SF Pro Text 10'
