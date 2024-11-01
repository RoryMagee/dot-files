local function config(_config)
	local opts = { noremap = true, silent = true }
	return vim.tbl_deep_extend("force", {
		on_attach = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end,
	}, _config or {})
end

vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

local omnisharp_bin = "/Users/rorymagee/omnisharp/OmniSharp.dll"
local rust_analyzer = "/opt/homebrew/bin/rust-analyzer"
local pid = vim.fn.getpid()

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
require("lspconfig").gopls.setup(config())
require("lspconfig").tsserver.setup(config())
require("lspconfig").eslint.setup(config())
require("lspconfig").pyright.setup(config())
require("lspconfig").sqlls.setup(config())
require("lspconfig").zls.setup(config())

require("lspconfig").omnisharp.setup(config({
	-- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
	cmd = { "dotnet", omnisharp_bin },
}))

require("lspconfig").clangd.setup(config())

require("lspconfig").rust_analyzer.setup(config({
	inlay_hints = {
		auto = true,
		only_current_line = false,
		show_parameter_hints = true,
		parameter_hints_prefix = "<- ",
		other_hints_prefix = "=> ",
		highlight = "Comment",
	},
	settings = {
		["rust-analyzer"] = {},
	},
}))

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
		["<C-u>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})
