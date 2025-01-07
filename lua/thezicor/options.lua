return{
	vim.opt.backup = false 
	vim.opt.swapfile = false 
	vim.opt.undodir = os.getenv('HOMEPATH') .. '/.nvim/undodir' 
	vim.opt.undofile = true
}
