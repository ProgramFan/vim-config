#!/bin/bash

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
    echo "this is PR, exiting"
    exit 0
fi

# enable error reporting to the console
set -e

# check if we need package rebuild/update
VERSION_CHANGED=0
if [ $(git diff --name-only ${TRAVIS_COMMIT_RANGE} | grep "VERSION" | wc -l) -ge 1 ]; then
  VERSION_CHANGED=1
  echo "VERSION changed, need package update."
fi
LIST_CHANGED=0
if [ $(git diff --name-only ${TRAVIS_COMMIT_RANGE} | grep "vimrc" | wc -l) -ge 1 ]; then
  LIST_CHANGED=1
  echo "vimrc changed, need package update."
fi
NEED_PACKAGE_UPDATE=0
if [ $(($VERSION_CHANGED + $LIST_CHANGED)) -ge 1 ]; then
  NEED_PACKAGE_UPDATE=1
  echo "Package update scheduled."
fi

# only update config if not package update is needed
if [ $NEED_PACKAGE_UPDATE -eq 0 ]; then
  echo "No package update is needed, exit"
  exit
fi

echo "Using Vim version:"
vim --version

# install vim-plug
mkdir -p $HOME/.vim/bundles
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim packages
INSTALL_PACKAGES="$(cat ./vim-package-list.txt)"

if [ "$INSTALL_PACKAGES" != "none" ]; then
  echo "Installing vim packages ..."
  vim -u ./vimrc +PlugInstall +q
fi

echo "Uploading packages ..."
echo "  Cloning remote repository ..."
branch=release-${TRAVIS_OS_NAME}
url=https://${GH_TOKEN}@github.com/Programfan/vim-config.git
git clone ${url} -b $branch vim-packages
echo "  Preparing package files ..."
rm -rf vim-packages/*
find ${HOME}/.vim/bundles -name .git | xargs rm -rf
cp -rf ${HOME}/.vim/bundles/* vim-packages
echo "$(date +%Y-%m-%d@%H:%M:%S)" > vim-packages/VERSION
cd vim-packages
git config user.email "zyangmath@gmail.com"
git config user.name "Yang Zhang"
echo "  Adding files to local git repository ..."
git add -A . &>/dev/null
git commit -m "Update packages $(date +%Y-%m-%d@%H:%M:%S)" &>/dev/null
echo "  Pushing to remote repository ..."
git push origin $branch:$branch &>/dev/null
echo "Done."

exit
