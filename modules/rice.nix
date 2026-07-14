{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lavat
    pfetch
    cava
  ];
}
