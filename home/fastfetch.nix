{ pkgs, config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "/home/shiba/flake/home/fastfetch/image.png";
	width = "36";
	height = "16";
	modules = [
	  {
	    type = "title";
	  }
	  {
	    type = "separator";
	  }
	  {
	    type = "os";
	  }
	  {
	    type = "kernel";
	  }
	  {
	    type = "uptime";
	  }
	  {
	    type = "packages";
	  }
	  {
	    type = "colors";
	  }
	];
      };
    };
  };
}
