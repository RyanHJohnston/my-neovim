
--  ____                          _       _               _              
-- |  _ \ _   _  __ _ _ __       | | ___ | |__  _ __  ___| |_ ___  _ __  
-- | |_) | | | |/ _` | '_ \   _  | |/ _ \| '_ \| '_ \/ __| __/ _ \| '_ \ 
-- |  _ <| |_| | (_| | | | | | |_| | (_) | | | | | | \__ \ || (_) | | | |
-- |_| \_\\__, |\__,_|_| |_|  \___/ \___/|_| |_|_| |_|___/\__\___/|_| |_|
--        |___/                                                          
--  _   ___     _____ __  __    ____             __ _       
-- | \ | \ \   / /_ _|  \/  |  / ___|___  _ __  / _(_) __ _ 
-- |  \| |\ \ / / | || |\/| | | |   / _ \| '_ \| |_| |/ _` |
-- | |\  | \ V /  | || |  | | | |__| (_) | | | |  _| | (_| |
-- |_| \_|  \_/  |___|_|  |_|  \____\___/|_| |_|_| |_|\__, |
--                                                    |___/ 

require('mapx').setup { global = true }
-- List of things to do to make the editor awesome:
-- • Add a debugger plugin that uses breakpoints and logging
-- • Organize all of your plugins into logic file structures (i.e. plugins,configs, etc)
-- • Find out how to get latex to work (dear god it's so difficult on arch)
-- • Make unique configs for your plugins
-- • Find a solution for your plugins not installing correctly for other linux installations

-- GOAL: Make a lightweight vim IDE

-- keeps the cursor as a block when in insert mode
-- vim.cmd([[:set guicursor=i:block]])

-- Default vim configs
vim.opt.list = true
vim.o.encoding = "utf8"
vim.o.number = true
vim.o.textwidth = 100
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
vim.o.background="dark" -- changes the background color of the editor
vim.cmd([[hi CursorLine gui=underline cterm=underline]])
-- vim.o.guicursor= "v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false, -- True adds line errors, false removes them
})

vim.cmd([[syntax on]])
vim.cmd([[colorscheme vscode]])


