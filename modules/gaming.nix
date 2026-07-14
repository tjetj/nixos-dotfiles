{ pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    kdePackages.kdiamond # Candy crush
  ];
}
