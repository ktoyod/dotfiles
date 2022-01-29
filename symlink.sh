#!/bin/bash

set -eu

DOTDIR=${HOME}/dotfiles

create_dot_ln() {
	ORIGIN_SOURCE_PATH=$1/$2
	NEW_LINK_PATH=${HOME}/.$2

	ln -s ${ORIGIN_SOURCE_PATH} ${NEW_LINK_PATH}
	echo "created dot ln '${NEW_LINK_PATH}'"
}

create_ln() {
	ORIGIN_SOURCE_PATH=${DOTDIR}/$1
	NEW_LINK_PATH=${HOME}/$1
	
	ln -s ${ORIGIN_SOURCE_PATH} ${NEW_LINK_PATH}
	echo "created ln '${NEW_LINK_PATH}'"
}

dotfiles=(
	"tmux.conf"
)
for dotfile in "${dotfiles[@]}" ; do
	create_dot_ln ${DOTDIR} ${dotfile}
done

#
# for zsh (with prezto)
#
ZSHDIR=${DOTDIR}/zsh
ln -s ${ZSHDIR}/zprezto ${HOME}/.zprezto
ln -s ${ZSHDIR}/p10k.zsh ${HOME}/.p10k.zsh

ZSHDOTDIR=${ZSHDIR}/zprezto/runcoms
zshdotfiles=(
	"zlogin"
	"zlogout"
	"zpreztorc"
	"zprofile"
	"zshenv"
	"zshrc"
)
for zshdotfile in "${zshdotfiles[@]}" ; do
	create_dot_ln ${ZSHDOTDIR} ${zshdotfile}
done

