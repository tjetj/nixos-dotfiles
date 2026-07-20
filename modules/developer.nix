{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tealdeer
    python3
  ];
}
