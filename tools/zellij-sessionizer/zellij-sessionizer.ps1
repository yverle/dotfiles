param (
    [String[]] $RootDirectories = @("$HOME/source/repos/")
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Invoke-InDirectory {
    param (
        [Parameter(Mandatory)]
        [String] $Path,
        [Parameter(Mandatory)]
        [ScriptBlock] $Script
    )

    try {
        Push-Location $Path
        & $Script
    } finally {
        Pop-Location
    }
}

$Required = 'fd','fzf','zellij'
$Missing = $Required | Where-Object { -not (Get-Command $_ -ErrorAction SilentlyContinue) }

if ($Missing) {
    throw "Missing required dependencies: $($Missing -join ', ')"
}

# Only interested in Git projects
$GitDirs = foreach ($root in $RootDirectories) {
    if (Test-Path $root) {
        fd '.git' "$root" --type d --hidden --prune
    }
}

if (-not $GitDirs) {
    Write-Warning 'No Git repositories found.'
    return
}

$Repos = $GitDirs |
    ForEach-Object { Split-Path $_ -Parent } |
    Sort-Object -Unique

$Selected = $Repos | fzf
if ([String]::IsNullOrWhiteSpace($Selected)) {
    Write-Warning 'No directory chosen'
    return
}
$Selected = $Selected.Trim()

# Only keep the directory name, strip any non-alphanumeric characters
$SessionName = Split-Path $Selected -Leaf
$SessionName = ($SessionName -replace '[^a-zA-Z0-9]', '_').ToLower().Trim('_')

if ([String]::IsNullOrWhiteSpace($SessionName)) {
    Write-Warning 'Could not derive a valid session name.'
    return
}

$ExistingSessions = $(zellij list-sessions --short --no-formatting)
$SessionExists = $ExistingSessions -contains $SessionName

# Zellij doesn't have a `--cwd` command so no way of starting a session at a path at this point...
# Dirty workaround is to cd into the directory, create the session and return back to the previous directory
# in the session that ran the command.
if ($env:ZELLIJ) {
    if ($SessionExists) {
        zellij action switch-session $SessionName
    } else {
        # BUG: Doesn't change directory in new session
        Invoke-InDirectory -Path $Selected -Script {
            zellij action switch-session $SessionName
        }
    }
} else {
    Invoke-InDirectory -Path $Selected -Script {
        zellij attach $SessionName --create
    }
}

