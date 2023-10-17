-- plugins about lsp cmp and snippet

local lsp_bindings = {
    {'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>'},
    {'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>'},
    {'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>'},
    {'n', 'gr', '<cmd>lua vim.lsp.buf.reference()<cr>'},
    {'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>'},
    {'n', 'go', '<cmd>lua vim.lsp.buf.open_float()<cr>'},
    {'n', 'gp', '<cmd>lua vim.lsp.buf.goto_prev()<cr>'},
    {'n', 'gn', '<cmd>lua vim.lsp.buf.goto_next()<cr>'},
}

local keymapping = require('keymapping')

local lspconfig = {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.clangd.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.pyright.setup({})
        lspconfig.rust_analyzer.setup({})
        keymapping.bindkeys(lsp_bindings)
    end
}

local cmp = {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            sources = cmp.config.sources({
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'path'},
                {name = 'vsnipt'},
            }),
            formmat = {
                formmat = lspkind.cmp_format({
                    with_text = true,
                })
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<tab>'] = cmp.mapping.confirm({
                    select = true,
                    behavior = cmp.ConfirmBehavior.Replace
                }),
            }),
        })
    end
}

return {lspconfig, cmp}
