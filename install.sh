#!/bin/bsh
mkdir -p ~/Downloads/sources
cd ~/Downloads/sources
git clone https://github.com/Pr0cella/glassy-kde
mv ~/Downloads/sources/glassy-kde/* ~/Downloads/sources
rm -rf ~/Downloads/sources/glassy-kde/
mv ./Konsole/Glassy.colorscheme  ~/.local/share/konsole
mv ./Colors/Glassy.colors ~/.kde/share/apps/color-schemes/
mv ./Plasma/Glassy ~/.local/share/plasma/desktoptheme