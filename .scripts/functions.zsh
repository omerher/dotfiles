#!/usr/bin/zsh

function cpl {
  history | tail -n 1 | perl -ple 's/\d+\s+//' | xclip
}
