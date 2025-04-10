-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local nvlsp = require("nvchad.configs.lspconfig")
local capabilities = vim.deepcopy(nvlsp.capabilities)
local omnisharp_extended = require("omnisharp_extended")
local angularls_config = require("configs.lsp.settings.angularls")

local servers = { "html", "cssls", "pyre" }


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  }
end

-- config lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  capabilities = capabilities,
})


-- configuring single server, example: typescript
lspconfig.ts_ls.setup({
   on_attach = nvlsp.on_attach,
   on_init = nvlsp.on_init,
   capabilities = capabilities,
})

lspconfig.angularls.setup(angularls_config)

lspconfig.gdscript.setup({
  capabilities = capabilities,
})

lspconfig.omnisharp.setup({
  cmd = { "C:/tools/omnisharp-win-x64-net6.0/OmniSharp.exe", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  root_dir = util.root_pattern("*.sln", "*.csproj", ".git"),
  enable_import_completion = true,
  organize_imports_on_format = true,
  handlers = {
    ["textDocument/definition"] = omnisharp_extended.definition_handler,
    ["textDocument/typeDefinition"] = omnisharp_extended.type_definition_handler,
    ["textDocument/references"] = omnisharp_extended.references_handler,
   },
})

