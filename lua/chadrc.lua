-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
  transparency = true,
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
    -- === GRUPOS PARA KEYWORDS ===
    -- Grupos principales de Tree-sitter (más específicos)
    ['@keyword'] = { italic = true },          -- Palabras clave generales (for, while, if, etc.)
    ['@keyword.function'] = { italic = true }, -- function, def, fn
    ['@keyword.operator'] = { italic = true }, -- new, delete (si son tratados como keyword)
    ['@keyword.return'] = { italic = true },   -- return
    ['@conditional'] = { italic = true },      -- if, else, switch, case
    ['@repeat'] = { italic = true },         -- for, while, do, loop
    ['@include'] = { italic = true },        -- import, require, include, use
    ['@storage.type'] = { italic = true },   -- int, string, float, bool, var, let, const
    ['@type'] = { italic = true },           -- Tipos definidos por el usuario, type, interface
    ['@structure'] = { italic = true },      -- struct, class, enum, union
    ['@operator'] = { italic = true },       -- Algunos temas usan esto para 'new', 'delete', etc.

    -- Grupos legacy de Vim (fallback o si Tree-sitter no está activo)
    Keyword = { italic = true },
    Statement = { italic = true },           -- Cubre if, else, for, while, return, etc.
    Type = { italic = true },                -- int, void, String, etc.
    Structure = { italic = true },           -- struct, union, enum, class
    Include = { italic = true },             -- #include, import
    Operator = { italic = true },         -- Opcional, si tu tema los estiliza como keywords
    TSVariableBuiltin = { italic = true },
	}
}

M.nvdash = { load_on_startup = true}
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M

