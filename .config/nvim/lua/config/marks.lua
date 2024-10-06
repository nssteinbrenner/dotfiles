-- Same as harpoon bindings
local available_marks = {"t", "h", "n", "s"}
local oldest_index = nil

local function add_mark()
    local location = vim.api.nvim_win_get_cursor(0)
    for i = 1, #available_marks do
        local found_mark = vim.api.nvim_buf_get_mark(0, available_marks[1])
        if found_mark[1] == 0 and found_mark[2] == 0 then
            vim.api.nvim_buf_set_mark(0, available_marks[i], location[1], location[2], {})
            if oldest_index == nil then
                oldest_index = i
            end
            return
        end
    end

    vim.api.nvim_buf_set_mark(0, available_marks[oldest_index], location[1], location[2], {})
    if oldest_index < #available_marks then
        oldest_index = oldest_index + 1
    else
        oldest_index = 1
    end
end

vim.keymap.set("n", "<A-a>", add_mark)
vim.keymap.set("n", "<A-t>", "'t")
vim.keymap.set("n", "<A-h>", "'h")
vim.keymap.set("n", "<A-n>", "'n")
vim.keymap.set("n", "<A-s>", "'s")
