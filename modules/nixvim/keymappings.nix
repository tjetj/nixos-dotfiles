{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
      }

      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }

      {
        mode = "n";
        key = "<leader>cd";
        action = "<cmd>Ex<CR>";
      }
    ];
  };
}
