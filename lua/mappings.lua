require "nvchad.mappings"

local map = vim.keymap.set

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- MODE NORMAL
map("n", "<leader>tt", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      vim.cmd("buffer " .. buf)
      return
    end
  end
  print("Aucun terminal trouvé !")
end, { desc = "Aller au dernier terminal" })

map("n", ";", ":", { desc = "Entrer en mode commande" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Déplacer la ligne vers le bas" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Déplacer la ligne vers le haut" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>dj", "Yp", { desc = "Dupliquer la ligne en dessous" })
map("n", "<leader>dk", "Ypk", { desc = "Dupliquer la ligne au-dessus" })
-- === LSP Useful Mappings ===
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Aller à la définition (gd)" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "Chercher les références (gr)" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renommer le symbole (rn)" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Afficher la documentation (hover)" })
map("n", "<leader>fm", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formater le fichier (Format)" })
map("n", "<leader>gb", "<C-o>", { desc = "Remonter en arrière après gd" })
map("n", "<C-a>", "ggVG\"+y", { desc = "Tout sélectionner et copier" })


-- MODE INSERTION  
map("i", "jk", "<ESC>")
map("i", "<C-Space>", function()
  require('cmp').complete()
end, { desc = "Déclencher completion" })

-- MODE VISUEL
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Déplacer sélection vers le bas" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Déplacer sélection vers le haut" })
map("v", "<leader>dj", "y'>p", { desc = "Dupliquer sélection en dessous" })
map("v", "<leader>dk", "y'<P", { desc = "Dupliquer sélection au-dessus" })


-- MODE TERMINAL

