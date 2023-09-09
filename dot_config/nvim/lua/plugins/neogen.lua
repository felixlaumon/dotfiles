return {
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = {
      languages = {
        python = {
          template = {
            annotation_convention = "reST"
          }
        }
      }
    },
  }
}
