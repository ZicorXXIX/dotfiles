return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        {
            "williamboman/mason.nvim",
            branch = "v1.x" -- Use Mason v1
        },
        {
            "williamboman/mason-lspconfig.nvim",
            branch = "v1.x" -- Use mason-lspconfig v1
        },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function ()
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'lua_ls','gopls', 'rust_analyzer', "ts_ls","eslint", "tailwindcss"},
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities()
                    })
                end,
            },
        })
        
        local cmp = require('cmp')
        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
            },
            mapping = cmp.mapping.preset.insert({
                -- confirm completion
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                -- scroll up and down the documentation window
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
        })
        
        -- LSP Keymaps
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
    end
}
