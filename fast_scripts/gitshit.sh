#!/bin/bash

git status ;
git pull
git add -A
echo "comment:"
read comment ;
git commit -m "$comment"
echo "pushed!!!"
git push
git status
