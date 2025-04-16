return 
{
  "NvChad/nvterm",
  config = function()
    require("nvterm").setup({
      terminals = {
        shell = "bash", 
      },
      behavior = {
        auto_insert_mode = true,
      },
    })
  end
}

