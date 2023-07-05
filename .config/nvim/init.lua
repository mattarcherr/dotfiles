-- **************** Options ***************

-- disabling netrw ( vim's builtin file explorer)
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.o.number = true         -- side bar numbering
vim.o.relativenumber = true -- relative line numbers

-- default tab settings
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 0
vim.bo.softtabstop = 2

-- file specific tab settings
vim.cmd[[autocmd FileType .hs setlocal shiftwidth=2]]

-- colourscheme
require 'nordic' .setup { theme = 'nordic', }
vim.cmd.colorscheme 'nordic'

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- explorer setup
require("nvim-tree").setup()


-- tabline setup
require("barbar").setup{}

-- statusline setup

local function folder_and_file()
    local current_buffer = vim.api.nvim_get_current_buf()
    local current_file = vim.api.nvim_buf_get_name(current_buffer)
    local file = vim.fn.fnamemodify(current_file, ':t')
    local parent = vim.fn.fnamemodify(current_file, ':h:t')
    if parent == '.' then return '' end
    return parent .. '/' .. file
end

local c = require 'nordic.colors'

require("lualine").setup {
  sections = {
    lualine_a = {
      {
        'mode',
        icon = { '' },
        separator = { right = ' ', left = '' },
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        folder_and_file,
        color = { fg = c.gray3 },
        icon = { ' ', color = { fg = c.gray4 } },
        separator = '',
        padding = 0, 
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'location',
        icon = { '', align = 'left', color = { fg = c.black } },
      },
      {
        'progress',
        icon = { '', align = 'left', color = { fg = c.black } },
        separator = { right = '', left = '' },
      },
    },
  }, -- end of sections
  options = {
    globalstatus = true,
    -- icons_enabled = true,
    theme = 'nordic',
    section_separators = { left = ' ', right = ' ' },
    component_separators = { left = '', right = '' },
  },
}

-- dashboard setup
require('dashboard').setup {
    theme = 'doom',
    config = {
      center = {
      {
        icon = '',
        icon_hl = 'group',
        desc = 'description',
        desc_hl = 'group',
        key = 'shortcut key in dashboard buffer not keymap !!',
        key_hl = 'group',
        action = '',
      },
    },
  footer = {},
  }
}

-- **************** Bindings ***************
local keymap = vim.api.nvim_set_keymap
local nrm    = { noremap = true }

--     MODE, BIND,      COMMAND,                       OPTIONS

keymap("n", "ZS",       ":w<cr>",                      	nrm)        -- ZS writes file
keymap("n", "SV",       ":source ~/.config/nvim/init.lua<cr>", nrm) -- SV reloads config

-- nvim tree binds
keymap("n", "<S-Tab>",  ":NvimTreeFindFileToggle<cr>", 	nrm) -- Shift-tab toggle explorer

-- tab binds
keymap("n", "<C-n>",    ":tabnew<cr>",                 	nrm) -- Crtl-n opens new tab

-- telescope binds
keymap("n", "<S-F>",    ":cd /home/matt | :Telescope find_files<cr>", nrm) -- Shift-F to open telescope

-- window keybinds
keymap("n", "WN",       ":belowright new<cr>",          nrm) -- WN new window
keymap("n", "WQ",       ":quit<cr>",                   	nrm) -- WQ quit window
keymap("n", "WT",       ":belowright 17sp +terminal<cr>", nrm) -- WT terminal window
keymap("n", "WS",       ":belowright sp<cr>",           nrm) -- WS split window


-- **************** Plugins ***************
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

-- colour scheme
  use 'AlexvZyl/nordic.nvim'

-- dashboard (startup page)
  use 'glepnir/dashboard-nvim'

-- NVIM Project
  use 'ahmedkhalf/project.nvim'

-- tabline
  use { 'romgrk/barbar.nvim',
  requires = 'nvim-tree/nvim-web-devicons'}

-- statusline
  use { 'nvim-lualine/lualine.nvim', 
  requires = { 'kyazdan/nvim-web-devicons', opt = true }}

-- Sidebar file explorer
  use { 'nvim-tree/nvim-tree.lua', 
  requires = 'nvim-tree/nvim-web-devicons' }

-- nvim telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', 
  requires = {'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter', 'sharkdp/fd' } }

-- haskell
use {'neovimhaskell/haskell-vim'}

end)
