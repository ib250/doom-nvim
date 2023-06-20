-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
--
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
-- doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--   end
-- })

-- ADDING A KEYBIND
--
-- doom.use_keybind({
--   -- The `name` field will add the keybind to whichkey
--   {"<leader>s", name = '+search', {
--     -- Bind to a vim command
--     {"g", "Telescope grep_string<CR>", name = "Grep project"},
--     -- Or to a lua function
--     {"p", function()
--       print("Not implemented yet")
--     end, name = ""}
--   }}
-- })

-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

-- vim: sw=2 sts=2 ts=2 expandtab
--
local treesitter_settings = doom.core.treesitter.settings
treesitter_settings.show_compiler_warning_message = false

local whichkey_settings = doom.modules.features.whichkey.settings
whichkey_settings.layout.height.max = 15

local default_opts = function()
  if vim.bo.filetype == "dashboard" then
    return
  else
    vim.opt.nu = true
    vim.opt.relativenumber = true

    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    vim.opt.smartindent = true
    vim.opt.wrap = false
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.undofile = true

    vim.opt.wildmenu = true
    vim.opt.foldenable = true
    vim.opt.foldmethod = "indent"
    vim.opt.foldnestmax = 10
    vim.opt.encoding = "utf8"
    vim.opt.foldlevel = 0
    vim.opt.foldlevelstart = 99

    vim.opt.ruler = true
    vim.opt.hidden = true
    vim.opt.autoindent = true
    vim.opt.expandtab = true
    vim.opt.backspace = { "indent", "eol", "start" }
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.hlsearch = true
    vim.opt.incsearch = true
    vim.opt.shellslash = true
    vim.opt.clipboard = "unnamedplus"

    vim.opt.lazyredraw = true
    vim.opt.cursorline = false

    vim.opt.scrolljump = 5
    vim.opt.re = 1
    vim.opt.scrolloff = 3
    vim.opt.laststatus = 1

    vim.opt.errorbells = false
    vim.opt.visualbell = false

    vim.opt.completeopt = { "menuone", "menu", "longest" }
    vim.opt.wildignore = { "*/tmp/*", "*.so", "*.swp", "*.zip" }
  end
end

doom.use_autocmd({
  {
    "BufEnter",
    "*",
    function()
      vim.cmd([[silent! lcd %:p:h]])
    end,
  },
  {
    "FileType",
    "*",
    function()
      default_opts()
    end,
  },
  {
    "FileType",
    "cpp",
    function()
      vim.cmd([[setlocal shiftwidth=4 tabstop=4 expandtab]])
    end,
  },
  {
    "FileType",
    "python",
    function()
      vim.cmd([[setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab]])
    end,
  },
  {
    "FileType",
    "haskell",
    function()
      vim.cmd([[setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab]])
    end,
  },
  {
    "FileType",
    "elm",
    function()
      vim.cmd([[setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab]])
    end,
  },
  {
    "FileType",
    "nix",
    function()
      vim.cmd([[setlocal shiftwidth=2 tabstop=2 expandtab]])
    end,
  },
  {
    "FileType",
    "vim",
    function()
      vim.cmd([[setlocal shiftwidth=2 tabstop=2 expandtab]])
    end,
  },
  {
    "FileType",
    "matlab",
    function()
      vim.cmd([[setlocal shiftwidth=2 tabstop=2 expandtab]])
    end,
  },
  {
    "FileType",
    "yaml",
    function()
      vim.cmd([[setlocal shiftwidth=2 tabstop=2 expandtab]])
    end,
  },
})

doom.use_keybind({
  {
    "<leader>f",
    name = "+files",
    {
      { "g", ":Telescope git_files<CR>", name = "Find Git files" },
    },
  },
})
