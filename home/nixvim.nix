{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    extraPlugins = [ pkgs.vimPlugins.fleet-theme-nvim ];
    colorscheme = "fleet";
    plugins.telescope.enable = true;
    plugins.cmp.enable = true;
    #plugins.lightline.enable = true;
    plugins.floaterm.enable = true;
    plugins.indent-blankline.enable = true;
    plugins.undotree.enable = true;
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
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<C-f>";
        options = {
          silent = true;
        };
      }
      {
        action = "<cmd>:FloatermToggle<CR>";
        key = "<C-g>";
        options = {
          silent = true;
        };
      }
    ];
  };
}

