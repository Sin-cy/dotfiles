# create git repo using gh
#!/bin/bash

name=${1:-${PWD##*/}}

git init -b main
git branch -m main
gh repo create ${name} --public --license "MIT"
git remote add origin git@github.com:Sin-cy/${name}.git
git fetch
git add .
git commit -m "Initialize repo via gh"
git rebase origin/main
git push --set-upstream origin main

echo
echo Added Repo at https://github.com/Sin-cy/${name}
