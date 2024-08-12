{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    extraPlugins = [ pkgs.vimPlugins.fleet-theme-nvim ];
    colorscheme = "fleet";
    plugins.telescope.enable = true;
    plugins.cmp.enable = true;
    plugins.lsp = {
      enable = true;

      servers = {
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installCargo = true;
        };
	zls = {
          enable = true;
	};
      };
    };
  };
}

