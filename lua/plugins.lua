local use = require("packer").use

return require("packer").startup({function()
  -- use { "wbthomason/packer.nvim" }

  -- Color schemes.
  use { "folke/tokyonight.nvim" }
  use { "bluz71/vim-nightfly-guicolors" }
  use { "bluz71/vim-moonfly-colors" }
  use { "shaunsingh/nord.nvim" }
  use { "navarasu/onedark.nvim" }
  use { "wuelnerdotexe/vim-enfocado" }
  use { "dracula/vim", as = "dracula" }

  -- Syntax for kitty config
  use { "fladson/vim-kitty" }

  -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
  -- when toggled in either of it"s three different modes (Ataraxis, Minimalist and Focus).
  use {
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZFocus",
      "TZAtaraxis",
      "TZMinimalist",
    },
    setup = function()
      require("plugins/true-zen")
    end
  }

  -- This plugin adds indentation guides to all lines (including empty lines).
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      require("plugins/indent-blankline")
    end
  }

  -- This plugin show trailing whitespace.
  use {
    "ntpeters/vim-better-whitespace",
    config = function()
        require("plugins/better-whitespace")
    end
  }

  -- Icons.
  use {
    "kyazdani42/nvim-web-devicons",
    event = "BufEnter"
  }

  -- File explorer tree.
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeFocus",
      "NvimTreeToggle",
    },
    config = function()
      require("plugins/nvim-tree")
    end
  }

  -- Bufferline.
  use {
    "akinsho/nvim-bufferline.lua",
    after = "nvim-web-devicons",
    config  = function()
      require("plugins/bufferline")
    end
  }

  -- Statusline.
  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-bufferline.lua",
    config = function ()
      require("plugins/lualine")
    end
  }

  -- TreeSitter.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    cmd = {
      "TSInstall",
      "TSInstallSync",
      "TSBufEnable",
      "TSBufToggle",
      "TSEnableAll",
      "TSInstallFromGrammer",
      "TSToggleAll",
      "TSUpdate",
      "TSUpdateSync"
    },
    config = function()
      require("plugins/treesitter")
    end
  }

  -- Colorizer (for highlighting color codes).
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("plugins/colorize")
      vim.cmd("ColorizerAttachToBuffer")
    end
  }

  -- Startup screen.
  use {
    "glepnir/dashboard-nvim",
    cmd = {
      "Dashboard",
      "DashboardChangeColorscheme",
      "DashboardFindFile",
      "DashboardFindHistory",
      "DashboardFindWord",
      "DashboardNewFile",
      "DashboardJumpMarks"
      -- "SessionLoad",
      -- "SessionSave"
    },
    setup = function()
        require("plugins/dashboard")
    end
  }

  -- Fuzzy finder and it requirments.
  -- TODO: lazy load plenary, popup and telescope-media-files
  use { "nvim-lua/plenary.nvim" }
  use { "emilienlemaire/clang-tidy.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugins/telescope")
    end
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim", run = "make",
    -- cmd = "Telescope"
  }
  if vim.fn.has("win32") == 0 then
    use {
      "nvim-lua/popup.nvim",
      -- cmd = "Telescope"
    }
    use {
      "nvim-telescope/telescope-media-files.nvim",
      after = "popup.nvim"
    }
  end

  -- LSP, LSP installer and tab completion.
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("plugins/cmp")
    end
  }
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("snippets/luasnip")
    end,
    after = "nvim-cmp"
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
  }
  use {
    "SirVer/ultisnips",
    config = function()
      require("plugins/ultisnips")
    end,
    after = "nvim-cmp"
  }
  use {
    "quangnguyen30192/cmp-nvim-ultisnips",
    after = "ultisnips"
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "cmp_luasnip"
  }
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp-nvim-lsp"
  }

  -- LSP signature.
  use { "ray-x/lsp_signature.nvim" }

  -- VsCode like pictograms for lsp.
  use { "onsails/lspkind-nvim" }

  -- View and search LSP symbols, tags in Neovim.
  use { "liuchengxu/vista.vim", cmd = "Vista" }

  -- Terminal.
  use {
    "akinsho/nvim-toggleterm.lua",
    cmd = "ToggleTerm",
    setup = function()
      require("plugins/toggleterm")
    end
  }

  -- Git support for nvim.
  use {
    "rhysd/committia.vim",
    config = function()
        vim.cmd [[
            source ~/.config/nvim/lua/plugins/committia.vim
        ]]
    end
  }
  use {
    "tpope/vim-fugitive",
  }

  -- Git signs.
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()
    end
  }

  -- Auto closes.
  use {
    "windwp/nvim-autopairs",
    event = "BufRead",
    config = function()
      require("nvim-autopairs").setup{}
    end
  }
  -- This is for html and it can autorename too!
  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  }

  -- Scrollbar.
  use {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    config = function()
      require("plugins/nvim-scroll")
    end
  }

  -- Smooth scroll.
  use {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("neoscroll").setup()
    end
  }
  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base.
  use {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    config = function()
      require("plugins/todo-comments")
    end
  }

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing.
  use { "folke/which-key.nvim" }

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a file.
  use {
    "jghauser/mkdir.nvim",
    cmd = "new",
    config = function()
      require("mkdir")
    end
  }

  -- Neovim plugin to comment text in and out.
  -- Supports commenting out the current line, a visual selection and a motion.
  use {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    config = function()
      require("nvim_comment").setup()
    end
  }

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use { "andymass/vim-matchup" }

  -- With this plugin you can resize Neovim buffers easily.
  use {
    "artart222/vim-resize",
    event = "BufEnter"
  }

  use {
    "tpope/vim-surround",
    event = "BufEnter"
  }
  use {
    "Shatur/neovim-session-manager",
    config = function()
      require("plugins/neovim-session-manager")
    end
  }
  use {
    "preservim/tagbar",
    cmd = "Tagbar"
  }

  -- Import settings of plugins or start plugins.
  require("lsp_signature").setup()
  require("which-key").setup()

end,
config = {
  max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
  auto_clean = false, -- During sync(), remove unused plugins
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      update         = 'pull --ff-only --progress --rebase=true --autostash',
      install        = 'clone --depth %i --no-single-branch --progress',
      fetch          = 'fetch --depth 999999 --progress',
      checkout       = 'checkout %s --',
      update_branch  = 'merge --ff-only @{u}',
      current_branch = 'branch --show-current',
      diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt       = '%%h %%s (%%cr)',
      get_rev        = 'rev-parse --short HEAD',
      get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules     = 'submodule update --init --recursive --progress'
    },
    depth = 1, -- Git clone depth
    clone_timeout = 60, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  }
}})
