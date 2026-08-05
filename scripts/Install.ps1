[CmdletBinding()]
param()

Set-StrictMode -Version Latest

function Install-WingetPackage {
    param(
        [string] $Id
    )

    if (winget list --id $Id --exact | Select-String $Id) {
        Write-Host "$Id is already installed, skipping"
        return
    }

    winget install `
        --id $Id `
        --exact `
        --accept-package-agreements `
        --accept-source-agreements
}

function Install-Package {
    param ($Package)

    if (-not $Package.ContainsKey('Install')) {
        return
    }

    switch ($Package.Install.Type) {
        'WinGet' {
            Install-WingetPackage $Package.Install.Id
        }

        'Script' {
            & $Package.Install.Path
        }

        default {
            throw "Unknown installer type '$($Package.Install.Type)'"
        }
    }
}
