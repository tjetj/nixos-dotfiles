{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  services.getty.autologinUser = "tjetj";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.displayManager.ly.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  users.users.tjetj = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    nerd-fonts.jetbrains-mono
    krita
    git
    home-manager
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}

