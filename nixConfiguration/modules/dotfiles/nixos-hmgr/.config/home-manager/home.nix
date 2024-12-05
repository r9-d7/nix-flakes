{ config, pkgs, inputs, ... }: 
{
    home = {
      username = "rossf";
      homeDirectory = "/home/rossf";
      stateVersion = "24.11";
      packages = with pkgs; [
        fastfetch
	    cmatrix
	    git
	    starship
	    cava
      ];
    };

    imports = [
      ./homeconf
    ];

    nixpkgs = {
      overlays = [
        (final: prev: {
          vimPlugins = prev.vimPlugins // {
            own-onedark-nvim = prev.vimUtils.buildVimPlugin {
              name = "onedark";
              src = inputs.plugin-onedark;
            };
          };
        })
      ];
    };


    programs.neovim = 
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        
        xclip
        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./nvim/plugin/lsp.lua;
        }

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        {
          plugin = tokyonight-nvim;
          config = "colorscheme tokyonight";
        }

        neodev-nvim

        nvim-cmp 
        {
          plugin = nvim-cmp;
          config = toLuaFile ./nvim/plugin/cmp.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ./nvim/plugin/telescope.lua;
        }

        telescope-fzf-native-nvim

        cmp_luasnip
        cmp-nvim-lsp

        luasnip
        friendly-snippets


        lualine-nvim
        nvim-web-devicons

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
          ]));
          config = toLuaFile ./nvim/plugin/treesitter.lua;
        }

        vim-nix
        transparent-nvim

        #{
        #   plugin = nixpkgs.vimPlugins.own-onedark-nvim;
        #   config = "colorscheme onedark";
        #}
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./nvim/options.lua}
        ${builtins.readFile ./nvim/plugin/other.lua}
      '';

      # extraLuaConfig = ''
      #   ${builtins.readFile ./nvim/options.lua}
      #   ${builtins.readFile ./nvim/plugin/lsp.lua}
      #   ${builtins.readFile ./nvim/plugin/cmp.lua}
      #   ${builtins.readFile ./nvim/plugin/telescope.lua}
      #   ${builtins.readFile ./nvim/plugin/treesitter.lua}
      #   ${builtins.readFile ./nvim/plugin/other.lua}
      # '';
    };
    programs.home-manager.enable = true; 
}
