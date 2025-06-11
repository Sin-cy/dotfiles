local set = vim.opt_local

set.textwidth = 80   -- move text to new line at 80 characters
set.spell = true     -- Enable spell checking
set.linebreak = true

-- Toggle Line Numbers (Visual Selection)
function ToggleNumberVisualSelection()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)

  -- Check if any line for numbering
  local has_numbers = false
  for i = 1, #lines do
    if lines[i]:match("^%s*%d+%.%s") then
      has_numbers = true
      break
    end
  end

  if has_numbers then
    -- remove numbers 
    for i = 1, #lines do
      lines[i] = lines[i]:gsub("^%s*%d+%.%s*", "")
    end
    print("✓ Numbers removed")
  else
    -- add numbers
    for i = 1, #lines do
      lines[i] = i .. ". " .. lines[i]
    end
    print("✓ Numbers added")
  end

  vim.fn.setline(start_line, lines)
end

-- Toggle Line Numbers for Current Line (Normal Mode)
function ToggleNumberCurrentLine()
  local line_num = vim.fn.line(".")
  local line = vim.fn.getline(line_num)

  if line:match("^%s*%d+%.%s") then
    -- Remove number
    line = line:gsub("^%s*%d+%.%s*", "")
    print("✓ Number removed")
  else
    -- Add number
    line = "1. " .. line
    print("✓ Number added")
  end

  vim.fn.setline(line_num, line)
end

-- Toggle Bullet Points for (Visual Selection)
function ToggleBulletVisualSelection()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)

  -- Check if any line has bullets
  local has_bullets = false
  for i = 1, #lines do
    if lines[i]:match("^%s*[%-%*%+]%s") then
      has_bullets = true
      break
    end
  end

  if has_bullets then
    -- Remove bullets
    for i = 1, #lines do
      lines[i] = lines[i]:gsub("^(%s*)[%-%*%+]%s*", "%1")
    end
    print("✓ Bullets removed")
  else
    -- Add bullets
    for i = 1, #lines do
      -- Only add bullet if line isn't already a bullet or checkbox
      if not lines[i]:match("^%s*[%-%*%+]%s") and not lines[i]:match("^%s*%d+%.%s") then
        lines[i] = "- " .. lines[i]
      end
    end
    print("✓ Bullets added")
  end

  vim.fn.setline(start_line, lines)
end

-- Toggle Bullet Points for Current Line (Normal Mode)
function ToggleBulletCurrentLine()
  local line_num = vim.fn.line(".")
  local line = vim.fn.getline(line_num)

  if line:match("^%s*[%-%*%+]%s") then
    -- Remove bullet
    line = line:gsub("^(%s*)[%-%*%+]%s*", "%1")
    print("✓ Bullet removed")
  else
    -- Add bullet
    if not line:match("^%s*%d+%.%s") then
      line = "- " .. line
      print("✓ Bullet added")
    end
  end

  vim.fn.setline(line_num, line)
end

-- Toggle Checkboxes for (Visual Selection)
function ToggleCheckboxVisualSelection()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)

  -- Check if any line has checkboxes
  local has_checkboxes = false
  for i = 1, #lines do
    if lines[i]:match("^%s*%-%s*%[.%]%s") then
      has_checkboxes = true
      break
    end
  end

  if has_checkboxes then
    -- Remove checkboxes (convert back to bullets)
    for i = 1, #lines do
      lines[i] = lines[i]:gsub("^(%s*%-)%s*%[.%]%s*", "%1 ")
    end
    print("✓ Checkboxes removed")
  else
    -- Add checkboxes
    for i = 1, #lines do
      if lines[i]:match("^%s*%-%s") then
        -- Convert existing bullet to checkbox
        lines[i] = lines[i]:gsub("^(%s*%-)%s*", "%1 [ ] ")
      elseif not lines[i]:match("^%s*$") then
        -- Add checkbox with bullet to non-empty lines
        lines[i] = "- [ ] " .. lines[i]
      end
    end
    print("✓ Checkboxes added")
  end

  vim.fn.setline(start_line, lines)
end

