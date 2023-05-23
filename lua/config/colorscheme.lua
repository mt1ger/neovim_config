------ SETUP COLORSCHEME ------

-- setup must be called before loading the colorscheme
-- Default options:

local colorscheme = "gruvbox-material"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

