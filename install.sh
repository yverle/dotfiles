#!/bin/sh
# TODO: Reorganise repo so all folders are in full (nvim => nvim/.config/nvim) to futureproof this script

mkdir -p ~/.config/nvim

stow -D nvim
stow -D xdg_home

stow nvim -t ~/.config/nvim
stow xdg_home -t ~
