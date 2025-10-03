local i = require("neogen.types.template").item

local sfml_style = {
  {
    nil,
    "/////////////////////////////////////////////////",
    { no_results = true, type = { "func", "file", "class" } },
  },
  { nil, "/// @file", { no_results = true, type = { "file" } } },
  { nil, "/// @brief $1", { no_results = true, type = { "func", "file", "class" } } },
  {
    nil,
    "/////////////////////////////////////////////////",
    { no_results = true, type = { "func", "file", "class" } },
  },
  { nil, "", { no_results = true, type = { "file" } } },

  { nil, "/////////////////////////////////////////////////", { type = { "func", "class", "type" } } },
  { i.ClassName, "/// @class %s", { type = { "class" } } },
  { i.Type, "/// @typedef %s", { type = { "type" } } },
  { nil, "/// @brief $1", { type = { "func", "class", "type" } } },
  { nil, "///", { type = { "func", "class", "type" } } },
  { i.Tparam, "/// @tparam %s $1" },
  { i.Parameter, "/// @param %s $1" },
  { i.Return, "/// @return $1" },
  { nil, "/////////////////////////////////////////////////", { type = { "func", "class", "type" } } },
}
return {
  "danymat/neogen",
  opts = {
    languages = {
      cpp = { template = {
        annotation_convention = "sfml_style",
        sfml_style = sfml_style,
      } },
    },
  },
  keys = {
    -- adds a line break
    {
      "<leader>cb",
      function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

        -- Insert "///" above the current line
        vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "/////////////////////////////////////////////////" })

        -- Check the line above the newly inserted "///"
        -- if row >= 2 then
        --   local line_above = lines[row - 2]
        --   if line_above:match("^%s*$") == nil then
        --     -- Insert a blank line if the line is not empty
        --     vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "" })
        --   end
        -- end
      end,
      desc = "Add line break",
    },
    -- adds a block with preprocess directives (line break - /// Prepocessor Directives - line break)
    {
      "<leader>cp",
      function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        -- Insert "///" above the current line
        vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "/////////////////////////////////////////////////" })
        vim.api.nvim_buf_set_lines(0, row, row, false, { "/// Preprocessor Directives" })
        vim.api.nvim_buf_set_lines(0, row + 1, row + 1, false, { "/////////////////////////////////////////////////" })
        -- Check the line above the newly inserted "///"
        -- if row >= 2 then
        --   local line_above = lines[row - 2]
        --   if line_above:match("^%s*$") == nil then
        --     -- Insert a blank line if the line is not empty
        --     vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "" })
        --   end
        -- end
      end,
      desc = "Add preprocessor directives block",
    },
    -- adds a block with headers (line break - /// Headers - line break)
    {
      "<leader>ct",
      function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        -- Insert "///" above the current line
        vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "/////////////////////////////////////////////////" })
        vim.api.nvim_buf_set_lines(0, row, row, false, { "/// Headers" })
        vim.api.nvim_buf_set_lines(0, row + 1, row + 1, false, { "/////////////////////////////////////////////////" })
        -- Check the line above the newly inserted "///"
        -- if row >= 2 then
        --   local line_above = lines[row - 2]
        --   if line_above:match("^%s*$") == nil then
        --     -- Insert a blank line if the line is not empty
        --     vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "" })
        --   end
        -- end
      end,
      desc = "Add headers block",
    },
  },
}
