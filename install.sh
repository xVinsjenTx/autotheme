#!/bin/bash
# -*- coding: utf-8 -*-

LAUNCHER=$(basename $0 .sh)
VERSION=0.2

echo "$LAUNCHER: Version $VERSION"

DOWNLOADDIR=~/"Downloads/auto-theme"
GITREPO='https://github.com/Pr0cella/glassy-kde'
DOWNLOADEDREPO="$DOWNLOADDIR/glassy-kde"

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
IFILE="$DOWNLOADEDREPO/Colors/Glassy.colors"
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
# Declare victory
################################################################################

echo 'Done!'

