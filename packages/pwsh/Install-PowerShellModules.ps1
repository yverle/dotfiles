[CmdletBinding()]
param()

Set-StrictMode -Version Latest

$Modules = @(
    # 'CompletionPredictor'
    'PSFzf'
    'PSScriptAnalyzer'
    'Terminal-Icons'
)

foreach ($module in $Modules) {
    if (!(Get-Module -ListAvailable -Name $module)) {
        Write-Host "Installing module '$Module'"
        Install-Module -Name $module -Force -AcceptLicense -Scope CurrentUser
    }
}
