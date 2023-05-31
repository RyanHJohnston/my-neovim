require('mapx').setup { global = true }

-- cute greeting message
print('Welcome to Neovim on Arch Linux!')

-- Default vim configs
vim.cmd([[set number]])
vim.opt.list = true
vim.o.encoding = "utf8"
vim.o.number = true
-- vim.o.textwidth = 100
vim.o.colorcolumn = "90"
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4 -- changes the indent size
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.expandtab = true
vim.o.scrolloff = 10
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showcmd = true
vim.o.showmode = true
vim.o.showmatch = true
vim.o.hlsearch = true
vim.o.history = 1000
vim.o.termguicolors = true
vim.signcolumn = "yes"
vim.o.updatetime = 50
vim.g.mapleader = " "
vim.o.nu = true
vim.cmd([[hi CursorLine gui=underline cterm=underline]])
-- vim.o.guicursor= "v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true, -- True adds line errors, false removes them
})
vim.cmd([[syntax on]])

vim.cmd([[
if has('termguicolors')
    set termguicolors
    endif
    ]])

    -- gruvbox-material config --
    vim.o.background = "dark"
    vim.cmd([[:let g:gruvbox_material_background = 'hard']])
    vim.cmd([[:let g:gruvbox_material_better_performance = 1]])
    vim.cmd([[:let g:gruvbox_material_enable_bold = 0 ]])
    vim.cmd([[:let g:gruvbox_material_enable_italic = 1]])

    vim.cmd([[:let g:gruvbox_material_diagnostic_text_highlight = 1]])
    vim.cmd([[:let g:gruvbox_material_diagnostic_line_highlight = 1]])
    vim.cmd([[:colorscheme github_dark_dimmed]])
    -- vim.cmd([[:set guicursor=i:block]])

    -- vimtex plugin config
    vim.cmd([[:let g:vimtex_view_general_viewer = 'okular']])
    vim.cmd([[:let g:vimtex_compiler_method = 'pdflatex']])

    --------------------------------PLUGINS----------------------------------------
    require('packer').startup(function(use)
        use { 'wbthomason/packer.nvim' }

        use "EdenEast/nightfox.nvim"

        -- Adds a customized statusline, mainly for aesthetics
        use { "nvim-lualine/lualine.nvim" }

        -- Adds icons to EVERYTHING
        use { "ryanoasis/vim-devicons" }


        -- Vim sugar for the UNIX shell commands that need it most.
        -- You can CRUD in your current filesystem.
        -- Ex. :Remove /home/dovahkiin/package.json
        -- Ex. :Move /home/dovahkiin/package.json /home/dovahkiin/
        use { "tpope/vim-eunuch" }

        -- Documentation tool
        -- To generate comment:
        --    Make sure your cursor is in the method.
        --    :DogeGenerate {doctool}
        --    Ex. :DogeGenerate javadoc
        --    Ti: Typing 'CC' automatically generates comment.
        use {
            'kkoomen/vim-doge',
            run = ':call doge#install()'
        }

        -- View pdfs in neovim terminal
        use { 'dsanson/termpdf.py' }

        -- Fancy looking errors plugin
        -- Actively shows where the errors are
        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = function()
                require("lsp_lines").setup()
            end,
        })

        -- nvim-navic (Statusline/winbar component that uses LSP to show current code)
        use {
            "SmiteshP/nvim-navic",
            requires = "neovim/nvim-lspconfig",
        }

        local navic = require("nvim-navic")

        require("lspconfig").clangd.setup {
            auto_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        }


        -- nvim-navbuddy (popup display that provides breadcrumbs like nav feature)
        use {
            "SmiteshP/nvim-navbuddy",
            requires = {
                "MunifTanjim/nui.nvim",
                "numToStr/Comment.nvim",        -- Optional
            }
        }

        local navbuddy = require("nvim-navbuddy")

        require("lspconfig").clangd.setup {
            on_attach = function(client, bufnr)
                navbuddy.attach(client, bufnr)
            end
        }


        -- nvim-scrollview (displays interactive vertical scrollbars and signs)
        use { 'dstein64/nvim-scrollview' }

        -- easyread.nvim (bionic-like reading in neovim)
        use { 'JellyApple102/easyread.nvim' }

        -- easyread.nvim default config
        require('easyread').setup{
            hlValues = {
                ['1'] = 1,
                ['2'] = 1,
                ['3'] = 2,
                ['4'] = 2,
                ['fallback'] = 0.4
            },
            hlgroupOptions = { link = 'Bold' },
            fileTypes = { 'text' },
            saccadeInterval = 0,
            saccadeReset = false,
            updateWhileInsert = true
        }

        -- github-nvim-theme (self-explanatory, it's a pretty github theme for neovim)
        -- Install without configuration
        use ({ 'projekt0n/github-nvim-theme' })

        -- Or with configuration
        use({
            'projekt0n/github-nvim-theme',
            config = function()
                require('github-theme').setup({
                    -- ...
                })

                vim.cmd('colorscheme github_dark')
            end
        })

        -- which-key (displays popup with possible key bindings of the command you started typing)
        use {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {}
            end
        }

        -- LSP Config --
        local lsp = require('lsp-zero').preset({})
        lsp.on_attach(function(client,bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        lsp.setup()

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({

            manage_nvim_cmp = {
                set_sources = 'lsp',
                set_basic_mappings = true,
                set_extra_mappings = true,
                use_luasnip = true,
                set_format = true,
                documentation_window = true,
            },

            sources = {
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
            },

            mapping = {
                ['<CR>'] = cmp.mapping.confirm({select = false}),
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            formatting = {
                -- changing the order of fields so the icon is the first
                fields = {'menu', 'abbr', 'kind'},

                -- here is where the change happens
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = 'λ',
                        luasnip = '⋗',
                        buffer = 'Ω',
                        path = '🖫',
                        nvim_lua = 'Π',
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
        })

        -- End of LSP Config --


        -- Improved tabs (Bybye, Buffer Byte for vim)
        use { 'moll/vim-bbye' }

        -- Indent Blankline
        -- Adds indentation guides to all lines
        use { 'lukas-reineke/indent-blankline.nvim' }

        -- Allows to run MySQL queries from the editor
        -- asynchronously. You can run a query, continue
        -- working, and have the results shown to you as soon
        -- as the query is finished. nvim-mysql is like a
        -- simpler, editor-based version of MySQL Workbench.
        use { 'jobo3208/nvim-mysql' }

        use 'nanotee/sqls.nvim'

        -- Foldtext, folds functions and sets of code.
        use { 'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup()
        end
    }

    -- Shows errors in a much easier way
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                {
                    position = "bottom", -- position of the list can be: bottom, top, left, right
                    height = 10, -- height of the trouble list when position is top or bottom
                    width = 50, -- width of the list when position is left or right
                    icons = true, -- use devicons for filenames
                    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                    fold_open = "", -- icon used for open folds
                    fold_closed = "", -- icon used for closed folds
                    group = true, -- group results by file
                    padding = true, -- add an extra new line on top of the list
                    action_keys = { -- key mappings for actions in the trouble list
                    -- map to {} to remove a mapping, for example:
                    -- close = {},
                    close = "q", -- close the list
                    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r", -- manually refresh
                    jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                    open_split = { "<c-x>" }, -- open buffer in new split
                    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                    open_tab = { "<c-t>" }, -- open buffer in new tab
                    jump_close = { "o" }, -- jump to the diagnostic and close the list
                    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                    toggle_preview = "P", -- toggle auto_preview
                    hover = "K", -- opens a small popup with the full multiline message
                    preview = "p", -- preview the diagnostic location
                    close_folds = { "zM", "zm" }, -- close all folds
                    open_folds = { "zR", "zr" }, -- open all folds
                    toggle_fold = { "zA", "za" }, -- toggle fold of current file
                    previous = "k", -- previous item
                    next = "j" -- next item
                },
                indent_lines = true, -- add an indent guide below the fold icons
                auto_open = false, -- automatically open the list when you have diagnostics
                auto_close = false, -- automatically close the list when you have no diagnostics
                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                auto_fold = false, -- automatically fold a file trouble list at creation
                auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
                signs = {
                    -- icons / text used for a diagnostic
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "﫠"
                },
                use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
            }
        }
    end
}

-- LaTeX plugin --
use { 'lervag/vimtex' }

-- COLORSCHEMES
use { 'Mofiqul/vscode.nvim' }
use { "ellisonleao/gruvbox.nvim" }
use { 'sainnhe/gruvbox-material' }
use { 'sainnhe/everforest' }
use { 'rose-pine/neovim' }
use { 'rafi/awesome-vim-colorschemes' }
use { 'kvrohit/mellow.nvim' }
use { 'elvessousa/sobrio' }
use { 'wesgibbs/vim-irblack' }
use { 'jdsimcoe/hyper.vim' }
use { 'thedenisnikulin/vim-cyberpunk' }
use { 'vv9k/vim-github-dark' }
use { 'rebelot/kanagawa.nvim' }
use { 'folke/tokyonight.nvim' }

-- Telescope (File Finder) --
use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
}

-- ToggleTerm (Integrated Terminal)
use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({

    })
end }

-- Nvim-Tree (File Manager) --
use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

-- NeoTree (Better File Manager) --
use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not required, but recommended
        'MunifTanjim/nui.nvim',
    }
}


