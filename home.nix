{ pkgs, config, username, ... }:

let
  link = config.lib.file.mkOutOfStoreSymlink;
  dots = "${config.home.homeDirectory}/repos/dotfiles/packages";

  unstable-packages = with pkgs.unstable; [
    # AI
    github-copilot-cli

    k9s
    kubectl
  ];
  stable-packages = with pkgs; [
    # Neovim requirements
    # TODO: Replace with lsps configured in Nix maybe?
    gcc
    tree-sitter
    nodejs
    unzip

    # AI
    pi

    # Programming languages
    dotnet-sdk_10

    # CLI tools
    azure-cli

    # Misc
    powershell
    wsl-open
    xdg-utils
  ];
in
{
  home = {
    username = username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      BROWSER = "wsl-open";
      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
      DOTNET_CLI_TELEMETRY_OPTOUT = "1";
      NUGET_CREDENTIALPROVIDER_FORCE_CANSHOWDIALOG_TO = "true";
    };

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.dotnet/tools"
    ];

    packages = 
      stable-packages
      ++ unstable-packages;

    stateVersion = "26.05";
  };

  programs = {
    home-manager.enable = true;
    # nix-index-database.comma.enable = true;

    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };

    bash.enable = true;
    ripgrep.enable = true;
    jq.enable = true;
    fd.enable = true;
    # command-nix-index.enable = true;
    # command-nix-index.enableZshIntegration = true;

    git = {
      enable = true;
      settings = {
        user.name = "Yenti Verle";
        user.email = "yenti.verle@vinci-energies.net";
        credential.helper =
         "/mnt/c/Program\\ Files/Git/ucrt64/bin/git-credential-manager.exe";
        credential."https://dev.azure.com".useHttpPath = true;
      };
    };

    neovim = {
      enable = true;
      package = pkgs.unstable.neovim-unwrapped;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      sideloadInitLua = true;
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initContent = ''
        setopt prompt_subst
        autoload -Uz add-zsh-hook

        _dotfiles_prompt_git() {
          typeset -g dotfiles_git_prompt=""
          local branch git_status
          branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null) ||
            branch=$(command git rev-parse --short HEAD 2>/dev/null) || return 0
          git_status=$(command git status --porcelain 2>/dev/null)

          # Branch names must not be interpreted as prompt formatting.
          branch=''${branch//\%/%%}
          dotfiles_git_prompt=" %F{blue}git:(%F{red}$branch%F{blue})%f"
          if [[ -n $git_status ]]; then
            dotfiles_git_prompt+=" %F{yellow}✗%f"
          fi
        }

        add-zsh-hook precmd _dotfiles_prompt_git
        PROMPT='%(?:%F{green}➜:%F{red}➜)  %F{cyan}%c%f''${dotfiles_git_prompt} '
      '';
    };

    zellij = {
      enable = true;
      package = pkgs.unstable.zellij;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    lsd = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # xdg.configFile."nvim".source = link "${dots}/nvim";
  # xdg.configFile."powershell".source = link "${dots}/pwsh";
  # xdg.configFile."zellij".source = link "${dots}/zellij";
  # xdg.configFile."yazi".source = link "${dots}/yazi";
}
