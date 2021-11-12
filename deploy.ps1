# Build locally
git checkout master
# jekyll build

# Create temporary folder
$T="$($Env:temp)\tmp$([convert]::tostring((get-random 65535),16).padleft(4,'0')).tmp"
New-Item -ItemType Directory -Path $T

# Copy HTML source into the temporary folder along with gitignore
Copy-Item .\_site\* -Destination $T -Recurse
Copy-Item .gitignore -Destination $T

# Switch branches to the live branch, push changes
git checkout gh-pages

# Copy HTML souce into the hosting branch
Copy-Item $T\* -Destination . -Recurse

# Commit and push changes
git add .
git commit -m "Deployment of portfolio"
git push

# Change back to dev branch
git checkout master
