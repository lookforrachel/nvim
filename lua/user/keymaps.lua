-- Silent keymap option, description option
local keymap = function (mode, key, func, desc)
  vim.keymap.set( mode, key, func, { silent = true, desc = desc})
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", "no [H]ighlights")

-- Open buffers
keymap("n", "<S-b>", "<cmd>enew<CR>")

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>")

-- Better paste
keymap("v", "p", '"_dP')

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", '[E]xplore')

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", '[F]ind [F]ile')
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", '[F]ind [T]ext')
keymap("n", "<leader>fp", ":Telescope projects<CR>", '[F]ind [P]rojects')
keymap("n", "<leader>fh", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[F]ind [H]ere' )
keymap("n", "<leader>pv", ":Telescope find_files cwd=~/Developer/<cr>", 'Find Files in De[v]eloper')
keymap("n", "<leader>pc", ":Telescope find_files cwd=~/.config/<cr>", 'Find Files in [C]onfig')
keymap("n", "<leader>pm", ":Telescope find_files cwd=~/Documents/<cr>", 'Find Files in Docu[m]ents')
keymap("n", "<leader>pw", ":Telescope find_files cwd=~/Downloads/<cr>", 'Find Files in Do[w]nloads')

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", '[G][G]it')

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", '[D]ap [B]reakpoint')
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", '[D]ap [C]ontinue')
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", '[D]ap Step [I]nto')
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", '[D]ap Step [o]ver')
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", '[D]ap Step [O]ut')
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", '[D]ap [R]epl Toggle')
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", '[D]ap Run [L]ast')
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", '[D]ap [U]i Toggle')
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", '[D]ap [T]erminate')

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")

-- Alpha
keymap("n", "<leader>;", ":Alpha<cr>")

-- Games
keymap("n", "<leader>gv", ":VimBeGood<cr>", '[G]ame: VimBeGood')

-- Save & Source file
keymap("n", "<leader><leader>x", ":w<cr>:so<cr>", 'Save & Source')
