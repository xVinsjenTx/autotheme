#!/bin/bash
# -*- coding: utf-8 -*-

LAUNCHER=$(basename $0 .sh)
VERSION=0.3

echo "$LAUNCHER: Version $VERSION"

DOWNLOADDIR=~/"Downloads/auto-theme"
GITREPO='https://github.com/Pr0cella/glassy-kde'
GITCOLORS='https://github.com/Mrcuve0/Aritim-Dark/tree/master/KDE/colorScheme/AritimDark.colors'
DOWNLOADEDREPO="$DOWNLOADDIR/glassy-kde"

###############################################################################
#Check Ubuntu version
###############################################################################
RELEASE="$(lsb_release -a 2>/dev/null | grep 'Release' | cut -f2)"
if [ $RELEASE = "20.04" ]; then 
    echo "Release version is $RELEASE";
else
    echo "this script is only supported for Ubuntu version 19.10, exiting...";
    exit
fi

###############################################################################
# Build filesystem dependencies
###############################################################################
mkdir -p "$DOWNLOADDIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo 'mkdir failed with code: ' "$RV"
    exit
fi

###############################################################################
# Download the repo
###############################################################################
if [ ! -d "$DOWNLOADEDREPO" ]; then
    git clone "$GITREPO"  "$DOWNLOADEDREPO"
    RV="$?"
    if [ ! "$RV" -eq "0" ]; then
        echo 'git clone failed with code: ' "$RV"
        exit
    fi
fi

###############################################################################
# Copy theme to destination
###############################################################################

DIR=~/".local/share/konsole/"
IFILE="$DOWNLOADEDREPO/Konsole/Glassy.colorscheme"
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: ' $DIR 'Aborting without deploying files'
    exit
fi

cp "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($IFILE) failed failed with code: $RV\e[0m"
    exit
fi

################################################################################

DIR=~/".kde/share/apps/color-schemes/"
# IFILE="$DOWNLOADEDREPO/Colors/Glassy.colors" #Don't have file included yet
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: ' $DIR 'Aborting without deploying files'
    exit
fi

cp  "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($IFILE) failed failed with code: $RV\e[0m"
    exit
fi

################################################################################

DIR=~/".local/share/plasma/desktoptheme/"
IFILE="$DOWNLOADEDREPO/Plasma/Glassy"
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: '$DIR'Aborting without deploying files'
    exit
fi

cp -r "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($IFILE) failed failed with code: $RV\e[0m"
    exit
fi

################################################################################

DIR=~/".local/share/plasma/look-and-feel"
IFILE="$DOWNLOADEDREPO/Global/Glassy"
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: '$DIR'Aborting without deploying files'
    exit
fi

cp -r "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($FILE) failed with code: $RV\e[0m"
    exit
fi

################################################################################

DIR=~/".local/share/aurorae/themes/"
IFILE="$DOWNLOADEDREPO/Aurorae/Glassy"
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: '$DIR'Aborting without deploying files'
    exit
fi

cp -r "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($FILE) failed with code: $RV\e[0m"
    exit
fi

################################################################################

DIR=~/".local/share/konsole"
IFILE="$DOWNLOADEDREPO/Konsole/Glassy.colorscheme"
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: '$DIR'Aborting without deploying files'
    exit
fi

cp -r "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($FILE) failed with code: $RV\e[0m"
    exit
fi

################################################################################

DIR=~/".config/Kvantum"
IFILE="$DOWNLOADEDREPO/Kvantum/Glassy"
echo 'Deploy ' "$DIR"
if [ ! -d "$DIR" ]; then
    echo 'Directory does not exist: '$DIR'Aborting without deploying files'
    exit
fi

cp -r "$IFILE" "$DIR"
RV="$?"
if [ ! "$RV" -eq "0" ]; then
    echo -e "\e[0;31mfile copy ($FILE) failed with code: $RV\e[0m"
    exit
fi

################################################################################
# Declare victory
################################################################################

echo 'Done!'
