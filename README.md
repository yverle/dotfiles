# Dotfiles

These are all my dotfiles shared across every operating system.
Everything here is managed by [Rotz](https://github.com/volllly/rotz), which handles the linking and installation of my tools.

Everything that gets installed (or has configuration files) or gets linked is put into its own directory and gets categorised by its parent directories.
On top of normal applications some fonts also get installed.

Due to some limitations in Rotz and WinGet the installation currently requires the continue on error switch, so a Rotz install has to be done as follows:

```
rotz install -c
```

Linking can be done as an administrator by executing the following command (force gets used to overwrite existing or default configuration):

```
rotz link --force
```

## TODO:

- Install extensions on Zen
- Do I want to remove zoxide?
