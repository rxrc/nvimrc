lua <<EOF
-- ===== Completion (nvim-cmp + Luasnip) =====
local cmp = require('cmp')
local luasnip = require('luasnip')

vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = { completeopt = 'menu,menuone,noinsert,noselect' },
  snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
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
      if cmp.visible() then return cmp.mapping.confirm({ select = true })() end
      vim.api.nvim_input('<Right>')
    end, { 'i', 'c' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' }, { name = 'path' } }),
})

-- ===== Mason (optional) =====
local has_mason, mason = pcall(require, 'mason')
if has_mason then mason.setup() end

local has_mlsp, mlsp = pcall(require, 'mason-lspconfig')
if has_mlsp then
  mlsp.setup({
    ensure_installed = { 'lua_ls' },      -- add more here if you like
    automatic_installation = true,
  })
end

-- ===== Native LSP (no lsp-zero, no lspconfig.setup) =====
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function enable(server, extra)
  local cfg = vim.tbl_deep_extend('force', { capabilities = capabilities }, extra or {})
  vim.lsp.config(server, cfg)
  vim.lsp.enable(server)
end

-- lua_ls (replaces lsp.nvim_workspace())
enable('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
      telemetry = { enable = false },
    },
  },
})

-- If mason-lspconfig is present, enable any other installed servers automatically
if has_mlsp and mlsp.get_installed_servers then
  for _, server in ipairs(mlsp.get_installed_servers()) do
    if server ~= 'lua_ls' then enable(server) end
  end
end
EOF

" Your rename mapping
nnoremap <silent> gR :lua vim.lsp.buf.rename()<CR>
