#!/bin/bash

mode=$1

if [ -z "$mode" ]; then
  echo "Specify mode {basic|minimal}"
  exit 1
elif [ "$mode" == "basic" ]; then

  # init and download submodules
  for i in bundle/*; do git submodule init $i; done
  git submodule update

  # make necessary directories
  mkdir .swp .undo .backup

  ln -s basic-config.vim vimrc
elif [ "$mode" == "minimal" ]; then
  ln -s minimal-config.vim vimrc
else
  echo not recognized mode
fi
