{ pkgs, config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "/home/shiba/flake/home/fastfetch/image.png";
	width = "36";
	height = "16";
      };
    };
  };
}
