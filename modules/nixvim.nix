{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
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
