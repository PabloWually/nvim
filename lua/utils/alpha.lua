local dashboard = require("alpha.themes.dashboard")
local stats = require("lazy").stats()

local if_nil = vim.F.if_nil
local fnamemodify = vim.fn.fnamemodify
local filereadable = vim.fn.filereadable
local datetime = tonumber(os.date(" %H "))
local total_plugins = stats.count

--- Creates a dashboard button with specific styling.
---@param sc string The shortcut key for the button.
---@param txt string The text to display on the button.
---@param keybind string The command to execute when the button is pressed.
---@param keybind_opts table|nil Optional keybind options.
---@return table The created button element.
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButtonText"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end

--- Gets the file extension from a filename.
---@param fn string The filename.
---@return string The file extension.
local function get_extension(fn)
  local match = fn:match("^.+(%..+)$")
  local ext = ""
  if match ~= nil then
    ext = match:sub(2)
  end
  return ext
end

local nvim_web_devicons = {
  enabled = true,
  highlight = true,
}

--- Gets the devicon for a given filename.
---@param fn string The filename.
---@return string The icon character.
local function icon(fn)
  local nwd = require("nvim-web-devicons")
  local ext = get_extension(fn)
  return nwd.get_icon(fn, ext, { default = true })
end

--- Creates a button for a file, including its devicon.
---@param fn string The full path to the file.
---@param sc string The shortcut key for the button.
---@param short_fn string The shortened filename to display.
---@param autocd boolean Whether to change the directory to the file's directory.
---@return table The created file button element.
local function file_button(fn, sc, short_fn, autocd)
  short_fn = if_nil(short_fn, fn)
  local ico_txt
  local fb_hl = {}
  if nvim_web_devicons.enabled then
    local ico, hl = icon(fn)
    local hl_option_type = type(nvim_web_devicons.highlight)
    if hl_option_type == "boolean" then
      if hl and nvim_web_devicons.highlight then
        table.insert(fb_hl, { hl, 0, #ico })
      end
    end
    if hl_option_type == "string" then
      table.insert(fb_hl, { nvim_web_devicons.highlight, 0, #ico })
    end
    ico_txt = ico .. "  "
  else
    ico_txt = ""
  end
  local cd_cmd = (autocd and " | cd %:p:h" or "")
  local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. vim.fn.fnameescape(fn) .. cd_cmd .. " <CR>")
  local fn_start = short_fn:match(".*[/\\]")
  if fn_start ~= nil then
    table.insert(fb_hl, { "Comment", #ico_txt, #fn_start + #ico_txt })
  end
  file_button_el.opts.hl = fb_hl
  return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
  ignore = function(path, ext)
    return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
  end,
  autocd = false,
}

--- Generates a list of most recently used files.
---@param start number The starting index for the list.
---@param cwd string? optional The current working directory to filter files.
---@param items_number number? optional The number of items to generate, default = 10.
---@param opts table? optional Options for ignoring files and autocd.
---@return table A table representing the group of MRU file buttons.
local function mru(start, cwd, items_number, opts)
  opts = opts or mru_opts
  items_number = if_nil(items_number, 10)
  local oldfiles = {}
  for _, v in pairs(vim.v.oldfiles) do
    if #oldfiles == items_number then
      break
    end
    local cwd_cond
    if not cwd then
      cwd_cond = true
    else
      cwd_cond = vim.startswith(v, cwd)
    end
    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
    if (filereadable(v) == 1) and cwd_cond and not ignore then
      oldfiles[#oldfiles + 1] = v
    end
  end

  local file_parts = {}
  local max_width = 0
  for _, fn in ipairs(oldfiles) do
    local filename = fnamemodify(fn, ":t")
    local dir
    if cwd then
      dir = fnamemodify(fnamemodify(fn, ":."), ":h")
      if dir == "." then
        dir = ""
      end
    else
      dir = fnamemodify(fnamemodify(fn, ":~"), ":h")
    end
    local current_width = #filename + #dir
    if current_width > max_width then
      max_width = current_width
    end
    table.insert(file_parts, { filename = filename, dir = dir, fn = fn })
  end

  local tbl = {}
  for i, parts in ipairs(file_parts) do
    local padding_size = max_width - #parts.filename - #parts.dir + 2
    local padding = string.rep(" ", padding_size)
    local short_fn = parts.dir .. "/" .. parts.filename .. padding .. "  "
    local file_button_el = file_button(parts.fn, tostring(i + start - 1), short_fn, opts.autocd)
    tbl[i] = file_button_el
  end

  return {
    type = "group",
    val = tbl,
    opts = {
      spacing = 1,
      shrink_margin = false,
    },
  }
end

--- Generates a greeting message based on the time of day.
---@return string The greeting message.
local greeting = function()
  -- Determine the appropriate greeting based on the hour
  local mesg
  local username = "Wually" --os.getenv("USERNAME")
  if datetime >= 0 and datetime < 6 then
    mesg = "Dreaming..󰒲 󰒲 "
  elseif datetime >= 6 and datetime < 12 then
    mesg = "🌅 Hi " .. username .. ", Good Morning ☀️"
  elseif datetime >= 12 and datetime < 18 then
    mesg = "🌞 Hi " .. username .. ", Good Afternoon ☕️"
  elseif datetime >= 18 and datetime < 21 then
    mesg = "🌆 Hi " .. username .. ", Good Evening 🌙"
  else
    mesg = "Hi " .. username .. ", it's getting late, get some sleep 😴"
  end
  return mesg
end

--- Generates the footer text with date, time, and plugin information.
---@return string The footer text.
local function footer()
  local footer_datetime = os.date("  %m-%d-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  -- local ms = stats.startuptime
  local value = footer_datetime .. "   Plugins " .. total_plugins .. nvim_version_info
  return value
end

--- Generates the title for the MRU list, including the current working directory.
---@return string The MRU title.
local function mru_title()
  return "MRU " .. vim.fn.getcwd()
end

return {
  mru_title = mru_title,
  mru = mru,
  greeting = greeting,
  footer = footer,
  button = button,
}

