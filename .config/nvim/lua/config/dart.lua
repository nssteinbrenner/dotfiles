-- Same as harpoon bindings
local available_marks = {"t", "h", "n", "s"}
local oldest_index = 1
local current_index = 1

local function increment_index(index)
    if index < #available_marks then
        index = index + 1
    else
        index = 1
    end

    return index
end

local function decrement_index(index)
    if index > 1 then
        index = index - 1
    else
        index = #available_marks
    end

    return index
end

local function get_mark(index)
    return vim.api.nvim_buf_get_mark(0, available_marks[index])
end

local function set_mark(index, mark)
    vim.api.nvim_buf_set_mark(0, available_marks[index], mark[1], mark[2], {})
end

local function is_mark(mark)
    return mark[1] ~= nil and mark[1] ~= 0
end

local function jump_to(index)
    local end_of_file = vim.api.nvim_buf_line_count(0)
    local dest_mark = get_mark(index)
    if dest_mark[1] > end_of_file then
        dest_mark[1] = end_of_file
        set_mark(index, dest_mark)
    end
    if is_mark(dest_mark) then
        vim.api.nvim_win_set_cursor(0, dest_mark)
        vim.cmd.normal("zz")
        return true
    end
    return false
end

local function add_mark()
    local location = vim.api.nvim_win_get_cursor(0)
    for i = 1, #available_marks do
        local found_mark = get_mark(i)
        if is_mark(found_mark) == false then
            set_mark(i, location)
            current_index = i
            if oldest_index == nil then
                oldest_index = i
            end
            return
        end
    end

    set_mark(oldest_index, location)
    current_index = oldest_index
    if oldest_index < #available_marks then
        oldest_index = oldest_index + 1
    else
        oldest_index = 1
    end
end

local function next_mark()
    current_index = increment_index(current_index)

    for _ = 1, #available_marks do
        local result = jump_to(current_index)
        if result then
            return
        else
            current_index = increment_index(current_index)
        end
    end
    vim.print("No marks available.")
end

local function prev_mark()
    current_index = decrement_index(current_index)

    for _ = 1, #available_marks do
        local result = jump_to(current_index)
        if result then
            return
        else
            current_index = decrement_index(current_index)
        end
    end
    vim.print("No marks available.")
end

vim.keymap.set("n", "<A-a>", add_mark)
-- vim.keymap.set("n", "<A-t>", function() select(1) end)
-- vim.keymap.set("n", "<A-h>", function() select(2) end)
-- vim.keymap.set("n", "<A-n>", function() select(3) end)
-- vim.keymap.set("n", "<A-s>", function() select(4) end)

vim.keymap.set("n", "<A-t>", "'tzz")
vim.keymap.set("n", "<A-h>", "'hzz")
vim.keymap.set("n", "<A-n>", "'nzz")
vim.keymap.set("n", "<A-s>", "'szz")

vim.keymap.set("n", "<A-S-P>", prev_mark)
vim.keymap.set("n", "<A-S-N>", next_mark)
