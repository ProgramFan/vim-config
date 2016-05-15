#!/bin/bash
#

VERSION=$(cat VERSION)
echo "$(($VERSION + 1))" > VERSION
git add VERSION
git commit -m "Force update on $(date +%Y-%m-%d@%H:%M:%S)"
git push origin master
