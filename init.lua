local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('preservim/nerdtree', { ["on"] = 'NERDTreeToggle' })
Plug 'elixir-editors/vim-elixir'
Plug 'jgdavey/vim-railscasts'
Plug 'jparise/vim-graphql'

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ["tag"] = '0.1.8' })
--Plug('junegunn/fzf', { 'do': { -> fzf#install() } })
--Plug '/opt/homebrew/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'corntrace/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
vim.call('plug#end')

-- Backspace behaviour and line numbers
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.number = true
-- General tab settings
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2

-- Key mappings
vim.keymap.set("n", "<F1>", function() vim.cmd("NERDTreeToggle") end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", function() vim.cmd("NERDTreeToggle") end, { noremap = true })
vim.keymap.set("n", "<F2>", function() vim.cmd("BufExplorer") end, { noremap = true, silent = true })
vim.keymap.set("n", "<F3>", function() vim.cmd("Files") end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", function() vim.cmd("Files") end, { noremap = true })
vim.keymap.set("n", "<C-f>", function() vim.cmd("Telescope find_files") end, { noremap = true, silent = true }) 
--vim.keymap.set("n", "<leader>fg", function() vim.cmd("Telescope live_grep") end, { noremap = true, silent = true }) 
--vim.keymap.set("n", "<leader>fb", function() vim.cmd("Telescope buffers") end, { noremap = true, silent = true }) 
--vim.keymap.set("n", "<leader>fh", function() vim.cmd("Telescope help_tags") end, { noremap = true, silent = true }) 

-- Colour scheme
vim.cmd("colorscheme railscasts")

-- Key Mappings for Split Window Navigation
vim.keymap.set("n", ",h", "<C-w>h", { noremap = true })
vim.keymap.set("n", ",j", "<C-w>j", { noremap = true })
vim.keymap.set("n", ",k", "<C-w>k", { noremap = true })
vim.keymap.set("n", ",l", "<C-w>l", { noremap = true })

require'lspconfig'.pyright.setup{}
require("CopilotChat").setup {} -- See Configuration section for options
