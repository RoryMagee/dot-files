local function config(_config)
    local opts = { noremap=true, silent=true }
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end
    }, _config or {})
end

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting()]]

local omnisharp_bin = '/Users/rorymagee/omnisharp-roslyn/artifacts/publish/OmniSharp.Stdio.Driver/osx-x64/net6.0/Omnisharp'
local rust_analyzer = '/Users/rorymagee/.local/bin/rust-analyzer'
local pid = vim.fn.getpid()

require('lspconfig').gopls.setup(config())
require('lspconfig').tsserver.setup(config())
require('lspconfig').eslint.setup(config())
require('lspconfig').pyright.setup(config())
require('lspconfig').sqlls.setup(config())

require('lspconfig').omnisharp.setup(config({
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
}))

require('lspconfig').rust_analyzer.setup(config({
    settings = {
        ["rust-analyzer"] = {}
    }
}))


vim.opt.completeopt={"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
        { name = 'buffer' },
    })
})
