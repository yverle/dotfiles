$ProgressPreference = 'SilentlyContinue'

# Set Neovim as editor for everything
[System.Environment]::SetEnvironmentVariable('EDITOR', 'nvim.exe', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('K9S_EDITOR', 'nvim.exe', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('KUBE_EDITOR', 'nvim.exe', [System.EnvironmentVariableTarget]::User)

# Install Terminal Icons
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

# Install PSFzf
Install-Module -Name PSFzf -Repository PSGallery -Force

