{ config, pkgs, inputs, ... }:

{

  nix.settings.trusted-users = [ "shiba" ];

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  home.username = "shiba";
  home.homeDirectory = "/home/shiba";

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./packages.nix
    ./git.nix
    ./starship.nix # I also put fish there
    ./gammastep.nix
    ./hyprland.nix
    ./fastfetch.nix
    ./fuzzel.nix
    ./kitty.nix
    ./stylix.nix # Automatic home-manager module detection
    ./eww.nix
    #./nixvim.nix
  ];

  # Symlink example
  #xdg.configFile."hypr/hyprland.conf".source =
  #  config.lib.file.mkOutOfStoreSymlink ./hypr/hyprland.conf;

  # Programs and services here



  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