require 'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    },
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
}

-- Baerbar.nvim (Tabs) --
-- This is dependent on 'nvim-tree/nvim-web-devicons'
use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }

-- Mapx.nvim (Easier key mappings) --
-- This makes the key mappings for commands much easier
-- It's supposed to mimic the .vim config
use "b0o/mapx.nvim"


-- Treesitter --
use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
use('nvim-treesitter/playground')

-- LSP Zero (Language Server Protocol) --
-- Very important for autocompletion
use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
    }
}



-- Improved jdtls lsp Java nvim experience
use 'mfussenegger/nvim-jdtls'

require 'nvim-treesitter.configs'.setup {
    -- This is where you will get your much needed Autocompletion
    -- So far, this is the only config that has working Java autocompletion
    -- A list of parser names, or "all"
    ensure_installed = { "javascript", "typescript", "java", "c", "lua",
    "rust", "python", "bash" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- Lsp Zero config --
-- LIST OF LANGUAGE SERVERS (LSPList)
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.set_preferences({ sign_icons = {} })

require('nvim-tree').setup {}
require('gruvbox').setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})

-- Indent Blankline Config --
require('indent_blankline').setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

-- Lualine Config --
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'quickfix', 'toggleterm', 'man' }
})

-- Lualine config
require('lualine').setup {
    options = {
        theme = 'codedark',
    }
}

