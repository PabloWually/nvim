local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

vim.keymap.set('n', '<space>de', vim.diagnostic.open_float, {
  desc = "Show diagnostics",
})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = "Go to previous diagnostic",
})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = "Go to next diagnostic",
})
vim.keymap.set('n', '<space>qd', vim.diagnostic.setloclist, {
  desc = "Set diagnostics to location list",
})

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  M.set_keys(client, bufnr)
end

M.diagnostics_active = true

function M.toggle_diagnostics()
  M.diagnostics_active = not M.diagnostics_active
  if M.diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end

function M.set_keys(client, buffer)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
    buffer = buffer,
    desc = "Go to declaration",
  })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
    buffer = buffer,
    desc = "Go to definition",
  })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
    buffer = buffer,
    desc = "Hover",
  })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {
    buffer = buffer,
    desc = "Go to implementation",
  })
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {
    buffer = buffer,
    desc = "Go to type definition",
  })
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {
    buffer = buffer,
    desc = "Rename",
  })
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {
    buffer = buffer,
    desc = "Code action",
  })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
    buffer = buffer,
    desc = "Go to references",
  })
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, {
    buffer = buffer,
    desc = "Format",
  })
end

return M
