param (
    [string] $SearchRoot = "$HOME\source\repos"
)

$ErrorActionPreference = 'Stop'

$MaxDepth = 4

function Get-SessionName {
    param (
        [string] $Path
    )

    return (Split-Path $Path -Leaf)
}

function Get-ExistingSessions {
    param ()

    $output = zellij list-sessions 2>$null

    if ($LASTEXITCODE -ne 0) {
        return @()
    }

    return @(
        $output |
            ForEach-Object {
                if ($_ -match '^([^\s\[]+)') {
                    $Matches[1]
                }
            }
    )
}

function Get-GitRepositories {
    param (
        [string] $Root
    )

    if (-not (Test-Path $Root)) {
        Write-Error "Search root doesn't exist: Root"
    }

    $gitDirs = fd `
        --hidden `
        --type d `
        --max-depth $MaxDepth `
        '^\.git$' `
        $Root `
        2>$null

    foreach ($gitDir in $gitDirs) {
        $repo = Split-Path $gitDir -Parent

        if ($repo) {
            $repo
        }
    }
}

$Repositories = @(
    Get-GitRepositories -Root $SearchRoot |
        Sort-Object -Unique
)

if ($Repositories.Count -eq 0) {
    Write-Host "No repositories found under $SearchRoot"
    exit 1
}

$Entries = foreach ($repo in $Repositories) {
    [System.IO.Path]::GetRelativePath($SearchRoot, $repo)
}

$Selected = $Entries |
    fzf `
        --height 80% `
        --layout reverse `
        --border `
        --delimiter "`t" `
        --with-shell "pwsh -NoProfile -Command" `
        "--prompt=repo > "

if (-not $Selected) {
    exit 0
}

$Repo = Join-Path $SearchRoot $Selected

$SessionName = Get-SessionName -Path $Repo
$SessionName = $SessionName -replace '[^\w.-]', '-'

$ExistingSessions = Get-ExistingSessions
if ($ExistingSessions -contains $SessionName) {
    zellij action switch-session $SessionName

    exit $LASTEXITCODE
}

if ($env:ZELLIJ) {
    zellij action switch-session $SessionName --cwd $Repo

    return $LASTEXITCODE
}

Push-Location $Repo
try {
    zellij attach --create $SessionName
} finally {
    Pop-Location
}
