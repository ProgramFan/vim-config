# Prebuilt Vim Packages

[![Build Status](https://travis-ci.org/ProgramFan/vim-config.svg?branch=master)](https://travis-ci.org/ProgramFan/vim-config)

This repository contains TravisCI configuration and scripts to package atom
packages. Prebuilt packages are stored in `release-$TRAVIS_OS_NAME` branch.
Both OSX and Linux packages are packed.

## Usage

Just clone the content of `release-$TRAVIS_OS_NAME` branch into the
`~/.atom/packages` directory and go.

## Why Prebuilt Packages

I install the Atom editor on several different platforms (including OSX and
Fedora 22/23) and use a lot of packages to enhance the editing experience. One
tough task is to keep these packages in sync, both with upstream and among
different platforms. This is hard because only my OSX box is connected to the
Internet. The easiest way is to copy `~/.atom/packages` of OSX around. But OSX
packages and Linux packages may contains different node modules as well as
different binary components. This is the case for the `remote-edit` and the
`markdown-themeable-pdf` package. One viable way is to virtualise my OSX box
as an Fedora platform and maintain the OSX and the Linux packages separately.
This creates a good load of maintenance pressure.

The jekyll-asciidoc approach provides an general idea for this type of
problems (see [this
page](http://eshepelyuk.github.io/2014/10/28/automate-github-pages-travisci.html)).
One setups a repository on GitHub, connects TravisCI to it, and customizes the
CI process to generate the content and push the content to another branch of
the repository. One can use this approach to automatically generate static
html via asciidoctor (which is poorly supported by the GitHub page generator).
I use this approach to automate the multi-platform atom package building.

## The Approach

Details of the approach can be found in the `build-packages.sh`. Here is only
a brief overview. I maintain a package list in `atom-package-list.txt` as well
as a version tag in `VERSION`. When one of the two files is changed, it
triggers a package install via apm and push the new contents into
`release-$TRAVIS_OS_NAME` branch. Other changes would do nothing.

## Note on Fair Use of Shared Resources

TravisCI is a shared resource for CI and is not designed for this type of
tasks. While the above approach is allowed, it shall consume as less resources
as possible. So do not push too often.

