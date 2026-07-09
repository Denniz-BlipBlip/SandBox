-- File Path ~/.config/nvim/lua/mappings.lua

require "nvchad.mappings"

local map = vim.keymap.set

-- Terminal
map("n", "<leader>t", ":split | terminal<CR>", { noremap = true, silent = true })

-- Run Java (auto detects Spring Boot)
map("n", "<leader>rj", function()
  vim.cmd("silent! wall")
  local cwd = vim.fn.getcwd()
  local is_spring = vim.fn.filereadable(cwd .. "/pom.xml") == 1
  if is_spring then
    vim.cmd('split | terminal cd "' .. cwd .. '" && mvn spring-boot:run')
  else
    vim.cmd('split | terminal cd "' .. cwd .. '" && jrun')
  end
end, { noremap = true, silent = false, desc = "Run Java/Spring Boot" })

-- Run C++
map("n", "<leader>rc", function()
  local file = vim.fn.expand("%:p")
  local classname = vim.fn.fnamemodify(file, ":t:r")
  local filedir = vim.fn.fnamemodify(file, ":h")
  local filename = vim.fn.fnamemodify(file, ":t")
  local cmd = string.format(
    'cd "%s" && g++ "%s" -o "%s" && ./%s',
    filedir, filename, classname, classname)
  vim.cmd("split | terminal " .. cmd)
end, { noremap = true, silent = false, desc = "Run C++ file" })

-- Run HTML/Web (auto detects PHP/Laravel)
map("n", "<leader>rh", function()
  vim.cmd("silent! wall")
  local cwd = vim.fn.getcwd()
  local is_laravel = vim.fn.filereadable(cwd .. "/artisan") == 1
  local has_php_backend = vim.fn.isdirectory(cwd .. "/backend") == 1
  local cmd
  if is_laravel then
    cmd = string.format('cd "%s" && php artisan serve --port=3000', cwd)
  elseif has_php_backend then
    cmd = string.format('cd "%s" && php -S localhost:3000 -t public', cwd)
  else
    cmd = string.format('cd "%s" && python3 -m http.server 3000', cwd .. "/public")
  end
  vim.cmd("split | terminal " .. cmd)
  vim.defer_fn(function()
    vim.fn.jobstart("xdg-open http://localhost:3000")
  end, 2000)
end, { noremap = true, silent = false, desc = "Run Web project" })

-- Helper: check if Python file uses Tkinter GUI
local function py_has_gui(file)
  local handle = io.open(file, "r")
  if not handle then return false end
  local content = handle:read("*a")
  handle:close()
  return content:match("import tkinter") ~= nil
    or content:match("from tkinter") ~= nil
    or content:match("Tk%(%)") ~= nil
end

-- Run Python (auto detects flet/django/tkinter; guards against running setup.py)
map("n", "<leader>rp", function()
  vim.cmd("silent! wall")
  local file = vim.fn.expand("%:p")
  local filedir = vim.fn.fnamemodify(file, ":h")
  local filename = vim.fn.fnamemodify(file, ":t")
  local cwd = vim.fn.getcwd()

  if filename == "setup.py" then
    print("This is setup.py, not your app. Open src/main.py and press Space+rp there.")
    return
  end

  local is_django = vim.fn.filereadable(cwd .. "/manage.py") == 1

  local is_flet = false
  local req = filedir .. "/requirements.txt"
  local f = io.open(req, "r")
  if f then
    local content = f:read("*a")
    f:close()
    if content:match("flet") then is_flet = true end
  end
  if not is_flet then
    local pf = io.open(file, "r")
    if pf then
      local content = pf:read("*a")
      pf:close()
      if content:match("import flet") or content:match("from flet") then
        is_flet = true
      end
    end
  end

  local is_tk_gui = py_has_gui(file)

  local cmd
  if is_django then
    cmd = string.format('cd "%s" && python3 manage.py runserver', cwd)
  elseif is_flet then
    cmd = string.format('cd "%s" && flet run --web --port 8080 "%s"', filedir, filename)
  elseif is_tk_gui then
    cmd = string.format(
      'export DISPLAY=:0 && (xdpyinfo -display :0 >/dev/null 2>&1 || (termux-x11 :0 & sleep 2)) && am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 && cd "%s" && python3 "%s"',
      filedir, filename)
  else
    cmd = string.format('cd "%s" && python3 "%s"', filedir, filename)
  end
  vim.cmd("split | terminal " .. cmd)
end, { noremap = true, silent = false, desc = "Run Python/Flet/Django/Tkinter" })

