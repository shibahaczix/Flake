{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    extraPlugins = [ pkgs.vimPlugins.fleet-theme-nvim ];
    colorscheme = "fleet";
    opts.number = true;
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy = {
          enable = true;
          package = pkgs.wl-clipboard;
        };
      };
    };
    plugins = {
      auto-save.enable = true;
      telescope.enable = true;
      cmp = {
        enable = true;
	autoEnableSources = true;
      };
      #lightline.enable = true;
      floaterm.enable = true;
      indent-blankline.enable = true;
      undotree.enable = true;
      lspkind = {
        enable = true;
        mode = "symbol_text";
      };
      fidget = {
        enable = true;
         notification = {
          window = {
            winblend = 0;
            relative = "editor";
          };
        };
      };
      lsp = {
        enable = true;

        servers = {
          ltex.settings.completionEnabled = true;
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

