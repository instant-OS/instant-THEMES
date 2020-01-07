#!/bin/bash
# manjaro like style

source <(curl -Ls https://git.io/JerLG)
pb git
pb gtk
pb unpack

mkdir /tmp/manjarotheme
cd /tmp/manjarotheme

if ! themeexists matcha &> /dev/null; then
    git clone --depth=1 https://github.com/vinceliuice/matcha.git
    cd matcha
    ./Install
    cd ..
    rm -rf matcha
fi
gtktheme "Matcha-sea"

if ! icons_exist "Papirus-Maia" &> /dev/null; then
    git clone --depth=1 https://github.com/Ste74/papirus-maia-icon-theme.git
    cd papirus-maia-icon-theme
    mkdir ~/.icons &>/dev/null
    mv Papirus* ~/.icons
    cd ..
    rm -rf papirus-maia-icon-theme
fi

gtkicons "Papirus-Maia"

# rofi setup
mkdir -p ~/.config/rofi &>/dev/null
curl -s "https://raw.githubusercontent.com/paperbenni/dotfiles/master/rofi/manjaro.rasi" >~/.config/rofi/arc.rasi
echo 'rofi.theme: ~/.config/rofi/manjaro.rasi' >~/.config/rofi/config

curl -s "https://raw.githubusercontent.com/paperbenni/dotfiles/master/fonts/sourcecodepro.sh" | bash
curl -s "https://raw.githubusercontent.com/paperbenni/dotfiles/master/fonts/roboto.sh" | bash

if ! [ -e ~/.icons/Breeze ]; then
    mkdir ~/.icons &>/dev/null
    cd ~/.icons
    svn export "https://github.com/KDE/breeze.git/trunk/cursors/Breeze/Breeze"
fi

rofitheme manjaro
dunsttheme manjaro

setcursor Breeze

echo "done installing manjaro theme"
