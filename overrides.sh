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

function openweb(){
  open -a "google chrome" $1
}
