return {
  "vim-tmux-navigator",
  dir = "~/.dotfiles/.config/nvim/lua/custom-plugins/vim-tmux-navigator/",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    -- "TmuxNavigatePrevious",
  },
  keys = {
    { "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
    -- { "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
