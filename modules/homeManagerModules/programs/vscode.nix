{ pkgs, ... }:
{
  #nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      enkia.tokyo-night
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
