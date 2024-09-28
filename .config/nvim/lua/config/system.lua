local vim_dir = os.getenv("HOME") .. "/.vim"

vim.opt.writebackup = true
vim.opt.backup = true
vim.opt.undofile = true

vim.opt.directory = vim_dir .. "/swap"
vim.opt.backupdir = vim_dir .. "/backup"
vim.opt.undodir =  vim_dir .. "/undo"
