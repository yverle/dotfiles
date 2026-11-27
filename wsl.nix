{ username, hostname, pkgs, lib, inputs, ... }:
{
  time.timeZone = "Europe/Brussels";
  networking.hostName = "${hostname}";

  programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  programs.command-not-found.enable = false;

  environment.enableAllTerminfo = true;

  security.sudo.wheelNeedsPassword = false;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "github-copilot-cli" ];

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };

  home-manager.users.${username} = {
    imports = [ ./home.nix ];
  };

  wsl = {
    enable = true;
    defaultUser = username;
    interop.includePath = false;
    wslConf.automount.root = "/mnt";
    wslConf.network.generateHosts = false;
    startMenuLaunchers = false;
    docker-desktop.enable = false;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [username];
      accept-flake-config = true;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "26.05";
}
