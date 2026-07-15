{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Telescope dependencies
    ripgrep
    fd
    fzf

    # Language servers
    lua-language-server
    nil
    nixpkgs-fmt
  ];

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      telescope-nvim
      nvim-treesitter
      nvim-lspconfig
    ];

    extraLuaConfig = ''

      -- Theme
      vim.o.termguicolors = true
      vim.cmd.colorscheme("gruvbox")

      -- Keybindings
      local builtin = require("telescope.builtin")
      vim.g.mapleader = " "
      vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
      vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    '';
  };
}
