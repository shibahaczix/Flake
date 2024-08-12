{ pkgs, config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "/home/shiba/flake/home/fastfetch/image.png";
	width = 36;
	height = 16;
      };
	modules = [
	"title"
	"separator"
	"os"
	"kernel"
	"uptime"
	"packages"
        "colors"
      ];
    };
  };
}
