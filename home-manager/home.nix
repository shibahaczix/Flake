

{ config, pkgs, inputs, ... }:

{
  home.username = "shiba";
  home.homeDirectory = "/home/shiba";

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./packages.nix
    ./starship.nix # I also put fish there
    ./hyprland.nix
    ./fastfetch.nix
    ./fuzzel.nix
    ./kitty.nix
    ./stylix.nix # Automatic home-manager module detection
    ./eww.nix
    ./nixvim.nix
  ];

  # Symlink for hyprland.conf example
  #xdg.configFile."hypr/hyprland.conf".source =
  #  config.lib.file.mkOutOfStoreSymlink ./hypr/hyprland.conf;

  # Programs and services here

  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 52.2;
    longitude = 18.2;
  };

  programs.git = {
    enable = true;
    userName  = "shibahaczix";
    userEmail = "shibahaczix@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

