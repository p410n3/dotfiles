-- Write Neovim lua module scaffolding
local M = {}

function M.expand_classnames_helper()
    -- Get the word under the cursor in normal mode.
    local word = vim.fn.expand("<cword>")
    if word == "" then
        print("Neovim PHP Expand Classnames: No word found under cursor. Place cursor on a class name.")
        return
    end

    -- Run shell command to find the class file.
    -- For this we need the current file name and directory.
    local current_file = vim.fn.expand("%:p") -- Get the full path of the current file.

    local cmd_parts = {}
    -- Use grep to search for all use statements in the current file. and then sed to get a list of class names.
    -- Example command: grep '^use*' path/to/file.php | sed 's#use ##g' | sed 's#;##g' | grep word | head -n 1
    table.insert(cmd_parts, "grep")
    table.insert(cmd_parts, "^use") -- Match lines starting with 'use'.
    table.insert(cmd_parts, vim.fn.shellescape(current_file)) -- Search in the current file.
    table.insert(cmd_parts, "| sed 's#use ##g'") -- Remove 'use ' from the beginning of the line.
    table.insert(cmd_parts, "| sed 's#;##g'") -- Remove trailing semicolons.
    table.insert(cmd_parts, "| grep") -- Filter results to find the specific class.
    table.insert(cmd_parts, vim.fn.shellescape(word)) -- Search for the specific class name.
    table.insert(cmd_parts, "| head -n 1") -- Get the first match only.
    local cmd = table.concat(cmd_parts, " ")
    
    -- Execute the command synchronously. Its assumed only one class will be found, since thats kinda how PHP works.
    -- Might have edge cases but idc
    local classname = vim.fn.systemlist(cmd)[1] -- Get the first line of the output.
    -- get first line of the output

    -- Execute 'diw' to delete the word under the cursor.
    vim.api.nvim_command("normal! diw")

    -- Insert the namespace into the current buffer.
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col(".") - 1 -- Get the current column (0-based index).
  
    -- Insert the namespace at the current cursor position.
    local new_line = line:sub(1, col) .. classname .. line:sub(col + 1)
    vim.api.nvim_set_current_line(new_line)

    print("Neovim PHP Expand Classnames: Expanded '" .. word .. "' to '" .. classname .. "'.")
end

return M
