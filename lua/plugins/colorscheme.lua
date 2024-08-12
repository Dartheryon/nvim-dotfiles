return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      transparent_background = true,
      flavour = "mocha",
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
  {
    "miikanissi/modus-themes.nvim",
    name = "modus",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },
  -- {
  --   "samharju/synthweave.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000,
  --   config = function()
  --     local synthweave = require("synthweave")
  --     synthweave.setup({
  --       transparent = false,
  --       overrides = {
  --         -- override any group
  --         Identifier = { fg = "#f22f52" },
  --       },
  --       palette = {
  --         -- override palette colors, take a peek at synthweave/palette.lua
  --         bg0 = "#040404",
  --       },
  --     })
  --     synthweave.load()
  --   end,
  -- },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local cyberdream = require("cyberdream")
  --     -- cyberdream.setup({
  --     --   -- Recommended - see "Configuring" below for more config options
  --     --   transparent = true,
  --     --   italic_comments = true,
  --     --   hide_fillchars = true,
  --     --   borderless_telescope = true,
  --     --   terminal_colors = true,
  --     --
  --     --   -- theme = { -- Default: nil
  --     --   --   highlights = {
  --     --   --     -- Highlight groups to override, adding new groups is also possible
  --     --   --     -- See `:help highlight-groups` for a list of highlight groups
  --     --   --
  --     --   --     -- Example:
  --     --   --     -- Comment = { fg = "#696969", bg = "NONE", italic = true },
  --     --   --
  --     --   --     -- Complete list can be found in `lua/cyberdream/theme.lua`
  --     --   --   },
  --     --   --
  --     --   --   -- Override a color entirely
  --     --   --   -- colors = {
  --     --   --   --   -- For a list of colors see `lua/cyberdream/colours.lua`
  --     --   --   --   -- Example:
  --     --   --   --   bg = "#000000",
  --     --   --   --   green = "#00ff00",
  --     --   --   --   magenta = "#ff00ff",
  --     --   --   -- },
  --     --   -- },
  --     -- })
  --     cyberdream.load()
  --     -- vim.cmd("colorscheme cyberdream") -- set the colorscheme
  --   end,
  -- },
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
