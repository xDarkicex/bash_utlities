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
if (( $# !=1 )); then
  current_dir=${PWD##*/} &&
  foo=`echo ${current_dir:0:1} | tr  '[a-z]' '[A-Z]'`${current_dir:1}
  echo "public class ${foo}{" > $foo.java
  echo "  ${foo}(){ System.out.println(\"${foo} constructor\"); }" >> $foo.java
elif [ -n "$1" ]; then
  name=$1
  foo=`echo ${name:0:1} | tr  '[a-z]' '[A-Z]'`${name:1}
  echo "public class ${foo}{" > $1.java
  echo "  ${foo}(){ System.out.println(\"${foo} constructor\"); }" >> $1.java
else [ "$2" == "--main" ];
    echo "  public static void main(String args[]){ }" >> $1.java
  fi
  echo "}" >> $1.java
}
