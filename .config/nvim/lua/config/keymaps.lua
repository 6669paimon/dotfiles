local function map(mode, lhs, rhs, opt, des)
  opt = vim.tbl_deep_extend("force", opt or {}, des or {})
  vim.keymap.set(mode, lhs, rhs, opt)
end

local opts = { noremap = true, silent = true }

-- Set Leader Key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Esc>", "<CMD>noh<CR>", opts, { desc = "Clear search highlights" })
map("n", "<leader>x", "<CMD>confirm qa<CR>", opts, { desc = "Cloas all file" })
map("n", "<leader>q", "<CMD>confirm q<CR>", opts, { desc = "Close file" })
map("n", "<leader>w", "<CMD>w<CR>", opts, { desc = "Save file" })
map("x", "p", '"_dP', { desc = "Visual paste, don't yank" })
map("n", "db", 'vbd', { desc = "Delete a word backward" })


-- Move,Add,Delete line Up/Down current cursor
map("v", "J", ":m '>+1<CR>gv=gv", opts, { desc = "Visual move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", opts, { desc = "Visual move line up" })
map("n", "<C-j>", "m`o<Esc>``", { desc = "Add line below" })
map("n", "<C-k>", "m`O<Esc>``", { desc = "Add line above" })
-- map("n", "J", "mzJ`z", { desc = "Delete line below" })
map("n", "J", "mzjdd`z", { desc = "Delete line below" })
map("n", "K", "kdd", { desc = "Delete line above" })

-- Center View
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "gg", "ggzz")
map("n", "G", "Gzz")
map("n", "{", "{zz")
map("n", "}", "}zz")

-- Move cursor to begining or end of line
map("i", "<C-a>", "<Esc>I", { desc = "move begining of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("", "H", "^", { desc = "move begining of line" })
map("", "L", "g_", { desc = "move end of line" })

-- Move window
map("n", "<M-h>", "<C-w>h", opts)
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-l>", "<C-w>l", opts)
map("t", "<M-h>", "<CMD>wincmd h<CR>")
map("t", "<M-k>", "<CMD>wincmd k<CR>")
map("t", "<M-j>", "<CMD>wincmd j<CR>")
map("t", "<M-l>", "<CMD>wincmd l<CR>")

-- Resize window
map("n", "<C-up>", "<C-w>+", opts)
map("n", "<C-down>", "<C-w>-", opts)
map("n", "<C-left>", "<C-w><", opts)
map("n", "<C-right>", "<C-w>>", opts)

-- Disable arrow
map("", "<Up>", "<nop>", opts)
map("", "<Down>", "<nop>", opts)
map("", "<Left>", "<nop>", opts)
map("", "<Right>", "<nop>", opts)


-- Split window
map("n", "<leader>\\", "<CMD>split<CR>")
map("n", "<leader>|", "<CMD>vsplit<CR>")

-- Insert mode backward delete
map("i", "<C-d>", "<Del>")
map("i", "<A-d>", "<Space><Esc>ce")

-- Find/replace for the word under the cursor
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>ss", '*N', opts, { desc = "Search current word" })

-- New tab
map("n", "<leader>te", "<CMD>tabedit<CR>")

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", opts)

--  Buffer
map("n", "[b", "<CMD>bp<CR>", opts, { desc = "move previous buffer" })
map("n", "]b", "<CMD>bn<CR>", opts, { desc = "move next buffer" })
map("n", "<leader><leader>", "<C-^>", { noremap = true }, { desc = "Switch to latest buffer" })
map("n", "<leader>dd", "<CMD>confirm bd<CR>", opts, { desc = "Close buffer" })
vim.api.nvim_set_keymap("n", "<leader>da", "", {
  noremap = true,
  silent = true,
  callback = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local all_buf = vim.api.nvim_list_bufs()
    local closed_count = 0

    local function is_regular_file(buf)
      -- Check buftype
      local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
      if buftype ~= '' then
        return false
      end

      -- Check filename
      local bufname = vim.api.nvim_buf_get_name(buf)
      if bufname == '' then
        return false
      end

      -- Check if it's a normal file path
      local stat = vim.loop.fs_stat(bufname)
      if not stat or not stat.type == 'file' then
        return false
      end

      return true
    end

    for _, buf in ipairs(all_buf) do
      if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) and is_regular_file(buf) then
        local modified = vim.api.nvim_buf_get_option(buf, 'modified')
        if modified then
          local buf_name = vim.api.nvim_buf_get_name(buf)
          local choice = vim.fn.confirm('Save changes to "' .. buf_name .. '"?', "&Yes\n&No\n&Cancel", 1)
          if choice == 1 then -- Yes
            vim.api.nvim_buf_call(buf, function() vim.cmd('write') end)
            vim.api.nvim_buf_delete(buf, {})
            closed_count = closed_count + 1
          elseif choice == 2 then -- No
            vim.api.nvim_buf_delete(buf, { force = true })
            closed_count = closed_count + 1
          elseif choice == 3 then -- Cancel
            return
          end
        else
          vim.api.nvim_buf_delete(buf, {})
          closed_count = closed_count + 1
        end
      end
    end

    -- Show notification
    vim.defer_fn(function()
      local msg = string.format("Closed buffer(s): %d", closed_count)
      vim.notify(msg, vim.log.levels.INFO, { title = "Buffer Cleanup", timeout = 3000 })
    end, 100)
  end,
  desc = "Close all regular file buffers except the current buffer"
})

-- Quick compile and run
-- python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cc', '',
      {
        noremap = true,
        silent = true,
        callback = function()
          local venv_python = vim.fn.getcwd() .. "/venv/bin/python"
          local python_cmd = vim.fn.filereadable(venv_python) == 1 and venv_python or "test"
          local file_path = vim.fn.expand("%:p")
          vim.cmd("12split | terminal " .. python_cmd .. " " .. file_path)
        end
      })
  end
})
-- c++
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_set_keymap('n', '<F9>', '<cmd>!g++ -std=c++17 % -o %:r<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F10>', '<cmd>12split<bar>terminal ./%:r<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cc',
      '<cmd>w<cr><cmd>!g++ -std=c++17 % -o %:r<cr><cmd>12split<bar>terminal ./%:r<cr>',
      { noremap = true, silent = true })
  end
})
