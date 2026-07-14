# Things I need for hyprland to be useful

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    kitty
    hyprpaper
    hyprlauncher
    hyprpicker
  ];
}
