{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox/firefox.nix
    ./modules/gaming.nix
    ./modules/media.nix
    ./modules/rice.nix
    ./modules/nixvim/nixvim.nix
    ./modules/developer.nix
    ./modules/productivity.nix
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
  
  };

  home.username = "tjetj";
  home.homeDirectory = "/home/tjetj";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      copy = "xclip -selection clipboard";
    };
    initExtra = ''
      export PS1='\[\e[30;104m\][\w]\[\e[0m\] \[\e[30;42m\][\\$]\[\e[0m\] '
      clear
      pfetch
    '';
  };

    #  home.file.".config/xinitrc".source = ./;
  home.file.".local/share/PrismLauncher/themes".source =
  ./config/PrismLauncher;
  home.file.".Xdefaults".source = ./config/Xdefaults;
  home.file.".config/newsraft/config".source = ./config/newsraft/config;
  home.file.".config/picom.conf".source = ./config/picom.conf;
  home.file.".dwm" = {
    source = ./config/scripts;
    recursive = true;
    executable = true;
  };
}
