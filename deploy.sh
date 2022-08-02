# Exit on command error
set -e

# Track last executed command, send error
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# Build locally
git checkout master
jekyll build

# Make temporary directory
tmp_dir=$(mktemp -d -t ci-XXXXXXXXXX)

# Copy source to temporary directory
cp -r ./_site/* ${tmp_dir}

# Switch to live branch
git checkout gh-pages

# Add changes
rm -rf ./*
cp -r ${tmp_dir}/* .
git add .
git commit -m "Deployment of portfolio"
git push

# Change branches back to development branch
git checkout master
