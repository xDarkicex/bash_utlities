function proc(){
  sysctl -a | grep maxproc
if [ "$1" == "--reset" ]; then
  sudo sysctl -w kern.maxproc=2128 &&
  sudo sysctl -w kern.maxprocperuid=1418 &&
  echo "succesfulling reset maxproc";
fi
}
