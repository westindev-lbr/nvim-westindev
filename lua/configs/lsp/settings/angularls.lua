local ok, mason_registry = pcall(require, 'mason-registry')
if not ok then
    vim.notify("mason-registry could not be loaded", vim.log.levels.ERROR)
    return {}
end

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local angularls_path = mason_registry.get_package('angular-language-server'):get_install_path()
local node_modules_path = util.root_pattern("angular.json", "project.json")(vim.fn.expand("%:p"))

local cmd = {
    angularls_path .. "/../../bin/ngserver.cmd",
    "--stdio",
    "--tsProbeLocations", node_modules_path,
    "--ngProbeLocations", node_modules_path,
}

local config = {
    cmd = cmd,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("angular.json", "project.json"),
    on_new_config = function(new_config)
        new_config.cmd = cmd
    end,
}

return config
