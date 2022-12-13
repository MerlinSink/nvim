local function CodeRunner()
    --[===[========================== Static ===========================]===]

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "c",
        callback = function()
            -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F3>",
                "<ESC>:w<CR>:split<CR>:te gcc -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
                { silent = true, noremap = true }
            )
            -- vim.api.nvim_buf_set_keymap(
            --     0,
            --     "n",
            --     "<F8>",
            --     "<ESC>:w<CR>:split<CR>:te clang -std=c11 -Wshadow -Wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>i",
            --     { silent = true, noremap = true }
            -- )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F2>",
                "<ESC>:w<CR>:split<CR>:te gcc -o %:t:r.out % -g <CR> && :q<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cpp",
        callback = function()
            -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F3>",
                "<ESC>:w<CR>:split<CR>:te g++ -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
                { silent = true, noremap = true }
            )
            -- vim.api.nvim_buf_set_keymap(
            --     0,
            --     "n",
            --     "<F8>",
            --     "<ESC>:w<CR>:split<CR>:te clang++ -std=c++20 -Wshadow -Wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>i",
            --     { silent = true, noremap = true }
            -- )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F2>",
                "<ESC>:w<CR>:split<CR>:te g++ -o %:t:r.out % -g <CR> && :q<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    --[===[=========================== Script ==========================]===]

    -- vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "python",
    --     callback = function()
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F7>",
    --             ":w<CR>:split<CR>:te time /opt/homebrew/Caskroom/miniforge/base/envs/tf26/bin/python3 %<CR>i",
    --             { silent = true, noremap = true }
    --         )
    --     end,
    -- })
    --
    -- vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "lua",
    --     callback = function()
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F7>",
    --             ":w<CR>:split<CR>:te lua %<CR>i",
    --             { silent = true, noremap = true }
    --         )
    --     end,
    -- })
    --
    -- vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "make",
    --     callback = function()
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F7>",
    --             "<ESC>:w<CR>:split<CR>:te make <CR>i",
    --             { silent = true, noremap = true }
    --         )
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F8>",
    --             "<ESC>:w<CR>:split<CR>:te make clean<CR>i",
    --             { silent = true, noremap = true }
    --         )
    --     end,
    -- })
    -- vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "cmake",
    --     callback = function()
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F7>",
    --             "<ESC>:w<CR>:split<CR>:te cmake <CR>i",
    --             { silent = true, noremap = true }
    --         )
    --     end,
    -- })
    --
    -- vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "shell",
    --     callback = function()
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F7>",
    --             "<ESC>:w<CR>:split<CR>:te bash %<CR>i",
    --             { silent = true, noremap = true }
    --         )
    --     end,
    -- })

    --[===[==================== TypeWritting ===================]===]--

    -- vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "tex",
    --     callback = function()
    --         vim.api.nvim_buf_set_keymap(
    --             0,
    --             "n",
    --             "<F7>",
    --             "<ESC>:w<CR>:split<CR>:te latexmk %<CR>i",
    --             { silent = true, noremap = true }
    --         )
    --         vim.fn.writefile(
    --             {vim.fn.execute(":echo v:servername", "silent")}, 
    --             "/tmp/vimtexserver.txt")
    --     end,
    -- })
    --
end
CodeRunner()
