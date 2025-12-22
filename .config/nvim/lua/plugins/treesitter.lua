return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "go",
            "html",
            "javascript",
            "jsdoc",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "query",
            "regex",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,

            -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
}
