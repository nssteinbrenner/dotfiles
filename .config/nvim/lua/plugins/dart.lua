return {
    "nssteinbrenner/dart",
    branch = "master",
    tag = "v1.0.0",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },

    config = function()
        local dart = require("dart").setup()

        vim.keymap.set("n", "<A-a>", function() dart:list():add() end)
        vim.keymap.set("n", "<A-e>", function() dart.ui:toggle_quick_menu(dart:list()) end)

        vim.keymap.set("n", "<A-h>", function() dart:list():select(1) end)
        vim.keymap.set("n", "<A-t>", function() dart:list():select(2) end)
        vim.keymap.set("n", "<A-n>", function() dart:list():select(3) end)
        vim.keymap.set("n", "<A-s>", function() dart:list():select(4) end)

        vim.keymap.set("n", "<A-S-P>", function() dart:list():prev() end)
        vim.keymap.set("n", "<A-S-N>", function() dart:list():next() end)
    end,
}
