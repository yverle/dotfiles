# Dotfiles

These are my dotfiles, currently I only actively work on Windows so the install scripts only work there.
The individual dots (e.g. Neovim) should still work perfectly on other operating systems if you manually symlink them.

Directory layout looks like so:
```
├───packages
│   ├───package1
│   ├───package2
├───scripts
│   ├───Install.ps1
│   ├───Configure.ps1
├───Install.ps1
├───Packages.ps1
```

`Packages.ps1` is the main configuration file, this contains a list of symlinks, the WinGet id and any scripts that may need to be ran.
All paths inside the configuration file are relative to the self-contained directory in `packages`.

Installation and configuration is handled via the main entrypoint `Install.ps1` which will iterate over the `Packages.ps1` file
As symlinking is an administrative action on Windows this requires you to run the script as Administrator.

## TODO:
- zen: install extensions
- nvim: autocomplete over blink?
- nvim: roslyn for .net?
- general: install and configure powertoys
- general: configure Windows settings
- nvim: update keybinds (see internal notes)
