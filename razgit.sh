#!/bin/bash

# raz https://github.com/cpunivangers/madeb12
VERSION=13.$(date +%y%m%d.%H%M)

rm -rf .git
git init
git config user.email "christian.pottier@univ-angers.fr"
git config user.name "cpunivangers"
git remote add origin git@github.com:cpunivangers/madeb13.git
#~ echo "$VERSION" > Version.txt
git add -A
git commit -m "Version $VERSION"
git push -f origin main
git tag -a $VERSION -m "Version $VERSION"
git push origin $VERSION
#~ git release $VERSION -c
