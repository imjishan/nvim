return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luaSnip = require("luasnip")
    local lspkind = require("lspkind")
    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luaSnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Whitespace,CursorLine:TabLineSel,FloatBorder:Whitespace,Search:None",
          side_padding = 0,
          padding = -8,
          border = "rounded",
          scrollbar = false,
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Whitespace,CursorLine:TabLineSel,FloatBorder:Whitespace,Search:None",
          side_padding = 0,
          border = "rounded",
          scrollbar = false,
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<M>"] = cmp.mapping.select_next_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Right>"] = cmp.mapping.scroll_docs(-4),
        ["<Left>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luaSnip.expandable() then
            luaSnip.expand()
          elseif luaSnip.expand_or_jumpable() then
            luaSnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end
        )
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
