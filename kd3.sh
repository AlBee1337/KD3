#! /usr/bin/env bash

if [ -z $2 ] 
then
   case "$1" in
    -i|--install)
        if [ -f $HOME/.config/*.kd3 ];then 
            echo "###############################"
            echo "#### KD3 already installed ####"
            echo "###############################"  
        else 
            git clone https://github.com/kwin-scripts/kwin-tiling.git
            cd kwin-tiling/
            plasmapkg2 --type kwinscript -i .
            cd ..
            mv $HOME/.config/krunnerrc $HOME/.config/krunnerrc.kd3
            mv $HOME/.config/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc.kd3
            mv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc.kd3
            mv $HOME/.config/kwinrc $HOME/.config/kwinrc.kd3
            cp ./configs/krunnerrc $HOME/.config/krunnerrc
            cp ./configs/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc
            cp ./configs/plasma-org.kde.plasma.desktop-appletsrc $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc
            cp ./configs/kwinrc $HOME/.config/kwinrc
            rm -fr kwin-tiling
            echo "\ncreated backup in $HOME/.config "
            echo "krunnerrc.kd3"
            echo "kglobalshortcutsrc.kd3"
            echo "plasma-org.kde.plasma.desktop-appletsrc.kd3"
            echo "kwinrc.kd3"
            echo "##################################"
            echo "#### DONT REMOVE BACKUP FILES ####"
            echo "##################################"
        fi 
      shift
      ;;
    -u|--uninstall)
        mv $HOME/.config/krunnerrc.kd3 $HOME/.config/krunnerrc
        mv $HOME/.config/kglobalshortcutsrc.kd3 $HOME/.config/kglobalshortcutsrc
        mv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc.kd3 $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc
        mv $HOME/.config/kwinrc.kd3 $HOME/.config/kwinrc
        echo "restored settings before KD3 was installed"
        shift 
      ;;
    -h|--help)
        echo "HELP:\n"
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
    echo "\n###########################################################"
    echo "#### Error: To much arguments or KD3 already installed ####"
    echo "###########################################################"
    echo "\nHELP:\n"
    echo "-i --install             install KD3"
    echo "-u --uninstall         uninstall KD3"
    echo "-h --help          show this message"
    exit 1
fi  



