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
      nixbuild = "sudo nixos-rebuild switch --flake /home/rossf/nix-flake/nixOSconfig/.";
      neofetch = "fastfetch";
      nf = "fastfetch";
      flakeupdate-all = "nix flake lock --update-all";
      flakeupdate-input = "nix flake lock --update-input"; #follow by space then input name
      nixupdate = "sudo nix-channel --update";
      nixupgrade = "sudo nixos-rebuild switch --upgrade";
      generations = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
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


