return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config= function()
		local builtin = require('telescope.builtin')
        require('telescope').setup{
            extentions = {
                fzf = {}
            }
        }
		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ")})
		end, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pc', function ()
            builtin.find_files{
                cwd = vim.fn.stdpath("config")
            }
        end, { desc = 'Config Files'})

	end
}
