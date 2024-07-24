#!/bin/bash

if [ "$1" == "-h" ] ; then
    echo "Usage: `basename $0` [-h]"
    echo "Arguments: [1] filename, [2] filedir, [3] topic, [4] title" 
    exit 0
fi


cudir=$(pwd)
filename=$1.tex
filedir=$cudir/$2
curdate=$(date '+%Y--%b--%d')
my_title=$3
latex_title='\\title{'$4'}'
latex_topic='\\topic{$3}'
latex_date='\\date{$curdate}'
# cp -v cudir
echo " "
echo "Running script"
echo "================================="
echo "Creating file dated $curdate"
echo "titled $my_title"
echo "================================="

if [ -d $filedir ]; then
  echo "Directory already exists."
else 
  echo "Creating directory"
  mkdir $filedir
fi

cp -v ./templates/template.tex $filedir/$filename
cp -v ./templates/preamble.tex $filedir/preamble.tex

echo $latex_title
sed -i '5i'$latex_title $filedir/$filename 
sed -i '6i'$latex_topic $filedir/$filename 
sed -i '7i'$latex_date  $filedir/$filename 


echo "........................... Done!"

