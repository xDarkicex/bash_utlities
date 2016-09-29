#
#Set Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}



#make and cd in dir
alias ls='ls -GFh'

mkdircd () {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}
#cd override function
function cdls() {
  cd "$@" &&
  ls;
}
# cd() { builtin cd "$@" && ls; }
#bash login override
function refresh() {
  clear &&
  printf '\e[3J'
  bash --login;
}
function findall() {
  sudo find / -iname *.app
}
function openweb() {
  open -a "google chrome" $1
}
function openatom() {
  open -a "Atom Beta.app" $1
}
function rename(){
  mv $1 $2
}
function utilities() {
  current_location=${PWD}
  if (( $# !=1 )); then
    echo "
----------------------------------------------------------------------------------
#       To use this Function please provide a utility you would like to edit.
#       List of availible Options:
#       [alias] | [settings] | [functions]
#       [startup] | [git] | [java]
#       [go] | [gitalias] | [help]
#       [cd]
#
#
----------------------------------------------------------------------------------
    "
  fi
  if [ "$1" == "help" ]; then
    echo "
----------------------------------------------------------------------------------
#       To use this Function please provide a utility you would like to edit.
#       List of availible Options:
#       [alias] | [settings] | [functions]
#       [startup] | [git] | [java]
#       [go] | [gitalias] | [help]
#       [cd]
#
#
----------------------------------------------------------------------------------
    "
  fi
  if [ "$1" == "alias" ]; then
    cd ~/.utilities &&
    open alias.sh
  fi
  if [ "$1" == "settings" ]; then
    cd ~/.utilities &&
    open settings.sh
  fi
  if [ "$1" == "functions" ]; then
    cd ~/.utilities &&
    open functions.sh
  fi
  if [ "$1" == "startup" ]; then
    cd ~/.utilities &&
    open startup.sh
  fi
  if [ "$1" == "git" ]; then
    cd ~/.utilities &&
    open gitutilities.sh
  fi
  if [ "$1" == "java" ]; then
    cd ~/.utilities &&
    open javautilites.sh
  fi
  if [ "$1" == "gitalias" ]; then
    cd ~/.utilities &&
    open gitalias.sh
  fi
  if [ "$1" == "go" ]; then
    cd ~/.utilities &&
    open goutilities.sh
  fi
  if [ "$1" == "cd" ]; then
    cd ~/.utilities &&
    ls
  else
    cd ${current_location}
  fi
}


#AWESOME GIT SETUP SHORT CUT FEED a Project name and a git url for this to work properly
function gitinit() {
  project_name=$1
  git_repo=$2
  git init &&
  echo "*DS_Store" > .gitignore &&
  echo "#README ${project_name}" > README.md &&
  git add . &&
  git commit -m "init commit ${project_name}" &&
  git remote add origin $2 &&
  git push -u origin master
}

function note() {
username="xDarkicex"
version="0.0.2"
write="writer.go"
read="reader.go"
run="main.go"
local=${PWD}
echo "GoPad github.com @xdarkicex"

if [ "$1" == "read" ]; then
    cd $GOPATH/src/github.com/${username}/writer/ &&
    go run ${read} &&
    cd ${PWD}

fi
if [ "$1" == "config" ]; then
    open $GOPATH/src/github.com/${username}/writer/config/config.Go &&
    cd ${PWD}

fi
if (( $# !=1 )); then
cd $GOPATH/src/github.com/${username}/writer/ &&
go run ${run} &&
cd ${PWD};
fi
}
 