vim.cmd([[
if has('termguicolors')
    set termguicolors
    endif
    ]])

    -- gruvbox-material config --
    vim.cmd([[:let g:gruvbox_material_background = 'hard']])
    vim.cmd([[:let g:gruvbox_material_better_performance = 1]])
    vim.cmd([[:let g:gruvbox_material_enable_bold = 0 ]])
    vim.cmd([[:let g:gruvbox_material_enable_italic = 1]])

    vim.cmd([[:let g:gruvbox_material_diagnostic_text_highlight = 1]])
    vim.cmd([[:let g:gruvbox_material_diagnostic_line_highlight = 1]])
    -- vim.cmd([[:set guicursor=i:block]])

    -- vimtex plugin config
    -- vim.cmd([[:let g:vimtex_view_general_viewer = 'firefox']])
    -- vim.cmd([[:let g:vimtex_compiler_method = 'pdflatex']])



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

        -- Pretty notifications
        use { 'rcarriga/nvim-notify' }
        vim.notify = require("notify")
        vim.notify.setup {
            background_color = "NotifyBackground",
            fps = 30,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            level = 2,
            minimum_width = 50,
            title = "My Plugin",
            render = "minimal",
            stages = "fade_in_slide_out",
            timeout = 5000,
            top_down = false,
            animate = true
        }

        local function notify_output(command, opts)
            local output = ""
            local notification
            local notify = function(msg, level)
                local notify_opts = vim.tbl_extend(
                "keep",
                opts or {},
                { title = table.concat(command, " "), replace = notification }
                )
                notification = vim.notify(msg, level, notify_opts)
            end
            local on_data = function(_, data)
                output = output .. table.concat(data, "\n")
                notify(output, "info")
            end
            vim.fn.jobstart(command, {
                on_stdout = on_data,
                on_stderr = on_data,
                on_exit = function(_, code)
                    if #output == 0 then
                        notify("No output of command, exit code: " .. code, "warn")
                    end
                end,
            })
        end

        -- table from lsp severity to vim severity.
        local severity = {
            "error",
            "warn",
            "info",
            "info", -- map both hint and info to info?
        }
        --vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
            --    vim.notify(method.message, severity[params.type])
            --end

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

            -- which-key (displays popup with possible key bindings of the command you started typing)
            use {
                "folke/which-key.nvim",
                config = function()
                    vim.o.timeout = true
                    vim.o.timeoutlen = 300
                    require("which-key").setup {}
                end
            }

            -- Toggles comments in Neovim
            use { 'terrortylor/nvim-comment' }

            -- This commad prints out the default key commands of nvim-comment
            -- To execute the funtion, simply type gcch
            local function print_comment_keymap_help()
                print("gcc - comment/uncomment current line, does not take count")
                print("gc{motion} - comment/uncomment selection defined by a motion")
                print("gcip - comment/uncomment a paragraph")
                print("gc4w - comment/uncomment current line")
                print("gc4j - comment/uncomment 4 lines below the current line")
                print("dic - delete comment block")
                print("gcic - uncomment commented block")
                print("")
                print("Commenting out is as simple as: ")
                print("visual mode -> highlighting text -> type gcc -> done")
            end

            _G.print_comment_keymap_help = print_comment_keymap_help
            vim.api.nvim_set_keymap('n','gcch',':lua print_comment_keymap_help()<Enter>',
            { noremap = true, silent = true })
            require('nvim_comment').setup({
                comment_empty = false, -- ignore empty lines
                create_mappings = true, -- uses default mappings
            }) 

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
            -- Includes use{} and setup{}
            use { 'lukas-reineke/indent-blankline.nvim' }
            require "ibl".update { enabled = true }

            -- Foldtext, folds functions and sets of code.
            use { 'anuvyklack/pretty-fold.nvim',
            config = function()
                require('pretty-fold').setup()
            end
        }

        -- Shows errors in a much easier way
        use {
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons",
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

        -- LaTeX plugin (Vimtex)--
        -- For arch linux, here are the required packages for it to work out of the box
        -- texlive-latex
        -- texlive-latexrecommended 
        -- texlive-latexextra
        -- texlive-binextra # this has the high level compiler latexmk, the default compiler for vimtex
        use { 
            'lervag/vimtex',
            config = function ()
                require('vimtex').setup {}
            end,
            vim.cmd([[filetype plugin indent on]]),
            vim.cmd([[:let g:vimtex_compiler_method = 'latexmk']]),
            vim.api.nvim_set_keymap('n','tk',':Vimtexcompile<Enter>',
            { noremap = true, silent = true})
        }

        -- COLORSCHEMES
        use { 'Mofiqul/vscode.nvim' }
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
        use { 'fneu/breezy' }
        use { "bluz71/vim-moonfly-colors", as = "moonfly"  }
        use { "dasupradyumna/midnight.nvim" }
        use { "bluz71/vim-nightfly-colors", as = "nightfly" }
        use { 'jacoborus/tender.vim' }
        use { 'kaiuri/nvim-juliana' }

        -- Telescope (File Finder) --
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.4',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        -- ToggleTerm (Integrated Terminal)
        use { "akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup({
                -- toggleterm config goes here
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

        use {'nvim-tree/nvim-web-devicons'}
        require'nvim-web-devicons'.setup {
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
            };
            -- globally enable different highlight colors per icon (default to true)
            -- if set to false all icons will have the default icon's color
            color_icons = true;
            -- globally enable default icons (default to false)
            -- will get overriden by `get_icons` option
            default = true;
            -- globally enable "strict" selection of icons - icon will be looked up in
            -- different tables, first by filename, and if not found by extension; this
            -- prevents cases when file doesn't have any extension but still gets some icon
            -- because its name happened to match some extension (default to false)
            strict = true;
            -- same as `override` but specifically for overrides by filename
            -- takes effect when `strict` is true
            override_by_filename = {
                [".gitignore"] = {
                    icon = "",
                    color = "#f1502f",
                    name = "Gitignore"
                }
            };
            -- same as `override` but specifically for overrides by extension
            -- takes effect when `strict` is true
            override_by_extension = {
                ["log"] = {
                    icon = "",
                    color = "#81e043",
                    name = "Log"
                }
            };
        }

        -- Baerbar.nvim (Tabs) --
        -- A tabs plugin
        -- This is dependent on 'nvim-tree/nvim-web-devicons'
        use { 'romgrk/barbar.nvim', wants = 'nvim-tree/nvim-web-devicons',
        vim.api.nvim_set_keymap('n','<C-n>','<Cmd>BufferPin<Enter>',
        { noremap = true, silent }),
        vim.api.nvim_set_keymap('n','<C-d>','<Cmd>BufferDelete<Enter>',
        { noremap = true, silent }),
        vim.api.nvim_set_keymap('n','<A->>','<Cmd>BufferMoveNext<Enter>',
        { noremap = true, silent }),
        require'barbar'.setup {
            -- WARN: do not copy everything below into your config!
            --       It is just an example of what configuration options there are.
            --       The defaults are suitable for most people.

            -- Enable/disable animations
            animation = true,

            -- Enable/disable auto-hiding the tab bar when there is a single buffer
            auto_hide = false,

            -- Enable/disable current/total tabpages indicator (top right corner)
            tabpages = true,

            -- Enables/disable clickable tabs
            --  - left-click: go to buffer
            --  - middle-click: delete buffer
            clickable = true,

            -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
            -- Valid options are 'left' (the default), 'previous', and 'right'
            focus_on_close = 'left',

            -- Disable highlighting alternate buffers
            highlight_alternate = false,

            -- Disable highlighting file icons in inactive buffers
            highlight_inactive_file_icons = false,

            -- Enable highlighting visible buffers
            highlight_visible = true,

            icons = {
                -- Configure the base icons on the bufferline.
                -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
                buffer_index = true,
                buffer_number = true,
                button = '',
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
                    [vim.diagnostic.severity.WARN] = {enabled = true},
                    [vim.diagnostic.severity.INFO] = {enabled = true},
                    [vim.diagnostic.severity.HINT] = {enabled = true},
                },
                gitsigns = {
                    added = {enabled = true, icon = '+'},
                    changed = {enabled = true, icon = '~'},
                    deleted = {enabled = true, icon = '-'},
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = true,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
                separator = {left = '▎', right = ''},

                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                modified = {button = '●'},
                pinned = {button = '', filename = true},

                -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
                preset = 'default',

                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = {filetype = {enabled = false}},
                current = {buffer_index = true},
                inactive = {button = '×'},
                visible = {modified = {buffer_number = false}},
            },

            -- If true, new buffers will be inserted at the start/end of the list.
            -- Default is to insert after current buffer.
            insert_at_end = false,
            insert_at_start = false,

            -- Sets the maximum padding width with which to surround each tab
            maximum_padding = 1,

            -- Sets the minimum padding width with which to surround each tab
            minimum_padding = 1,

            -- Sets the maximum buffer name length.
            maximum_length = 30,

            -- Sets the minimum buffer name length.
            minimum_length = 0,

            -- If set, the letters for each buffer in buffer-pick mode will be
            -- assigned based on their name. Otherwise or in case all letters are
            -- already assigned, the behavior is to assign letters in order of
            -- usability (see order below)
            semantic_letters = true,

            -- Set the filetypes which barbar will offset itself for
            sidebar_filetypes = {
                -- Use the default values: {event = 'BufWinLeave', text = nil}
                NvimTree = true,
                -- Or, specify the text used for the offset:
                undotree = {text = 'undotree'},
                -- Or, specify the event which the sidebar executes when leaving:
                ['neo-tree'] = {event = 'BufWipeout'},
                -- Or, specify both
                Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
            },

            -- New buffer letters are assigned in this order. This order is
            -- optimal for the qwerty keyboard layout but might need adjustment
            -- for other layouts.
            letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

            -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
            -- where X is the buffer number. But only a static string is accepted here.
            no_name_title = nil,
        }
    }
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
    local opts = {
        cmd = {},
        settings = {
            java = {
                signatureHelp = { enabled = true },
                completion = {
                    favoriteStaticMembers = {},
                    filteredTypes = {
                        -- "com.sun.*",
                        -- "io.micrometer.shaded.*",
                        -- "java.awt.*",
                        -- "jdk.*",
                        -- "sun.*",
                    },
                },
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                    },
                    useBlocks = true,
                },
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-1.8",
                            path = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home",
                            default = true,
                        },
                        {
                            name = "JavaSE-17",
                            path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
                        },
                        {
                            name = "JavaSE-19",
                            path = "/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home",
                        },
                    },
                },
            },
        },
    }

    local function setup()
        local pkg_status, jdtls = pcall(require,"jdtls")
        if not pkg_status then
            vim.notify("unable to load nvim-jdtls", "error")
            return {}
        end

        -- local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
        local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

        local root_markers = { ".gradle", "gradlew", ".git" }
        local root_dir = jdtls.setup.find_root(root_markers)
        local home = os.getenv("HOME")
        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

        opts.cmd = {
            jdtls_bin,
            "-data",
            workspace_dir,
        }


        local on_attach = function(client, bufnr)
            jdtls.setup.add_commands() -- important to ensure you can update configs when build is updated
            -- if you setup DAP according to https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration you can uncomment below
            -- jdtls.setup_dap({ hotcodereplace = "auto" })
            -- jdtls.dap.setup_dap_main_class_configs()

            -- you may want to also run your generic on_attach() function used by your LSP config
        end

        opts.on_attach = on_attach
        opts.capabilities = vim.lsp.protocol.make_client_capabilities()

        return opts
    end

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

    -- Indent Blankline Config --
    -- require('indent_blankline').setup {
        --     show_end_of_line = true,
        --     space_char_blankline = " ",
        --     show_current_context = true,
        --     show_current_context_start = true,
        -- }

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
        -- The bar at the bottom of the editor
        require('lualine').setup {
            options = {
                theme = 'auto',
            }
        }








        -- Edit files remotely from your local machine (distant.nvim)
        use {
            'chipsenkbeil/distant.nvim',
            branch = 'v0.3',
            config = function()
                require('distant'):setup()
            end
        }


        -- Show's that I'm working in Neovim on Discord
        use { 'andweeb/presence.nvim' }
        require("presence").setup({
            -- General options
            auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
            neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
            main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
            client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
            log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
            debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
            enable_line_number  = false,                      -- Displays the current line number instead of the current project
            blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
            buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                show_time           = true,                       -- Show the timer

                -- Rich Presence text options
                editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                        git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                            plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                                reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                                    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                                        line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
                                        })

                                        -- Omnisharp-roslyn
                                        local pid = vim.fn.getpid()
                                        local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
                                        -- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
                                        require('lspconfig').omnisharp.setup {
                                            cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
                                            -- capabilities = capabilities
                                            -- Additional configurations can be added here
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

                                        vim.api.nvim_set_keymap('n','f',':Neotree<Enter>',{noremap=true,silent=true})
                                        vim.api.nvim_set_keymap('n','ff',':NeoTreeClose<Enter>',{noremap=true,silent=true})
                                        vim.api.nvim_set_keymap('n','T',':ToggleTerm direction=horizontal size=25<Enter>',{noremap=true,silent=true})
                                        vim.api.nvim_set_keymap('n','TV',':ToggleTerm direction=vertical size=100<Enter>',{noremap=true,silent=true})
                                        vim.api.nvim_set_keymap('n','TF',':ToggleTerm direction=float<Enter>',{noremap=true,silent=true})

                                        -- Tabs mappings (BufferMove, BufferPrevious, etc)
                                        vim.api.nvim_set_keymap('n','n',':BufferPrevious<Enter>',{noremap=true,silent=false})
                                        vim.api.nvim_set_keymap('n','m',':BufferNext<Enter>',{noremap=true,silent=false})
                                        vim.api.nvim_set_keymap('n','<Esc>n',':BufferMovePrevious<Enter>',{noremap=true,silent=false})
                                        vim.api.nvim_set_keymap('n','<Esc>m',':BufferMoveNext<Enter>',{noremap=true,silent=false})
                                        for i = 1, 9 do
                                            vim.api.nvim_set_keymap('n',tostring(i),":BufferGoto " .. tostring(i) .. " <Enter>",
                                            {noremap=true,silent=false})
                                        end

                                        -- Auto-generate comments
                                        vim.api.nvim_set_keymap('n','CC',':DogeGenerate<Enter>',{noremap=true,silent=true})

                                        -- Telescope commands to make navigation easier
                                        vim.api.nvim_set_keymap('n','rr',':Telescope find_files<Enter>',{noremap=true,silent=true})
                                        vim.api.nvim_set_keymap('n','RR',':Telescope<Enter>',{noremap=true,silent=true})
                                        -- Shows errors
                                        vim.api.nvim_set_keymap('n','er',':TroubleToggle<Enter>',{noremap=true,silent=true})

                                        -- Vimtex commands
                                        vim.api.nvim_set_keymap('n','tk',':VimtexCompile<Enter>',{noremap=true,silent=true})
                                        vim.api.nvim_set_keymap('n','te',':VimtexErrors<Enter>',{noremap=true,silent=true})



                                    end)

                                    -- PHP Intelephense LSP config
                                    vim.g.intelephense_enable = 1
                                    vim.g.intelephense_executable = 'intelephense'
                                    require('lspconfig').intelephense.setup{}


                                    -- Underlines the current Cursorline position
                                    vim.cmd([[hi CursorLine gui=underline cterm=underline]])

