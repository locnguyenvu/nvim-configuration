if vim.api.nvim_call_function('executable', {'pyls'}) then
	vim.api.nvim_exec(
	[[
	au User lsp_setup call lsp#register_server({ 'name': 'pyls', 'cmd': {server_info->['pyls']}, 'allowlist': ['python'], })
	]], false)
end
