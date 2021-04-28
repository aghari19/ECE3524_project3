#! /bin/bash

clear
path=$2

if [ "$#" -ne 2 ]; then
  echo "Incorrect number of arguments. Please enter the starting directory and output html file" >&2
  exit 1
fi

if ! [ -e "$1" ]; then
  echo "$1 Starting directory not found" >&2
  exit 1
fi

echo "<html>" >> $path
echo "<body>" >> $path

cd $1
echo $PWD
depth=0

# Recursive function
TRAVERSAL()
{
  list=`ls -1`
  for filename in $list
  do
    echo $filename
    if test -f $filename
    then
      n_of_space=`expr $depth + 1`
      for j in $(seq 1 $n_of_space)
      do
        echo "&nbsp; " >> $path
      done
      if  [ -r $filename ]
      then
        echo "$filename<br />" >> $path
      else
        echo "No read permission for $filename" >&2
      fi
    else
      n_of_space=`expr $depth + 1`
      for j in $(seq 1 $n_of_space)
      do
        echo "&nbsp; " >> $path
      done
      if  [ -r $filename ]
      then
        echo "$filename<br />" >> $path
      else
        echo "No read permission for $filename" >&2
      fi
      cd $filename
      depth=`expr $depth + 1`
      TRAVERSAL
      cd ..
      depth=`expr $depth - 1`
    fi
  done
}
echo "</html>" >> $path
echo "</body>" >> $path

TRAVERSAL
