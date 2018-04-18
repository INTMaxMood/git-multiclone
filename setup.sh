#!/usr/bin/env bash

readonly _dir="$(dirname "$(readlink -f "$0")")"

# shellcheck disable=SC2034
_arg="$1"

if [[ "$1" == "install" ]] ; then

  printf "%s\n" "Create symbolic link to /usr/local/bin"

  if [[ -e "${_dir}/bin/git-multiclone" ]] ; then

    if [[ ! -e "/usr/local/bin/git-multiclone" ]] ; then

      ln -s "${_dir}/bin/git-multiclone" /usr/local/bin

    fi

  fi

  printf "%s\n" "Create man page to /usr/local/man/man8"

  if [[ -e "${_dir}/doc/man8/git-multiclone.8" ]] ; then

    if [[ ! -e "/usr/local/man/man8/git-multiclone.8.gz" ]] ; then

      mkdir -p /usr/local/man/man8
      cp "${_dir}/doc/man8/git-multiclone.8" /usr/local/man/man8
      gzip /usr/local/man/man8/git-multiclone.8

    fi

  fi

elif [[ "$1" == "uninstall" ]] ; then

  printf "%s\n" "Remove symbolic link from /usr/local/bin"

  if [[ -L "/usr/local/bin/git-multiclone" ]] ; then

    unlink /usr/local/bin/git-multiclone

  fi

  printf "%s\n" "Remove man page from /usr/local/man/man8"

  if [[ -e "/usr/local/man/man8/git-multiclone.8.gz" ]] ; then

    rm /usr/local/man/man8/git-multiclone.8.gz

  fi

fi

exit 0
