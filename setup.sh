#!/usr/bin/env bash

readonly _dir="$(dirname "$(readlink -f "$0")")"

# shellcheck disable=SC2034
_arg="$1"

if [[ "$1" == "install" ]] ; then

  printf "%s\n" "Create symbolic link to /usr/local/bin"

  if [[ -e "${_dir}/bin/gitpunk" ]] ; then

    if [[ ! -e "/usr/local/bin/gitpunk" ]] ; then

      ln -s "${_dir}/bin/gitpunk" /usr/local/bin

    fi

  fi

  printf "%s\n" "Create man page to /usr/local/man/man8"

  if [[ -e "${_dir}/doc/man8/gitpunk.8" ]] ; then

    if [[ ! -e "/usr/local/man/man8/gitpunk.8.gz" ]] ; then

      cp "${_dir}/doc/man8/gitpunk.8" /usr/local/man/man8
      gzip /usr/local/man/man8/gitpunk.8

    fi

  fi

elif [[ "$1" == "uninstall" ]] ; then

  printf "%s\n" "Remove symbolic link from /usr/local/bin"

  if [[ -L "/usr/local/bin/gitpunk" ]] ; then

    unlink /usr/local/bin/gitpunk

  fi

  printf "%s\n" "Remove man page from /usr/local/man/man8"

  if [[ -e "/usr/local/man/man8/gitpunk.8.gz" ]] ; then

    rm /usr/local/man/man8/gitpunk.8.gz

  fi

fi

exit 0
