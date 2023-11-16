#!/bin/sh
pushd  ~/.dotfiles
home-manager switch -f ./users/fabrice/home.nix
popd
