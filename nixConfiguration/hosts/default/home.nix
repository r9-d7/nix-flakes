{ config, pkgs, inputs, ... }:
{
  home.username = "rossf";
  home.homeDirectory = "/home/rossf";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    fastfetch
    cmatrix
    git
    starship
    cava
  ];

  xdg.configFile."hypr/*".source = ../../modules/dotfiles/hyprland/.config/hypr/*;
  xdg.configFile."hypr/*".source = ../../modules/dotfiles/hypridle/.config/hypr/*;
  xdg.configFile."hypr/*".source = ../../modules/dotfiles/hyprlock/.config/hypr/*;
  xdg.configFile."hypr/*".source = ../../modules/dotfiles/hyprpaper/.config/hypr/*;
  xdg.configFile."kitty/*".source = ../../modules/dotfiles/kitty/.config/kitty/*;
  xdg.dataFile.".userscripts/*".source = ../../modules/dotfiles/scripts/.userscripts/*;
  xdg.configFile."starship.toml".source = ../../modules/dotfiles/starship/.config/starship.toml;
  xdg.configFile."waybar/*".source = ../../modules/dotfiles/waybar/.config/waybar/*;
  xdg.configFile."wofi/*".source = ../../modules/dotfiles/wofi/.config/wofi/*;

  imports = [
    ../../modules/home-manager/homeconf
    inputs.catppuccin.HomeManagerModules.catppuccin
  ];

  # Mako Configuration
  iconTheme = rec {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
    iconPath = "${package}/share/icons/${name}";
  }
  services.mako = {
    enable = true;
    anchor = "top-center";
    borderRadius = 8;
    defaultTimeout = 10000;
    font = "Cascadia Code 12";
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
    catppuccin.accent = "mauve";
    iconPath = "${iconTheme.iconPath}";
    maxVisible = 3;
    borderSize = 2;
    actions = true;
    width = 300;
    layer = "overlay";
  };


  # Neovim Configuration
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
        config = toLuaFile ../../modules/home-manager/nvim/plugin/lsp.lua;
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
        config = toLuaFile ../../modules/home-manager/nvim/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ../../modules/home-manager/nvim/plugin/telescope.lua;
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
        config = toLuaFile ../../modules/home-manager/nvim/plugin/treesitter.lua;
      }

      vim-nix
      transparent-nvim

      #{
      #   plugin = nixpkgs.vimPlugins.own-onedark-nvim;
      #   config = "colorscheme onedark";
      #}
    ];

    extraLuaConfig = ''
      ${builtins.readFile ../../modules/home-manager/nvim/options.lua}
      ${builtins.readFile ../../modules/home-manager/nvim/plugin/other.lua}
    '';

  };
}





