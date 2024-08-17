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
        key = "<C-/>";
        action = ":FloatermToggle<CR>";
        mode = ["n" "t"];
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        key = "<Esc>";
        action = "<C-\\><C-n>:FloatermHide<CR>";
        mode = "t";
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        key = "<Space><Space>";
        action = ":Telescope find_files<CR>";
        mode = "n";
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}

