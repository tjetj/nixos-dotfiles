{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox.nix
    ./modules/gaming.nix
    ./modules/hypr.nix
    ./modules/media.nix
    ./modules/rice.nix
    ./modules/nixvim.nix
    ./modules/developer.nix
  ];

  programs.git = {
    enable = true;
  
    settings = {
      user = {
        name = "tjetj";
        email = "168307178+tjetj@users.noreply.github.com";
      };
  
      init = {
        defaultBranch = "main";
      };
    };
  };

  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  
    gtk.enable = true;
    x11.enable = true;
  };

  home.username = "tjetj";
  home.homeDirectory = "/home/tjetj";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    initExtra = ''
      export PS1='\[\e[30;104m\][\w]\[\e[0m\] \[\e[30;42m\][\\$]\[\e[0m\] '
      pfetch
    '';
    shellAliases = {
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/kitty".source = ./config/kitty;
  home.file.".local/share/PrismLauncher/themes".source =
  ./config/PrismLauncher;
}
