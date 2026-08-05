[CmdletBinding()]
param()

Set-StrictMode -Version Latest

function New-SymbolicLink {
    param(
        [string]$Source,
        [string]$Target
    )

    if (Test-Path $Target) {
        Remove-Item $Target -Force -Recurse
    }

    New-Item `
        -ItemType SymbolicLink `
        -Path $Target `
        -Target $Source | Out-Null
}

function Invoke-ConfigurationAction {
    param(
        $DotRoot, 
        $Action
    )

    switch ($Action.Type) {
        'Symlink' {
            $source = Join-Path $DotRoot $Action.Source

            New-SymbolicLink `
                -Source $source `
                -Target $Action.Target
        }

        'Script' {
            $scriptPath = Join-Path $DotRoot $Action.Path
            & $scriptPath
        }

        default {
            throw "Unknown configuration type '$($Action.Type)'"
        }
    }
}


function Invoke-PackageConfiguration {
    param($Package)

    $dotRoot = Join-Path $PSScriptRoot '..\packages'
    $dotRoot = Join-Path $dotRoot $Package.Name

    if (-not $Package.ContainsKey('Configure')) {
        return
    }

    foreach ($Action in $Package.Configure) {
        Invoke-ConfigurationAction `
            -DotRoot $dotRoot `
            -Action $Action
    }
}
