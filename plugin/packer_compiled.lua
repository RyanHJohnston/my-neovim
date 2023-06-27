-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ryanhjohnston/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ryanhjohnston/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ryanhjohnston/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ryanhjohnston/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ryanhjohnston/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["awesome-vim-colorschemes"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/awesome-vim-colorschemes",
    url = "https://github.com/rafi/awesome-vim-colorschemes"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim",
    wants = { "nvim-tree/nvim-web-devicons" }
  },
  breezy = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/breezy",
    url = "https://github.com/fneu/breezy"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["easyread.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/easyread.nvim",
    url = "https://github.com/JellyApple102/easyread.nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["hyper.vim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/hyper.vim",
    url = "https://github.com/jdsimcoe/hyper.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["magma-nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/magma-nvim",
    url = "https://github.com/dccsillag/magma-nvim"
  },
  ["mapx.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/mapx.nvim",
    url = "https://github.com/b0o/mapx.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mellow.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/mellow.nvim",
    url = "https://github.com/kvrohit/mellow.nvim"
  },
  ["midnight.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/midnight.nvim",
    url = "https://github.com/dasupradyumna/midnight.nvim"
  },
  moonfly = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/moonfly",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neovim = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  nightfly = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nightfly",
    url = "https://github.com/bluz71/vim-nightfly-colors"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-mysql"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-mysql",
    url = "https://github.com/jobo3208/nvim-mysql"
  },
  ["nvim-navbuddy"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-navbuddy",
    url = "https://github.com/SmiteshP/nvim-navbuddy"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  sobrio = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/sobrio",
    url = "https://github.com/elvessousa/sobrio"
  },
  ["sqls.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/sqls.nvim",
    url = "https://github.com/nanotee/sqls.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["termpdf.py"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/termpdf.py",
    url = "https://github.com/dsanson/termpdf.py"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\6\0\26\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\3\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3>\3\1\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\b\nerror\b\thint\b\fwarning\b\nother\b﫠\14auto_jump\1\2\0\0\20lsp_definitions\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\fpreview\6p\tnext\6j\frefresh\6r\rprevious\6k\vcancel\n<esc>\nclose\6q\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\1\0\15\14auto_fold\1\17auto_preview\2\15auto_close\1\14auto_open\1\17indent_lines\2\tmode\26workspace_diagnostics\fpadding\2\16fold_closed\b\14fold_open\b\nicons\2\nwidth\0032\vheight\3\n\ngroup\2\rposition\vbottom\25use_diagnostic_signs\1\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-cyberpunk"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-cyberpunk",
    url = "https://github.com/thedenisnikulin/vim-cyberpunk"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-github-dark"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-github-dark",
    url = "https://github.com/vv9k/vim-github-dark"
  },
  ["vim-irblack"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vim-irblack",
    url = "https://github.com/wesgibbs/vim-irblack"
  },
  vimtex = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/home/ryanhjohnston/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\6\0\26\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\3\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3>\3\1\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\b\nerror\b\thint\b\fwarning\b\nother\b﫠\14auto_jump\1\2\0\0\20lsp_definitions\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\fpreview\6p\tnext\6j\frefresh\6r\rprevious\6k\vcancel\n<esc>\nclose\6q\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\1\0\15\14auto_fold\1\17auto_preview\2\15auto_close\1\14auto_open\1\17indent_lines\2\tmode\26workspace_diagnostics\fpadding\2\16fold_closed\b\14fold_open\b\nicons\2\nwidth\0032\vheight\3\n\ngroup\2\rposition\vbottom\25use_diagnostic_signs\1\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
