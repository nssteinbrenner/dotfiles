-- Options
vim.opt.guicursor = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.updatetime = 50

-- Clear trailing spaces and newlines on write
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e | %s#\\($\\n\\s*\\)\\+\\%$##e"
})

-- Reopen at last cursor line and center of screen
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line("'\"")
        if line > 0 and line <= vim.fn.line("$") then
            vim.cmd "normal! g`\""
        end
    end
})

-- 2 space identation for Terraform
vim.api.nvim_create_autocmd("FileType", {
    pattern = "terraform",
    command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
})
