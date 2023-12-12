#!/bin/bash

yell() {
  echo "$0: $*" >&2
}

die() {
  yell "$*"
  exit 111
}

try() {
  "$@" || die "cannot $*"
}

get_os() {
  uname -s
}

check_uname() {
  local os
  os=$(get_os)
  if [ -z "$os" ]; then
    die "Panic system does not have uname installed"
  fi
}

print_banner() {
  local version="2.2.0"
  cat <<EOF
---------------------------------------------------------------------------------------------
#  Automated Golang installer                                                               #
#  ----------------------                                                                   #
#  | Version #$version     |                                                                   #
#  ----------------------                                                                   #
#  By: Gentry Rolofson                                                                      #
#  More info: https://bitdev.io                                                             #
#  Github: @xDarkicex                                                                       #
#                                                                                           #
---------------------------------------------------------------------------------------------
EOF
}

workspace_setup() {
  local PS3="github.com/"
  local username

  echo "Enter GitHub username:"
  read -p ${PS3} username

  cd ~/"$workspace_dir" &&
  mkdir -p goworkspace/{bin,src,pkg}/github.com/"$username"/example &&
  # Make sample File
  cat <<EOF >main.go
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
EOF

  # Rest of the workspace setup...

  local Path='$PATH'
  cd ~ &&
  cat <<EOF >>.bash_profile
export GOROOT="/usr/local/go"
export GOPATH="\$HOME/${workspace_dir}/goworkspace/src/${username}"
export PATH="\$HOME/${workspace_dir}/goworkspace/bin:${Path}"
EOF

  go env
  cd "${local_dir}"
}

workspace_local() {
  local workspace=("Desktop" "Documents")
  local before_workspace=${PWD}

  PS3="Where do you want your Go workspace path? Options: [Desktop||Documents]: "
  select opt in "${workspace[@]}"; do
    case $opt in
      "Desktop") workspace_dir="Desktop" ;;
      "Documents") workspace_dir="Documents" ;;
    esac
    break
  done

  workspace_setup
}

install() {
  local current_dir=${PWD}
  local options=("Curl" "Wget")
  local go_url

  echo "Install Go"
  cd ~ || die "Failed to change directory to home"

  PS3="Do you want to use curl or wget? Options: [1||2]: "
  select opt in "${options[@]}"; do
    case $opt in
      "Curl")
        curl -# "${go_url}" >"${current_dir}"/golang.pkg &&
          try sudo installer -pkg "${current_dir}"/golang.pkg -target / &&
          workspace_local
        break
        ;;
      "Wget")
        echo "Do you have wget installed? Options: [1||2]: "
        select yn in "Yes" "No"; do
          case $yn in
            Yes)
              wget -P "${PWD}" -O golang.pkg "${go_url}" &&
                try sudo installer -pkg "${PWD}"/golang.pkg -target / &&
                workspace_local
              break
              ;;
            No)
              echo "Homebrew required. Do you have Homebrew installed? Options: [1||2]: "
              select yn in "Yes" "No"; do
                case $yn in
                  Yes)
                    try brew install wget &&
                      wget -P "${PWD}" -O golang.pkg "${go_url}" &&
                      try sudo installer -pkg "${PWD}"/golang.pkg -target / &&
                      workspace_local
                    break
                    ;;
                  No)
                    try /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
                      try brew install wget &&
                      wget -P "${PWD}" -O golang.pkg "${go_url}" &&
                      try sudo installer -pkg "${PWD}"/golang.pkg -target / &&
                      workspace_local
                    break
                    ;;
                esac
              done
              break
              ;;
          esac
        done
        break
        ;;
    esac
  done
}

update() {
  local current_dir=${PWD}
  local options=("Curl" "Wget")

  echo "Updating to current golang version ${urlgo}"
  PS3="Do you want to use curl or wget? Options: [1||2]: "
  select opt in "${options[@]}"; do
    case $opt in
      "Curl")
        curl -# "${go_url}" >"${current_dir}"/golang.pkg &&
          try sudo installer -pkg "${current_dir}"/golang.pkg -target / &&
          cd "${local_dir}"
        break
        ;;
      "Wget")
        wget -P "${PWD}" -O golang.pkg "${go_url}" &&
          try sudo installer -pkg "${PWD}"/golang.pkg -target / &&
          cd "${local_dir}"
        break
        ;;
    esac
  done
}

print_banner

echo "Force update. Warning: Will put you on Edge Versions of go. Options: [1||2]: "
force=("Yes" "No")
select opt in "${force[@]}"; do
  case $opt in
    "Yes") update ;;
    "No") break ;;
  esac
done

go_exists=$(which go)
if [ -z "$go_exists" ]; then
  install
elif [ "${localgo}" = "${urlgo}" ]; then
  echo "You are on the most current version of Go ${localgo}"
  go env

  cat <<EOF
          -------------------------------------------------------------
          #         *******     Congratulations      *******          #
          #                                                           #
          #         GoLang Version $go_version installed!              #  
          -------------------------------------------------------------
EOF
  exit 0
else
  exit 1
fi
