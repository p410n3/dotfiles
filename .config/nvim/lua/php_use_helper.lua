-- lua/php_use_helper.lua
-- I asked Gemini to write this code, and changed whatever was broken. (Not that much actually)
local M = {}

--- Finds PHP files by name under the cursor and inserts a selected path as a 'use' statement.
-- This function attempts to determine the project root (via Git) for a more accurate search.
-- It then converts the file path to a PHP namespace and inserts it into the current buffer.
-- The insertion point is determined by looking for existing 'namespace' or 'use' statements.
function M.find_and_insert_use_statement()
    -- Get the word under the cursor in normal mode.
    local word = vim.fn.expand("<cword>")
    if word == "" then
        print("Neovim PHP Use: No word found under cursor. Place cursor on a class name.")
        return
    end

    local filename = word .. ".php"
    local search_dir = vim.fn.getcwd() -- Default search starts from the current working directory.

    -- Attempt to find the project root using Git. This helps in searching the entire project.
    local project_root = nil
    local handle = io.popen("git rev-parse --show-toplevel 2>/dev/null")
    if handle then
        local git_root_output = handle:read("*a")
        handle:close()
        -- Extract the path, removing any trailing newline.
        project_root = git_root_output:match("^(.*)\n$")
        if project_root and project_root ~= "" then
            search_dir = project_root -- If a Git root is found, search from there.
        end
    end

    -- Construct the command to find PHP files.
    local cmd_parts = {}

    -- Use find to find files by name.
    table.insert(cmd_parts, "find -L")
    table.insert(cmd_parts, vim.fn.shellescape(search_dir))
    table.insert(cmd_parts, "-iname")
    table.insert(cmd_parts, vim.fn.shellescape(filename))

    local cmd = table.concat(cmd_parts, " ")

-- Execute the search command synchronously.
    local raw_paths = vim.fn.systemlist(cmd)
    local paths = {}
    for _, line in ipairs(raw_paths) do
        local path = line:gsub("^%s*(.-)%s*$", "%1") -- Trim leading/trailing whitespace.
        --
        -- Remove the project root from the path if it exists.
        if project_root and path:sub(1, #project_root) == project_root then
            path = path:sub(#project_root + 2) -- +2 to skip the trailing slash.
        end

        if path ~= "" then
            table.insert(paths, path)
        end
    end

    if #paths == 0 then
        print("Neovim PHP Use: No files found for '" .. filename .. "'.")
        return
    end

    table.sort(paths) -- Sort paths alphabetically for consistent selection order.

    -- Present the list of found paths to the user for selection.
    -- For synchronous behavior, we need a blocking select, or a mechanism
    -- to wait for the UI selection. As 'vim.ui.select' is inherently asynchronous,
    -- we simulate synchronous behavior by only executing the callback logic
    -- when `selected_path` is available. The user will be blocked by the `vim.ui.select`
    -- prompt until a selection is made or cancelled.
    vim.ui.select(paths, {
        prompt = "Neovim PHP Use: Select PHP file to import:",
    }, function(selected_path)
        if not selected_path then
            print("\nNeovim PHP Use: Selection cancelled.")
            return -- User cancelled the selection.
        end

        local use_statement = selected_path

        -- Remove the project root from the path if it exists.
        if project_root and selected_path:sub(1, #project_root) == project_root then
            use_statement = selected_path:sub(#project_root + 2) -- +2 to skip the trailing slash.
        end

        -- Remove Spryker specific stuff with gsub. Just hardcode that shit 
        use_statement = use_statement:gsub("^vendor/spryker/.*/src/", "")
        use_statement = use_statement:gsub("^src/", "")

        -- Shopware specific Stuff too :-)
        -- Assume we just symlinked vendor in whatever git root we are in - because why not
        use_statement = use_statement:gsub("^vendor/shopware/core", "Shopware/Core")
        use_statement = use_statement:gsub("^vendor/shopware/storefront", "Shopware/Storefront")

        -- Replace forward slashes with backslashes to form a PHP namespace.
        use_statement = use_statement:gsub("/", "\\")

        -- Get rid of trailing ".php"
        use_statement = use_statement:gsub(".php$", "")

        -- Get current buffer content to determine the optimal insertion point.
        local current_buf = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)
        local insert_at_line = 0 -- Default to top of file.
        local last_use_line = -1
        local namespace_line = -1
        local php_tag_line = -1

        -- Scan the file lines to find relevant markers.
        for i, line in ipairs(lines) do
            if line:match("^%s*<[%?]php") then
                php_tag_line = i
            elseif line:match("^%s*namespace%s+") then
                namespace_line = i
            elseif line:match("^%s*use%s+") then
                last_use_line = i - 1
            end
        end

        -- Determine the final insertion line based on the markers found.
        if last_use_line ~= -1 then
            insert_at_line = last_use_line + 1 -- Insert after the last 'use' statement.
        elseif namespace_line ~= -1 then
            insert_at_line = namespace_line + 1 -- Insert after the 'namespace' declaration.
        elseif php_tag_line ~= -1 then
            insert_at_line = php_tag_line + 1 -- Insert after the '<?php' tag.
        end
        -- If none found, insert_at_line remains 0 (top of file).

        local final_statement = "use " .. use_statement .. ";"
        local lines_to_insert = {final_statement}

        -- Add blank lines for better formatting and readability.

        -- Add a blank line before the 'use' statement if inserting after 'namespace'
        -- and no other 'use' statements already exist.
        if namespace_line ~= -1 and last_use_line == -1 then
            table.insert(lines_to_insert, 1, "")
        end

        -- If inserting at the very top (line 0) and the file is not empty,
        -- add a blank line after the new 'use' statement for separation.
        if insert_at_line == 0 and #lines > 0 then
            table.insert(lines_to_insert, "")
        end

        -- If the line *after* the insertion point (which will be pushed down by our insert)
        -- is not empty and not another 'use' statement, add a blank line after our new statement.
        -- This ensures separation from class/interface/trait declarations or other code blocks.
        local line_after_insertion_content = lines[insert_at_line]
        if line_after_insertion_content and not line_after_insertion_content:match("^%s*$") and not line_after_insertion_content:match("^%s*use%s+") then
            table.insert(lines_to_insert, "")
        end

        -- Insert the new line(s) into the buffer at the determined position.
        vim.api.nvim_buf_set_lines(current_buf, insert_at_line, insert_at_line, false, lines_to_insert)
    end)
end

return M
