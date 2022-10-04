#!/bin/bash

emacs --daemon
emacsclient -c -n --eval '(load-file "~/.emacs.d/config.el")'
