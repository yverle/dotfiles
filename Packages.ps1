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
                Target = "$($PROFILE.CurrentUserAllHosts)"
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

    @{
        Name = 'cli-tools'
        Configure = @(
            @{
                Type = 'Symlink'
                Source = 'sessionizer.ps1'
                Target = "$HOME\bin\sessionizer.ps1"
            }
        )
    }

    @{
        Name = 'zellij'
        Install = @{
            Type = 'WinGet'
            Id = 'Zellij.Zellij'
        }
        Configure = @(
            @{
                Type = 'Symlink'
                Source = 'config.kdl'
                Target = "$HOME\AppData\Roaming\Zellij\config\config.kdl"
            }
            @{
                Type = 'Symlink'
                Source = 'layouts'
                Target = "$HOME\AppData\Roaming\Zellij\layouts"
            }
        )
    }

    @{
        Name = 'yazi'
        Install = @{
            Type = 'WinGet'
            Id = 'sxyazi.yazi'
        }
        Configure = @(
            @{
                Type = 'Symlink'
                Source = 'config'
                Target = "$HOME\AppData\Roaming\yazi\config"
            }
            @{
                Type = 'Symlink'
                Source = 'flavors'
                Target = "$HOME\AppData\Roaming\yazi\flavors"
            }
            @{
                Type = 'Symlink'
                Source = 'theme.toml'
                Target = "$HOME\AppData\Roaming\yazi\theme.toml"
            }
        )
    }

    @{
        Name = 'windows-terminal'
        Install = @{
            Type = 'WinGet'
            Id = 'Microsoft.WindowsTerminal'
        }
        Configure = @(
            @{
                Type = 'Symlink'
                Source = 'settings.json'
                Target = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
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
