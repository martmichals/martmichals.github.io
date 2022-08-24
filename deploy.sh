# Exit when any command fails
set -e

# Keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# Build locally
git checkout master 
jekyll build

# Copy site to temporary directory
tmpdir=$(mktemp -d "${TMPDIR:-/tmp/}$(basename $0).XXXXXXXXXXXX")
cp -r ./_site/* $tmpdir
cp .gitignore $tmpdir/.gitignore

# Checkout published branch
git checkout gh-pages
rm -rf ./*
cp -r $tmpdir/* .
git add .
git commit -m "Deployment of portfolio"
git push

# Delete the temporary directory
rm -rf $tmpdir

# Return to master branch
git checkout master