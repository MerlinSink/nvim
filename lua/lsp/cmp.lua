local cmp = require("cmp")

cmp.setup({

	source_names = {
      nvim_lsp = "(LSP)",
      treesitter = "(TS)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      cmp_tabnine = "(Tabnine)",
      vsnip = "(Snippet)",
      luasnip = "(Snippet)",
      buffer = "(Buffer)",
      spell = "(Spell)",
  },
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },

	window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- 补全源
  sources = cmp.config.sources{
    { name = "nvim_lsp" },
    -- For vsnip users.
    { name = "vsnip" },

    { name = "buffer" },
    { name = "path" },

    -- For luasnip users.
    -- { name = 'luasnip' },

    --For ultisnips users.
    -- { name = 'ultisnips' },

    -- -- For snippy users.
    -- { name = 'snippy' },
  },

  -- Shotcut key
	mapping = require("keybindings").cmp(cmp),

	-- Use lspkind-nvim to show icon
	formatting = require("lsp.ui").formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- : 命令行模式中使用 path 和 cmdline 源.
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "cmdline" },
  }, {
    { name = "path" },
  }),
})
