#!/bin/sh
urxvt -cd "$HOME/Projects/$(ls $HOME/Projects/ | dmenu)"
