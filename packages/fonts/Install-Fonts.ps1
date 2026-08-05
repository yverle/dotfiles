[CmdletBinding()]
param()

Set-StrictMode -Version Latest

$InstalledFonts = [System.Drawing.Text.InstalledFontCollection]::new().Families.Name

$RequiredFontsInstalled = ($InstalledFonts |
        Where-Object { $_ -like 'JetBrains*' }).Count -gt 0

if ($RequiredFontsInstalled) {
    Write-Host 'Fonts are already installed'
    return
}

# Clone to temporary directory and CD into it
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git "$env:TEMP\nerd-fonts"
Push-Location $env:TEMP\nerd-fonts

# Change ExecutionPolicy for current session as install.ps1 isn't signed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -force

# Install fonts
Write-Host 'Install fonts...'
./install.ps1 JetBrainsMono -WindowsCompatibleOnly

# Get back to previous directory to ensure nothing gets messed up
Pop-Location