-- Run Ruby
map("n", "<leader>rr", function()
  local file = vim.fn.expand("%:p")
  local filedir = vim.fn.fnamemodify(file, ":h")
  local bundle = filedir .. "/Gemfile"
  local cmd
  if vim.fn.filereadable(bundle) == 1 then
    cmd = string.format('cd "%s" && bundle exec ruby "%s"', filedir, vim.fn.fnamemodify(file, ":t"))
  else
    cmd = string.format('cd "%s" && ruby "%s"', filedir, vim.fn.fnamemodify(file, ":t"))
  end
  vim.cmd("split | terminal " .. cmd)
end, { noremap = true, silent = false, desc = "Run Ruby file" })

-- Run PHP (serves from src/ and opens browser)
map("n", "<leader>rph", function()
  vim.cmd("silent! wall")
  local cwd = vim.fn.getcwd()
  local src = cwd .. "/src"
  local cmd
  if vim.fn.isdirectory(src) == 1 then
    cmd = string.format('cd "%s" && php -S localhost:3000 -t src', cwd)
  else
    local file = vim.fn.expand("%:p")
    local filedir = vim.fn.fnamemodify(file, ":h")
    cmd = string.format('cd "%s" && php -S localhost:3000', filedir)
  end
  vim.cmd("split | terminal " .. cmd)
  vim.defer_fn(function()
    vim.fn.jobstart("xdg-open http://localhost:3000")
  end, 2000)
end, { noremap = true, silent = false, desc = "Run PHP project" })

-- Run JavaScript (Node.js) — independent from web/Space+rh
map("n", "<leader>rjs", function()
  vim.cmd("silent! wall")
  local file = vim.fn.expand("%:p")
  local filedir = vim.fn.fnamemodify(file, ":h")
  local filename = vim.fn.fnamemodify(file, ":t")
  local cwd = vim.fn.getcwd()
  local has_pkg = vim.fn.filereadable(cwd .. "/package.json") == 1
  local has_node_modules = vim.fn.isdirectory(cwd .. "/node_modules") == 1
  local cmd
  if has_pkg and not has_node_modules then
    cmd = string.format('cd "%s" && npm install && node "%s"', cwd, filedir .. "/" .. filename)
  else
    cmd = string.format('cd "%s" && node "%s"', filedir, filename)
  end
  vim.cmd("split | terminal " .. cmd)
end, { noremap = true, silent = false, desc = "Run JavaScript (Node.js)" })

-- Run C# (Mono) — derives project root from the OPEN FILE (like rc/rjs/rr do),
-- not from Neovim's global getcwd(), which was the bug: getcwd() doesn't follow
-- you when you switch buffers/navigate the tree, so it could point at the wrong folder.
map("n", "<leader>rs", function()
  vim.cmd("silent! wall")
  local file = vim.fn.expand("%:p")
  local filedir = vim.fn.fnamemodify(file, ":h")
  local project_root = filedir
  if vim.fn.fnamemodify(filedir, ":t") == "src" then
    project_root = vim.fn.fnamemodify(filedir, ":h")
  end
  local libdir = project_root .. "/lib"
  local refs = ""
  if vim.fn.isdirectory(libdir) == 1 then
    local dlls = vim.fn.glob(libdir .. "/*.dll", false, true)
    if #dlls > 0 then
      refs = " -r:" .. table.concat(dlls, ",")
    end
  end
  local cmd = string.format(
    'cd "%s" && mkdir -p bin && mcs src/*.cs%s -out:bin/App.exe && mono bin/App.exe',
    project_root, refs)
  vim.cmd("split | terminal " .. cmd)
end, { noremap = true, silent = false, desc = "Run C# (Mono)" })

-- Gruvbox line number colors (name is legacy — actual colors are orange, not Gruvbox)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNr",       { fg = "#e2036f" })
    vim.api.nvim_set_hl(0, "LineNrAbove",  { fg = "#e2036f" })
    vim.api.nvim_set_hl(0, "LineNrBelow",  { fg = "#e2036f" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f0eeec", bold = true })
  end,
})

vim.api.nvim_set_hl(0, "LineNr",       { fg = "#e2036f" })
vim.api.nvim_set_hl(0, "LineNrAbove",  { fg = "#e2036f" })
vim.api.nvim_set_hl(0, "LineNrBelow",  { fg = "#e2036f" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f0eeec", bold = true })

-- Disable snippet jumping with Tab
vim.keymap.del("i", "<Tab>")
vim.keymap.del("s", "<Tab>")
vim.keymap.del("i", "<S-Tab>")
vim.keymap.del("s", "<S-Tab>")

map("i", "<Tab>", "<Tab>", { noremap = true })
map("s", "<Tab>", "<Tab>", { noremap = true })

