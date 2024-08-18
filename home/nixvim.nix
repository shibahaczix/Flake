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

      oil = {
        enable = true;
      };
      cmp-emoji = {
        enable = true;
      };

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = { expand = "luasnip"; };
          formatting = { fields = [ "kind" "abbr" "menu" ]; };
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];

          window = {
            completion = { border = "solid"; };
            documentation = { border = "solid"; };
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
      cmp-nvim-lsp = {
        enable = true; # LSP
      };
      cmp-buffer = {
        enable = true;
      };
      cmp-path = {
        enable = true; # file system paths
      };
      cmp_luasnip = {
        enable = true; # snippets
      };
      cmp-cmdline = {
        enable = true; # autocomplete for cmdline
      }; 
      #lightline.enable = true;
      toggleterm = {
        enable = true;
        settings = {
          hide_numbers = false;
          autochdir = true;
          close_on_exit = true;
          direction = "vertical";
        };
      };

      todo-comments = {
        enable = true;
        colors = {
          error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
          warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
          info = ["DiagnosticInfo" "#2563EB"];
          hint = ["DiagnosticHint" "#10B981"];
          default = ["Identifier" "#7C3AED"];
          test = ["Identifier" "#FF00FF"];
        };
      };

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
            installRustc = true;
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

