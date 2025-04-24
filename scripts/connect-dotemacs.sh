#!/bin/bash

ln -s /vendor/dot-emacs/init.el ~/.emacs.d/
mkdir -p ~/.config/emacs
ln -s /vendor/dot-emacs/readme.org ~/.config/emacs/emacs-config.org
mkdir -p ~/.site-lisp/
echo "(setq location 'docker)" >~/.site-lisp/location.el
cp ~/emacs-support/local-post.el ~/.site-lisp/local-post.el
