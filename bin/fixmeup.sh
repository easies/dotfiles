#!/bin/sh

exec git commit --fixup HEAD "$@" && EDITOR=true git rebase -i --autosquash HEAD~2
