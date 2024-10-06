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

local function check_mark(mark)
    return mark[1] ~= 0 and mark[0] ~= 0
end

local function add_mark()
    local location = vim.api.nvim_win_get_cursor(0)
    for i = 1, #available_marks do
        local found_mark = get_mark(i)
        if found_mark[1] == 0 and found_mark[2] == 0 then
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

    local dest_mark = get_mark(current_index)
    if check_mark(dest_mark) == false then
        current_index = decrement_index(current_index)
        return
    end
    vim.api.nvim_win_set_cursor(0, get_mark(current_index))
end

local function prev_mark()
    current_index = decrement_index(current_index)

    local dest_mark = get_mark(current_index)
    if check_mark(dest_mark) == false then
        current_index = decrement_index(current_index)
        return
    end
    vim.api.nvim_win_set_cursor(0, get_mark(current_index))
end

vim.keymap.set("n", "<A-a>", add_mark)
vim.keymap.set("n", "<A-t>", "'t")
vim.keymap.set("n", "<A-h>", "'h")
vim.keymap.set("n", "<A-n>", "'n")
vim.keymap.set("n", "<A-s>", "'s")

vim.keymap.set("n", "<A-S-P>", prev_mark)
vim.keymap.set("n", "<A-S-N>", next_mark)
