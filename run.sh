#!/bin/sh

REPO_DIR=../schrodingers-box
CAT_FILE=cat.txt

mkdir $REPO_DIR
cd $REPO_DIR
git init

echo $(()) > cat
if [[ $(($RANDOM % 2)) -eq 0 ]]; then
	echo 'dead' > $CAT_FILE
else 
	echo 'live' > $CAT_FILE
fi

git add .
git commit -m "box" --quiet

rm $CAT_FILE

git add .
git commit -m "hide box" --quiet

gh repo create --private
git push origin HEAD -u