-- Toggle Checkboxes for Current Line (Normal Mode)
function ToggleCheckboxCurrentLine()
  local line_num = vim.fn.line(".")
  local line = vim.fn.getline(line_num)

  if line:match("^%s*%-%s*%[.%]%s") then
    -- Remove checkbox (convert back to bullet)
    line = line:gsub("^(%s*%-)%s*%[.%]%s*", "%1 ")
    print("✓ Checkbox removed")
  else
    -- Add checkbox
    if line:match("^%s*%-%s") then
      -- Convert existing bullet to checkbox
      line = line:gsub("^(%s*%-)%s*", "%1 [ ] ")
    elseif not line:match("^%s*$") then
      -- Add checkbox with bullet to non-empty line
      line = "- [ ] " .. line
    end
    print("✓ Checkbox added")
  end

  vim.fn.setline(line_num, line)
end

-- Toggle Task State for (Visual Selection)
function ToggleTaskStateVisualSelection()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)
  local changed = 0

  for i = 1, #lines do
    if lines[i]:match("^%s*%-%s*%[ %]") then
      -- Mark as done
      lines[i] = lines[i]:gsub("(%[) (])", "%1x%2")
      changed = changed + 1
    elseif lines[i]:match("^%s*%-%s*%[x%]") or lines[i]:match("^%s*%-%s*%[X%]") then
      -- Mark as undone
      lines[i] = lines[i]:gsub("(%[)[xX](])", "%1 %2")
      changed = changed + 1
    end
  end

  if changed > 0 then
    vim.fn.setline(start_line, lines)
    print("✓ " .. changed .. " tasks toggled")
  else
    print("○ No checkboxes found to toggle")
  end
end

-- Toggle Task State for Current Line (Normal Mode)
function ToggleTaskStateCurrentLine()
  local line_num = vim.fn.line(".")
  local line = vim.fn.getline(line_num)

  if line:match("^%s*%-%s*%[ %]") then
    -- Mark as done
    line = line:gsub("(%[) (])", "%1x%2")
    print("✓ Task completed")
  elseif line:match("^%s*%-%s*%[x%]") or line:match("^%s*%-%s*%[X%]") then
    -- Mark as undone
    line = line:gsub("(%[)[xX](])", "%1 %2")
    print("○ Task reopened")
  else
    print("○ No checkbox found to toggle")
  end

  vim.fn.setline(line_num, line)
end

-- Smart List Toggle for (Visual Selection)
function SmartListToggleVisualSelection()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)

  -- Determine current state
  local has_numbers = false
  local has_checkboxes = false
  local has_bullets = false

  for i = 1, #lines do
    if lines[i]:match("^%s*%d+%.%s") then
      has_numbers = true
    elseif lines[i]:match("^%s*%-%s*%[.%]%s") then
      has_checkboxes = true
    elseif lines[i]:match("^%s*[%-%*%+]%s") then
      has_bullets = true
    end
  end

  if has_numbers then
    -- Remove all formatting
    for i = 1, #lines do
      lines[i] = lines[i]:gsub("^%s*%d+%.%s*", "")
    end
    print("✓ All formatting removed")
  elseif has_checkboxes then
    -- Convert to numbers
    for i = 1, #lines do
      lines[i] = lines[i]:gsub("^(%s*)%-%s*%[.%]%s*", "%1")
      if not lines[i]:match("^%s*$") then
        lines[i] = i .. ". " .. lines[i]
      end
    end
    print("✓ Converted to numbered list")
  elseif has_bullets then
    -- Convert to checkboxes
    for i = 1, #lines do
      lines[i] = lines[i]:gsub("^(%s*)[%-%*%+]%s*", "%1- [ ] ")
    end
    print("✓ Converted to checkboxes")
  else
    -- Add bullets
    for i = 1, #lines do
      if not lines[i]:match("^%s*$") then
        lines[i] = "- " .. lines[i]
      end
    end
    print("✓ Added bullets")
  end

  vim.fn.setline(start_line, lines)
end

-- Smart List Toggle for Current Line (Normal Mode)
function SmartListToggleCurrentLine()
  local line_num = vim.fn.line(".")
  local line = vim.fn.getline(line_num)

  if line:match("^%s*%d+%.%s") then
    -- Remove all formatting
    line = line:gsub("^%s*%d+%.%s*", "")
    print("✓ All formatting removed")
  elseif line:match("^%s*%-%s*%[.%]%s") then
    -- Convert to number
    line = line:gsub("^(%s*)%-%s*%[.%]%s*", "%1")
    if not line:match("^%s*$") then
      line = "1. " .. line
    end
    print("✓ Converted to numbered list")
  elseif line:match("^%s*[%-%*%+]%s") then
    -- Convert to checkbox
    line = line:gsub("^(%s*)[%-%*%+]%s*", "%1- [ ] ")
    print("✓ Converted to checkbox")
  else
    -- Add bullet
    if not line:match("^%s*$") then
      line = "- " .. line
      print("✓ Added bullet")
    end
  end

  vim.fn.setline(line_num, line)
