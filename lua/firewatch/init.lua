-- lua/firewatch/init.lua
local M = {}

M.colors = {
	bg = "#1e2027",
	fg = "#9ba2b2",

	-- ANSI colors
	black = "#585f6d",
	red = "#d95360",
	green = "#5ab977",
	yellow = "#dfb563",
	blue = "#4d89c4",
	magenta = "#d55119",
	cyan = "#44a8b6",
	white = "#e6e5ff",

	-- Bright colors
	bright_black = "#585f6d",
	bright_red = "#d95360",
	bright_green = "#5ab977",
	bright_yellow = "#dfb563",
	bright_blue = "#4c89c5",
	bright_magenta = "#d55119",
	bright_cyan = "#44a8b6",
	bright_white = "#e6e5ff",

	-- UI colors
	cursor = "#f6f7ec",
	selection = "#2f363e",
	comment = "#7d8fa4",
}

function M.setup(opts)
	opts = opts or {}
	local transparent = opts.transparent or false

	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "firewatch"

	local c = M.colors
	local bg = transparent and "NONE" or c.bg

	local highlights = {
		-- Base
		Normal = { fg = c.fg, bg = bg },
		NormalFloat = { fg = c.fg, bg = bg },
		FloatBorder = { fg = c.comment, bg = bg },

		-- Cursor
		Cursor = { fg = c.bg, bg = c.cursor },
		CursorLine = { bg = transparent and "NONE" or "#252831" },
		CursorColumn = { bg = transparent and "NONE" or "#252831" },
		ColorColumn = { bg = transparent and "NONE" or "#252831" },

		-- Line numbers
		LineNr = { fg = c.comment },
		CursorLineNr = { fg = c.yellow },

		-- Status line
		StatusLine = { fg = c.fg, bg = transparent and "NONE" or "#252831" },
		StatusLineNC = { fg = c.comment, bg = transparent and "NONE" or "#252831" },

		-- Visual
		Visual = { bg = c.selection },
		VisualNOS = { bg = c.selection },

		-- Search
		Search = { fg = c.bg, bg = c.yellow },
		IncSearch = { fg = c.bg, bg = c.magenta },

		-- Diff
		DiffAdd = { fg = c.green },
		DiffChange = { fg = c.yellow },
		DiffDelete = { fg = c.red },
		DiffText = { fg = c.blue },

		-- Syntax
		Comment = { fg = c.comment, italic = true },
		Constant = { fg = c.magenta },
		String = { fg = c.green },
		Character = { fg = c.green },
		Number = { fg = c.magenta },
		Boolean = { fg = c.magenta },
		Float = { fg = c.magenta },

		Identifier = { fg = c.red },
		Function = { fg = c.blue },

		Statement = { fg = c.red },
		Conditional = { fg = c.red },
		Repeat = { fg = c.red },
		Label = { fg = c.red },
		Operator = { fg = c.cyan },
		Keyword = { fg = c.red },
		Exception = { fg = c.red },

		PreProc = { fg = c.cyan },
		Include = { fg = c.cyan },
		Define = { fg = c.cyan },
		Macro = { fg = c.cyan },
		PreCondit = { fg = c.cyan },

		Type = { fg = c.yellow },
		StorageClass = { fg = c.yellow },
		Structure = { fg = c.yellow },
		Typedef = { fg = c.yellow },

		Special = { fg = c.magenta },
		SpecialChar = { fg = c.magenta },
		Tag = { fg = c.red },
		Delimiter = { fg = c.fg },
		SpecialComment = { fg = c.comment },
		Debug = { fg = c.red },

		Underlined = { underline = true },
		Error = { fg = c.red },
		Todo = { fg = c.yellow, bold = true },

		-- Treesitter
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.magenta },
		["@property"] = { fg = c.blue },
		["@parameter"] = { fg = c.fg },
		["@function"] = { fg = c.blue },
		["@function.builtin"] = { fg = c.cyan },
		["@function.macro"] = { fg = c.cyan },
		["@method"] = { fg = c.blue },
		["@constructor"] = { fg = c.yellow },
		["@keyword"] = { fg = c.red },
		["@keyword.function"] = { fg = c.red },
		["@keyword.operator"] = { fg = c.red },
		["@keyword.return"] = { fg = c.red },
		["@conditional"] = { fg = c.red },
		["@repeat"] = { fg = c.red },
		["@string"] = { fg = c.green },
		["@string.escape"] = { fg = c.magenta },
		["@character"] = { fg = c.green },
		["@number"] = { fg = c.magenta },
		["@boolean"] = { fg = c.magenta },
		["@float"] = { fg = c.magenta },
		["@type"] = { fg = c.yellow },
		["@type.builtin"] = { fg = c.yellow },
		["@operator"] = { fg = c.cyan },
		["@punctuation.delimiter"] = { fg = c.fg },
		["@punctuation.bracket"] = { fg = c.fg },
		["@punctuation.special"] = { fg = c.magenta },
		["@comment"] = { fg = c.comment, italic = true },
		["@tag"] = { fg = c.red },
		["@tag.attribute"] = { fg = c.yellow },
		["@tag.delimiter"] = { fg = c.fg },

		-- LSP
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.cyan },
	}

	for group, hl in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl)
	end
end

return M
