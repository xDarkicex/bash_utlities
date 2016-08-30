# goLang path spec
export GOROOT="/usr/local/go"
export GOPATH="$HOME/Desktop/goworkspace"
export PATH="$HOME/Desktop/goworkspace/bin:$PATH"


#Make Basic go file.
function gopher() {
if (( $# !=1 )); then
  current_dir=${PWD##*/} &&
  foo=`echo ${current_dir:0:1} | tr  '[a-z]' '[A-Z]'`${current_dir:1}
  echo "package main" > $foo.go
  echo "  import(

  )" >> $foo.go
  echo "  func init(){

  }" >> $foo.go

elif [ -n "$1" ]; then
  name=$1
  foo=`echo ${name:0:1} | tr  '[a-z]' '[A-Z]'`${name:1}
  echo "package main" > $foo.go
  echo "  import(

  )" >> $foo.go
  echo "  func init(){

  }" >> $foo.go

fi
  echo "  func main(){


}" >> $foo.go

}

#Make simple go directory
function goapp() {
  #catch variables
  dir_name=$1
  current_dir=${PWD}
  mkdir $dir_name
}
