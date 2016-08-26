echo "Step one: build function"
echo "Build function takes tw arguments, the only one that matter, is no, if you do not have brew this will install brew."
echo "Do you have brew installed? if you do have brew then run build yes; else run build."
echo "Step two: goenv function"
echo "The goenv function will setup our go path at either Desktop or Documents"
echo "goenv takes two arguments Desktop of Documents"
echo "EXAMPLE: goenv Desktop"
#I know they will really take infinie arguments this is bata.

function build() {
  brew='$1'

  cd ~ &&
  current_dir=${PWD} &&
  if [ "$1" == "no" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install wget &&
  wget -P ${PWD} -O golang.pkg https://storage.googleapis.com/golang/go1.7.darwin-amd64.pkg &&
  sudo installer -pkg ${PWD}/golang.pkg -target /

}

function goenv() {
  env_root_dir=$1
  current_dir=${PWD}
  Path='$PATH'
  cd ~ &&
  # cd ${env_root_dir} &&
  echo "export GOROOT=\"/usr/local/go\"
export GOPATH=\"$HOME/${env_root_dir}/goworkspace\"
export PATH=\"$HOME/${env_root_dir}/goworkspace/bin:$Path\"" >> .bash_profile &&


  go env;
  cd $current_dir
}