end

-- user commands
vim.api.nvim_create_user_command("ToggleNumberVisual", ToggleNumberVisualSelection, {})
vim.api.nvim_create_user_command("ToggleBulletVisual", ToggleBulletVisualSelection, {})
vim.api.nvim_create_user_command("ToggleCheckboxVisual", ToggleCheckboxVisualSelection, {})
vim.api.nvim_create_user_command("ToggleTaskStateVisual", ToggleTaskStateVisualSelection, {})
vim.api.nvim_create_user_command("SmartListToggleVisual", SmartListToggleVisualSelection, {})

-- visual mode keymaps (use commands to preserve selection)
vim.keymap.set("v", "tn", ":<C-u>ToggleNumberVisual<CR>", {
    desc = "Toggle numbers on selected lines",
    buffer = true,
})

vim.keymap.set("v", "tb", ":<C-u>ToggleBulletVisual<CR>", {
    desc = "Toggle bullets on selected lines",
    buffer = true,
})

vim.keymap.set("v", "tc", ":<C-u>ToggleCheckboxVisual<CR>", {
    desc = "Toggle checkboxes on selected lines",
    buffer = true,
})

vim.keymap.set("v", "tt", ":<C-u>ToggleTaskStateVisual<CR>", {
    desc = "Toggle task state on selected lines",
    buffer = true,
})

vim.keymap.set("v", "tl", ":<C-u>SmartListToggleVisual<CR>", {
    desc = "Smart list toggle on selected lines",
    buffer = true,
})

-- normal mode keymaps (call functions directly)
vim.keymap.set("n", "tn", ToggleNumberCurrentLine, {
    desc = "Toggle numbers on current line",
    buffer = true,
})

vim.keymap.set("n", "tb", ToggleBulletCurrentLine, {
    desc = "Toggle bullets on current line",
    buffer = true,
})

vim.keymap.set("n", "tc", ToggleCheckboxCurrentLine, {
    desc = "Toggle checkboxes on current line",
    buffer = true,
})

vim.keymap.set("n", "tt", ToggleTaskStateCurrentLine, {
    desc = "Toggle task state on current line",
    buffer = true,
})

vim.keymap.set("n", "tl", SmartListToggleCurrentLine, {
    desc = "Smart list toggle on current line",
    buffer = true,
})

-- Task management keymaps (buffer-local)
local opts = { buffer = 0, silent = true }

local function safe_markdown_cmd(cmd, success_msg)
    return function()
        -- undo point
        vim.cmd("normal! t'")

        -- run
        local ok, err = pcall(vim.cmd, cmd)

        if ok then
            print("✓ " .. success_msg)
        else
            print("✗ Failed: " .. err)
            -- Undo the change if it failed
            vim.cmd("undo")
        end
    end
end

vim.keymap.set("n", "<leader>tc",
    safe_markdown_cmd("g/- \\[ \\]/s/\\[ \\]/[x]/", "Marked all tasks as done"),
    vim.tbl_extend("force", opts, { desc = "Mark all tasks done" }))

vim.keymap.set("n", "<leader>tu",
    safe_markdown_cmd("g/- \\[x\\]/s/\\[x\\]/[ ]/", "Marked all tasks as undone"),
    vim.tbl_extend("force", opts, { desc = "Mark all tasks undone" }))

-- ** Header Colors **
-- highlights for markdown files to render highlights properly
-- thx to Linkarzu for this

local color1_bg = "#ff757f"
local color2_bg = "#4fd6be"
local color3_bg = "#7dcfff"
local color4_bg = "#ff9e64"
local color5_bg = "#7aa2f7"
local color6_bg = "#c0caf5"
local color_fg = "#1F2335"

vim.cmd(
  string.format([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color1_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.2.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color2_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.3.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color3_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.4.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color4_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.5.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color5_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.6.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color6_bg)
)

