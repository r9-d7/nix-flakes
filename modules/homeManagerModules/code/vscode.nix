{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      enkia.tokyo-night
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
