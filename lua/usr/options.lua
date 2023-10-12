local vopt = vim.opt

vopt.nu = true
vopt.relativenumber = true

vopt.tabstop = 4
vopt.softtabstop = 4
vopt.shiftwidth = 4
vopt.expandtab = true

vopt.smartindent = true

vopt.wrap = true

vopt.swapfile = false
vopt.backup = false

vopt.hlsearch = false
vopt.incsearch = true

vopt.termguicolors = true

vopt.scrolloff = 8
vopt.signcolumn = "yes"
vopt.isfname:append("@-@")

vopt.updatetime = 50


-- Color Scheme
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("Gruvbox Not Found")
    return 
end
