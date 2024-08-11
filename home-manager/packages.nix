{ pkgs, ... }:

{
  home.packages = [
    pkgs.mission-center
    pkgs.fastfetch
    pkgs.pamixer
    pkgs.floorp
    pkgs.wl-clipboard
    pkgs.cliphist
    pkgs.grimblast
    pkgs.nautilus
    pkgs.vesktop
    pkgs.obs-studio
    pkgs.hyprpicker
    pkgs.gimp
    pkgs.remmina
  ];
}
