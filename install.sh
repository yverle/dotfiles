#!/bin/sh
stow -D nvim
stow -D localbin
stow -D xdg_home

stow nvim -t ~
stow xdg_home -t ~
stow localbin -t ~
