function Invoke-Utility {

<#
.SYNOPSIS
Invokes an external utility, ensuring successful execution.

.DESCRIPTION
Invokes an external utility (program) and, if the utility indicates failure by 
way of a nonzero exit code, throws a script-terminating error.

* Pass the command the way you would execute the command directly.
* Do NOT use & as the first argument if the executable name is not a literal.

.EXAMPLE
Invoke-Utility git push

Executes `git push` and throws a script-terminating error if the exit code
is nonzero.
#>

  $exe, $argsForExe = $Args
  # Workaround: Prevents 2> redirections applied to calls to this function
  #             from accidentally triggering a terminating error.
  #             See bug report at https://github.com/PowerShell/PowerShell/issues/4002
  $ErrorActionPreference = 'Continue'
  try { & $exe $argsForExe } catch { Throw } # catch is triggered ONLY if $exe can't be found, never for errors reported by $exe itself
  if ($LASTEXITCODE) { Throw "$exe indicated failure (exit code $LASTEXITCODE; full command: $Args)." }
}

# Build locally
Invoke-Utility git checkout master
jekyll build

# Create temporary folder
$T="$($Env:temp)\tmp$([convert]::tostring((get-random 65535),16).padleft(4,'0')).tmp"
New-Item -ItemType Directory -Path $T

# Copy HTML source into the temporary folder along with gitignore
Copy-Item .\_site\* -Destination $T -Recurse
Copy-Item .gitignore -Destination $T

# Switch branches to the live branch, push changes
Invoke-Utility git checkout gh-pages

# Add the changes
Remove-Item .\* -Recurse
Copy-Item $T\* -Destination . -Recurse
# git add .
# git commit -m "Deployment of portfolio"
# git push

# # Change back to dev branch
# git checkout master
