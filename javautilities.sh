function brewjava() {
  rm -f *.class &&
  rm -f *.jar &&
  javac $1.java &&
  jar cvfe $1.jar $1 *.class;
  rm -f *.class
}
function venti() {
if (( $# !=1 )); then
  current_dir=${PWD##*/} &&
  foo=`echo ${current_dir:0:1} | tr  '[a-z]' '[A-Z]'`${current_dir:1}
  brewjava $foo &&
  java -jar $foo.jar
else
  #If no prams
  brewjava $1 &&
  java -jar $1.jar
fi
}

#Flavors
function coldbrew(){
  name=$1
  echo "$main"
  echo "public class ${name}{" > $1.java
  echo "  ${name}(){ System.out.println(\"${name} constructor\"); }" >> $1.java
  if [ "$2" == "--main" ]; then
    echo "  public static void main(String args[]){ }" >> $1.java
  fi
  echo "}" >> $1.java
}
