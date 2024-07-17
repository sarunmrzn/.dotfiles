local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = {
    "lua",
    "comment",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "typescript",
    "tsx",
    "jsdoc",
    "json",
    "markdown",
    "regex",
    "rust",
    "yaml",
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
})
