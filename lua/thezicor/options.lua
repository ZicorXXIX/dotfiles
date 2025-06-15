	vim.opt.backup = false
	vim.opt.swapfile = false
	vim.opt.undodir = 'C:'..os.getenv('HOMEPATH') .. '/.nvim/undodir' 
	-- for WSL
	-- vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undodir' 
	vim.opt.undofile = true