-----------------------REMAPS---------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- ToggleTerm and NvimTreeToggle mappings
--  require'mapx'.setup{ global = true }

nnoremap("f", ":Neotree <Enter>") -- changed to Neotree command
nnoremap("ff", ":NeoTreeClose <Enter>")
nnoremap("T", ":ToggleTerm direction=horizontal size=25 <Enter>")
nnoremap("TV", ":ToggleTerm direction=vertical size=100 <Enter>")
nnoremap("TF", ":ToggleTerm direction=float <Enter>")

-- Tabs mappings
nnoremap("n", ":BufferPrevious <Enter>")
nnoremap("m", ":BufferNext <Enter>")
for index = 1, 9 do
    nnoremap(tostring(index),
    ":BufferGoto " .. tostring(index) .. " <Enter>")
end

-- Auto-generate comments
nnoremap("CC", ":DogeGenerate <Tab> <Enter>")

-- Telescope commands to make navigation easier
nnoremap("rr", ":Telescope find_files <Enter>")

-- Shows errors
nnoremap("er", ":TroubleToggle <Enter>")

-- Vimtex commands
nnoremap("tk", ":VimtexCompile <Enter>")
nnoremap("te", ":VimtexErrors <Enter>")
end)

-- PHP Intelephense LSP config
require('lspconfig').intelephense.setup{
    "intelephense", "--stdio", "php"
}

-- Underlines the current Cursorline position
vim.cmd([[hi CursorLine gui=underline cterm=underline]])

