{ pkgs, ... }:

{
  programs.fuzzel.enable = true;
  #programs.fuzzel.settings = {
  #  main = {
  #    terminal = "${pkgs.kitty}/bin/kitty";
  #    layer = "overlay";
  #  };
  #  colors.background = "ffffffff";
  #};
}
