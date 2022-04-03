#! /usr/bin/env bash

if [ -z $2 ]
then
   case "$1" in
    -i|--install)
        git clone https://github.com/kwin-scripts/kwin-tiling.git
        cd kwin-tiling/
        plasmapkg2 --type kwinscript -i .
        cd ..
        mv $HOME/.config/krunnerrc $HOME/.config/krunnerrc.old
        mv $HOME/.config/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc.old
        mv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc.old
        mv $HOME/.config/kwinrc $HOME/.config/kwinrc.old
        cp ./configs/krunnerrc $HOME/.config/krunnerrc
        cp ./configs/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc
        cp ./configs/plasma-org.kde.plasma.desktop-appletsrc $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc
        cp ./configs/kwinrc $HOME/.config/kwinrc
        rm -fr kwin-tiling
        echo "created backup in .config"
        echo "krunnerrc.old"
        echo "kglobalshortcutsrc.old"
        echo "plasma-org.kde.plasma.desktop-appletsrc.old"
        echo "kwinrc.old"
      shift
      ;;
    -u|--uninstall)
        echo "uninstall"
        shift 
      ;;
    -h|--help)
        echo "-i --install             install KD3"
        echo "-u --uninstall         uninstall KD3"
        echo "-h --help          show this message"
        shift 
      ;;
    -*|--*=) # unsupported flags
        echo "Error: Unsupported flag $1" >&2
        exit 1
      ;;
  esac
else
    echo "Error: To much arguments\n"
    echo "-i --install             install KD3"
    echo "-u --uninstall         uninstall KD3"
    echo "-h --help          show this message"
    exit 1
fi  



