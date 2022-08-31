lua <<EOF
local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.mapping.confirm({ select = false })()
          vim.api.nvim_input('<ESC>')
        else
          fallback()
        end
      end,
      n = cmp.mapping.confirm({ select = true }),
    }),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    -- go to next placeholder in the snippet
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
    -- go to previous placeholder in the snippet
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  })
})

lsp.nvim_workspace()
lsp.setup()
EOF
