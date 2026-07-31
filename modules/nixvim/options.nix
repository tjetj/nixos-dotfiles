{ pkgs, ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    enable = true;
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      orgmode = {
        enable = true;

        settings = {
          org_agenda_files = [
            "~/org/**/*"
          ];

          org_default_notes_file = "~/org/refile.org";

          org_todo_keywords = [
            "TODO"
            "NEXT"
            "|"
            "DONE"
            "CANCELLED"
          ];
        };
      };


      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          basedpyright.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
      };

      telescope.enable = true;

      gitsigns.enable = true;

      lualine.enable = true;

      comment.enable = true;

      nvim-autopairs.enable = true;
    };

    extraPackages = with pkgs; [
      clang-tools
      gcc
      gdb
      cmake
      ninja
      bear
      ripgrep
      fd

      python3
      pyright
      ruff
      black
    ];

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
    };
  };
}
