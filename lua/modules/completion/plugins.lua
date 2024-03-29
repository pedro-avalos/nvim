local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

-- use filetype to lazyload lsp
local enable_lsp_filetypes = {
	'sh', -- bashls
	'c', --clangd
	'cpp', -- clangd
	'objc', -- clangd
	'objcpp', -- clangd
	'cuda', -- clangd
	'proto', -- clangd
	'python', -- pyright
	'java', -- java-language-server
	'tex', -- texlab
	'plaintex', --texlab
	'bib', -- texlab
	'json', -- jsonls
}

plugin({
	'neovim/nvim-lspconfig',
	ft = enable_lsp_filetypes,
	config = conf.nvim_lsp,
})

plugin({
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	config = conf.nvim_cmp,
	requires = {
		{ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
		{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
		{ 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
	},
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })

plugin({ 'rafamadriz/friendly-snippets' })
