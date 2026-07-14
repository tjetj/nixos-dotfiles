{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
    vlc
    kdePackages.kdenlive
    ffmpeg
    yt-dlp
  ];

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      pixel-art
      obs-noise
      obs-retro-effects
    ];
  };
}
