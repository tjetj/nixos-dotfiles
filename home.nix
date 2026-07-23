{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox/firefox.nix
    ./modules/gaming.nix
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
  
  };

  home.username = "tjetj";
  home.homeDirectory = "/home/tjetj";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    initExtra = ''
      export PS1='\[\e[30;104m\][\w]\[\e[0m\] \[\e[30;42m\][\\$]\[\e[0m\] '
      clear
      pfetch
    '';
    shellAliases = {
    };
        #profileExtra = ''
        #  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        #    exec startx
        #  fi
        #'';
  };
    #  home.file.".config/xinitrc".source = ./;
  home.file.".local/share/PrismLauncher/themes".source =
  ./config/PrismLauncher;
  home.file.".Xdefaults".source = ./config/Xdefaults;
  home.file.".config/newsraft/config".source = ./config/newsraft/config;
  home.file.".config/picom.conf".source = ./config/picom.conf;
}
