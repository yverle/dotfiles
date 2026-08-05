@(
    @{
        Name = 'git'
        Install = @{
            Type = 'WinGet'
            Id = 'Git.Git'
        }
    }

    @{
        Name = '7zip'
        Install = @{
            Type = 'WinGet'
            Id = '7zip.7zip'
        }
    }

    @{
        Name = 'ripgrep'
        Install = @{
            Type = 'WinGet'
            Id = 'BurntSushi.ripgrep.MSVC'
        }
    }

    # @{
    #     Name = 'zoxide'
    #     Install = @{
    #         Type = 'WinGet'
    #         Id = 'ajeetdsouza.zoxide'
    #     }
    # }

    @{
        Name = 'fzf'
        Install = @{
            Type = 'WinGet'
            Id = 'junegunn.fzf'
        }
    }

    @{
        Name = 'jq'
        Install = @{
            Type = 'WinGet'
            Id = 'jqlang.jq'
        }
    }

    @{
        Name = 'pwsh'
        Install = @{
            Type = 'WinGet'
            Id = 'Microsoft.PowerShell'
        }
        Configure = @(
            @{
                Type = 'Symlink'
                Source = 'Profile.ps1'
                Target = "$PROFILE.CurrentUserAllHosts"
            }
            @{
                Type = 'Script'
                Path = 'Install-PowerShellModules.ps1'
            }
        )
    }

    @{
        Name = 'fonts'
        Configure = @(
            @{
                Type = 'Script'
                Path = 'Install-Fonts.ps1'
            }
        )
    }

    @{
        Name = 'fd'
        Install = @{
            Type = 'WinGet'
            Id = 'sharkdp.fd'
        }
    }

    @{
        Name = 'wezterm'
        Install = @{
            Type = 'WinGet'
            Id = 'wez.wezterm'
        }
        Configure = @(
            @{
                Type = 'Symlink'
                Source = '.wezterm.lua'
                Target = "$HOME\.wezterm.lua"
            }
            @{
                Type = 'Symlink'
                Source = '.wezterm'
                Target = "$HOME\.wezterm"
            }
        )
    }

    @{
        Name = 'zen'
        Install = @{
            Type = 'WinGet'
            Id = 'Zen-Team.Zen-Browser.Optimized'
        }
    }

    @{
        Name = 'neovim'
        Install = @{
            Type = 'WinGet'
            Id = 'Neovim.Neovim'
        }
        Configure = @(
            @{
                Type = 'Symlink'
                Source = '.'
                Target = "$HOME\AppData\Local\nvim"
            }
        )
    }

    # @{
    #     Name = 'everything'
    #     Install = @{
    #         Type = 'WinGet'
    #         Id = 'voidtools.Everything'
    #     }
    # }
)
