{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    shellAliases = {
      l = "eza --icons=always";
      ls = "eza -a --icons=always";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=3 --icons=always";
      vim = "nvim";
      vi = "nvim";
      rebuild = "cd ~/nix-flakes/nixOSconfig && sudo nixos-rebuild switch --flake .";
      neofetch = "fastfetch";
      nf = "fastfetch";
      nixupdate = "sudo nix-channel --update";
      nixupgrade = "sudo nixos-rebuild switch --upgrade";
      hbld = "home-manager switch";
      hedit = "home-manager edit";
      nixconf = "sudoedit /etc/nixos/configuration.nix";
      nixpkg = "sudoedit /etc/nixox/packages.nix";
    };
    envExtra = ''nitch'';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "starship" "sudo" ];
      theme = "agnoster";
    };
    plugins = [
      {
        name = "zsh-autocomplete";
	src = pkgs.fetchFromGitHub {
	  owner = "marlonrichert";
	  repo = "zsh-autocomplete";
	  rev = "24.09.04";
	  sha256 = "sha256-o8IQszQ4/PLX1FlUvJpowR2Tev59N8lI20VymZ+Hp4w=";
	};
      }
    ];
  };
}

