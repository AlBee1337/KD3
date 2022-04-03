#! /usr/bin/env bash

git clone https://github.com/kwin-scripts/kwin-tiling.git
cd kwin-tiling/
plasmapkg2 --type kwinscript -i .
kcmshell5 kwinscripts
cd ..

cp ./configs/krunnerrc $HOME/.config/krunnerrc
cp ./configs/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc
cp ./configs/plasma-org.kde.plasma.desktop-appletsrc $HOME/./config/plasma-org.kde.plasma.desktop-appletsrc
cp ./configs/kwinrc $HOME/./config/kwinrc