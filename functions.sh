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
#bash login override
function refresh() {
  clear &&
  bash --login;
}
function openweb() {
  open -a "google chrome" $1
}
function rename(){
  mv $1 $2
}
function utilities() {
  current_location=${PWD}

  if [ "$1" == "help" ]; then
    echo "To use this Function please provide a utility you would like to edit."
    echo "List of availible Options: "
    echo "alias"
    echo "settings"
    echo "functions"
    echo "startup"
    echo "git"
    echo "java"
    echo "go"
    echo "help Will bring you here."
    echo "--utilites will take you to the utilites directory."
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
  if [ "$1" == "go" ]; then
    cd ~/.utilities &&
    open goutilities.sh
  fi
  if [ "$1" == "utilities" ]; then
    cd ~/.utilities &&
    ls
  else
    cd ${current_location}
  fi
}
