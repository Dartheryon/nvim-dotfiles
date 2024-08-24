return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.lsp.hover = {
        enabled = true,
        silent = true,
        view = nil,
      }
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = "DocsViewToggle",
    opts = {
      position = "right",
      width = 60,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#1a1b26",
      timeout = 5000,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = {
  --     "meuter/lualine-so-fancy.nvim",
  --   },
  --   event = "VeryLazy",
  --   opts = function()
  --     local colors = require("cyberdream.colors").default
  --     local cyberdream = require("lualine.themes.cyberdream")
  --     local copilot_colors = {
  --       [""] = { fg = colors.grey, bg = colors.none },
  --       ["Normal"] = { fg = colors.grey, bg = colors.none },
  --       ["Warning"] = { fg = colors.red, bg = colors.none },
  --       ["InProgress"] = { fg = colors.yellow, bg = colors.none },
  --     }
  --     return {
  --       options = {
  --         component_separators = { left = " ", right = " " },
  --         section_separators = { left = " ", right = " " },
  --         theme = cyberdream,
  --         globalstatus = true,
  --         disabled_filetypes = { statusline = { "dashboard", "alpha" } },
  --       },
  --       sections = {
  --         lualine_a = { { "mode", icon = "" } },
  --         lualine_b = { { "branch", icon = "" } },
  --         lualine_c = {
  --           {
  --             "diagnostics",
  --             symbols = {
  --               error = " ",
  --               warn = " ",
  --               info = " ",
  --               hint = "󰝶 ",
  --             },
  --           },
  --           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
  --           {
  --             "filename",
  --             symbols = { modified = "  ", readonly = "", unnamed = "" },
  --           },
  --           {
  --             function()
  --               return require("nvim-navic").get_location()
  --             end,
  --             cond = function()
  --               return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
  --             end,
  --             color = { fg = colors.grey, bg = colors.none },
  --           },
  --         },
  --         lualine_x = {
  --           { "fancy_macro" },
  --           {
  --             require("lazy.status").updates,
  --             cond = require("lazy.status").has_updates,
  --             color = { fg = colors.green },
  --           },
  --           {
  --             function()
  --               local icon = " "
  --               local status = require("copilot.api").status.data
  --               return icon .. (status.message or "")
  --             end,
  --             cond = function()
  --               local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
  --               return ok and #clients > 0
  --             end,
  --             color = function()
  --               if not package.loaded["copilot"] then
  --                 return
  --               end
  --               local status = require("copilot.api").status.data
  --               return copilot_colors[status.status] or copilot_colors[""]
  --             end,
  --           },
  --           { "diff" },
  --         },
  --         lualine_y = {
  --           {
  --             "progress",
  --           },
  --           {
  --             "location",
  --             color = { fg = colors.cyan, bg = colors.none },
  --           },
  --         },
  --         lualine_z = {
  --           function()
  --             return "  " .. os.date("%X") .. " 🚀 "
  --           end,
  --         },
  --       },
  --
  --       extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
  --     }
  --   end,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        globalstatus = true,
        -- theme = "ayu_mirage",
        theme = "palenight",
      },
    },
  },

  -- filename
  -- {
  --   "b0o/incline.nvim",
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     local colors = require("kanagawa.colors").setup({ theme = "dragon" })
  --     require("incline").setup({
  --       highlight = {
  --         groups = {
  --           InclineNormal = { guibg = colors.palette.sumiInk0, guifg = colors.palette.dragonRed },
  --           InclineNormalNC = { guifg = colors.palette.sumiInk0, guibg = colors.palette.dragonRed },
  --         },
  --       },
  --       window = { margin = { vertical = 0, horizontal = 1 } },
  --       hide = {
  --         cursorline = true,
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         if vim.bo[props.buf].modified then
  --           filename = "[+] " .. filename
  --         end
  --
  --         local icon, color = require("nvim-web-devicons").get_icon_color(filename)
  --         return { { icon, guifg = color }, { " " }, { filename } }
  --       end,
  --     })
  --   end,
  -- },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
        twilight = { enabled = true },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

   ▄█    █▄     ▄█        ▄█     █▄   ▄█   ▄█        ▄█       
  ███    ███   ███       ███     ███ ███  ███       ███       
  ███    ███   ███▌      ███     ███ ███▌ ███       ███       
 ▄███▄▄▄▄███▄▄ ███▌      ███     ███ ███▌ ███       ███       
▀▀███▀▀▀▀███▀  ███▌      ███     ███ ███▌ ███       ███       
  ███    ███   ███       ███     ███ ███  ███       ███       
  ███    ███   ███       ███ ▄█▄ ███ ███  ███▌    ▄ ███▌    ▄ 
  ███    █▀    █▀         ▀███▀███▀  █▀   █████▄▄██ █████▄▄██ 
                                          ▀         ▀         

]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
