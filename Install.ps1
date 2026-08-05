[CmdletBinding()]
param()

#Requires -RunAsAdministrator

Set-StrictMode -Version Latest

Set-Location $PSScriptRoot
[Environment]::CurrentDirectory = $PSScriptRoot

. '.\scripts\Install.ps1'
. '.\scripts\Configure.ps1'

$Packages = & '.\Packages.ps1'

foreach ($package in $Packages) {
    Write-Host "Installing and configuring '$($Package.Name)'"

    Install-Package $Package
    Invoke-PackageConfiguration $Package
}

