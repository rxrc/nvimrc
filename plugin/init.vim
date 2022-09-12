lua <<EOF
local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.setup_nvim_cmp({
  preselect = cmp.PreselectMode.None,
  -- UPSTREAM: preselect does not work, must set completeopt.
  -- https://github.com/VonHeikemen/lsp-zero.nvim/pull/44#issuecomment-1233265854
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  mapping = lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.get_selected_entry() then
        cmp.mapping.confirm({ select = false })()
        vim.api.nvim_input('<ESC>')
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-l>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.mapping.confirm({ select = true })()
      end
      vim.api.nvim_input('<Right>')
    end, { 'i', 'c' }),
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

nnoremap <silent> gR :lua vim.lsp.buf.rename()<CR>
