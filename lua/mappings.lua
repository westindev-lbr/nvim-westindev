require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


map("n", "<leader>tt", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      vim.cmd("buffer " .. buf)
      return
    end
  end
  print("Aucun terminal trouvé !")
end, { desc = "Aller au dernier terminal" })

-- Déplacer une ligne vers le bas
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Déplacer la ligne vers le bas" })

-- Déplacer une ligne vers le haut
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Déplacer la ligne vers le haut" })

-- En mode visuel aussi (quand tu sélectionnes plusieurs lignes)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Déplacer sélection vers le bas" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Déplacer sélection vers le haut" })

-- Mapping des codes actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Dupliquer une ligne en dessous
map("n", "<leader>dj", "Yp", { desc = "Dupliquer la ligne en dessous" })

-- Dupliquer une ligne au-dessus
map("n", "<leader>dk", "Ypk", { desc = "Dupliquer la ligne au-dessus" })

-- Dupliquer une sélection en dessous en mode visuel
map("v", "<leader>dj", "y'>p", { desc = "Dupliquer sélection en dessous" })

-- Dupliquer une sélection au-dessus en mode visuel
map("v", "<leader>dk", "y'<P", { desc = "Dupliquer sélection au-dessus" })

-- === LSP Useful Mappings ===
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Aller à la définition (gd)" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "Chercher les références (gr)" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renommer le symbole (rn)" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Afficher la documentation (hover)" })
map("n", "<leader>fm", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Formater le fichier (Format)" })

map("i", "<C-Space>", function()
  require('cmp').complete()
end, { desc = "Déclencher completion" })

-- Remonter en arrière après gd
map("n", "<leader>gb", "<C-o>", { desc = "Go back to previous location" })

-- Tout sélectionner et copier
map("n", "<C-a>", "ggVG\"+y", { desc = "Select All and Copy" })
