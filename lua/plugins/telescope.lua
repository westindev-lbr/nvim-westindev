return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or
    dependencies = {'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
    },
    config = function()
      print("telescope")
    end
  }
}
