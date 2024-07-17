local null_ls = require("null-ls")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local ccls = require("lspconfig").ccls

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d,
		require("typescript.extensions.null-ls.code-actions"),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			--[[ vim.api.nvim_create_autocmd("BufWritePre", { ]]
			--[[ 	group = augroup, ]]
			--[[ 	buffer = bufnr, ]]
			--[[ 	callback = function() ]]
			--[[ 		lsp_formatting(bufnr) ]]
			--[[ 	end, ]]
			--[[ }) ]]
		end
	end,
})

vim.api.nvim_create_user_command("FormatBuff", function()
	lsp_formatting(vim.api.nvim_get_current_buf())
end, {})

vim.api.nvim_set_keymap("n", "<leader>fx", ":Format<CR>", { noremap = true, silent = true })
