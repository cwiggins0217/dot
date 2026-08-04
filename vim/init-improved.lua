vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.textwidth = 80
vim.o.colorcolumn = "81"
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.linebreak = true
vim.o.showmatch = true
--vim.command("filetype plugin indent on") -- don't know how to do this with nvim api, will look later

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>o", ":update<CR> :so<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>")

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/olivercederborg/poimandres.nvim" },
})

vim.lsp.enable({ "lua_ls", "gopls", "clangd", "perlnavigator", "pyright" })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.o.background = "dark"
vim.cmd("colorscheme poimandres")
vim.cmd(":hi statusline guibg=NONE guifg=White")
vim.cmd(":hi LineNr cterm=NONE ctermbg=NONE gui=NONE guibg=NONE")

require("mini.pairs").setup()
require("mason").setup()
require("mini.pick").setup()
require("nvim-treesitter").install({ "go", "lua", "c", "bash", "python", "perl" })
require("nvim-treesitter-textobjects").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- because pack doesn't have the ability to clean unused stuff by default
local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("no unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end
vim.keymap.set("n", "<leader>pc", pack_clean)

-- automagically format code on file write
-- chooses appropriate formatter based on filetype
local function format_buffer(bufnr, command)
	if vim.fn.executable(command[1]) ~= 1 then
		vim.notify(("Formatter not found: %s"):format(command[1]), vim.log.levels.WARN)
		return
	end

	local original = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local input = table.concat(original, "\n") .. "\n"

	local result = vim.system(command, {
		stdin = input,
		text = true,
	}):wait()

	if result.code ~= 0 then
		local message = result.stderr or result.stdout or "Unknown formatter error"

		vim.notify(("%s failed:\n%s"):format(command[1], vim.trim(message)), vim.log.levels.ERROR)
		return
	end

	local formatted = vim.split(result.stdout, "\n", {
		plain = true,
	})

	-- nvim_buf_set_lines represents line endings implicitly.
	if formatted[#formatted] == "" then
		table.remove(formatted)
	end

	-- Avoid modifying the buffer when nothing changes.
	if vim.deep_equal(original, formatted) then
		return
	end

	local view = vim.fn.winsaveview()

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted)

	vim.fn.winrestview(view)
end

local formatters = {}

-- go formatter
formatters.go = function(bufnr)
	local filename = vim.api.nvim_buf_get_name(bufnr)

	format_buffer(bufnr, {
		"goimports",
		"-srcdir",
		filename ~= "" and filename or ".",
	})
end

-- lua formatter
formatters.lua = function(bufnr)
	local filename = vim.api.nvim_buf_get_name(bufnr)
	local command = { "stylua" }

	if filename ~= "" then
		vim.list_extend(command, {
			"--stdin-filepath",
			filename,
		})
	end

	table.insert(command, "-")
	format_buffer(bufnr, command)
end

-- perl formatter
formatters.perl = function(bufnr)
	format_buffer(bufnr, {
		"perltidy",
		"-st",
	})
end

-- shell formatter
formatters.sh = function(bufnr)
	local shebang = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""

	local dialect

	if shebang:match("bash") then
		dialect = "bash"
	elseif shebang:match("zsh") then
		dialect = "bash"
	elseif shebang:match("mksh") or shebang:match("ksh") then
		dialect = "mksh"
	else
		dialect = "posix"
	end

	format_buffer(bufnr, {
		"shfmt",
		"-ln",
		dialect,
		"-i",
		"4",
	})
end

local format_group = vim.api.nvim_create_augroup("FormatOnSave", {
	clear = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = format_group,
	pattern = "*",
	callback = function(args)
		local filetype = vim.bo[args.buf].filetype
		local formatter = formatters[filetype]

		if formatter then
			formatter(args.buf)
		end
	end,
})
