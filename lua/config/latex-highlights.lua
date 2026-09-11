-- LaTeX specific highlight groups and colors
local M = {}

M.setup = function()
  -- Define LaTeX highlight groups (works with any colorscheme)
  local highlights = {
    -- Commands
    texCmd = { link = "Statement", bold = true },
    texCmdClass = { link = "Type" },
    texCmdDef = { link = "Macro" },
    texCmdInput = { link = "Statement" },
    texCmdRef = { link = "Type" },
    texCmdStyle = { link = "Keyword" },
    texCmdType = { link = "Type" },

    -- Math mode
    texMathDelim = { link = "Delimiter", bold = true },
    texMathEnv = { link = "PreProc" },
    texMathOp = { link = "Operator" },
    texMath = { link = "Number" },

    -- Environments
    texBeginEnd = { link = "Statement", bold = true },
    texBeginEndName = { link = "Type" },
    texEnvArgName = { link = "Constant" },

    -- Grouping
    texDelimiter = { link = "Delimiter" },
    texGroup = { link = "Normal" },

    -- Comments
    texComment = { link = "Comment" },

    -- Special
    texSpecialChar = { link = "SpecialChar" },
    texDefName = { link = "Macro" },
    texLigature = { link = "Constant" },
    texMathText = { link = "String" },

    -- Sections
    texSection = { link = "PreProc", bold = true },

    -- From Treesitter
    ["@keyword.latex"] = { link = "Statement", bold = true },
    ["@function.macro.latex"] = { link = "Macro" },
    ["@punctuation.bracket.latex"] = { link = "Delimiter" },
    ["@markup.heading.latex"] = { link = "Title", bold = true },
  }

  for group, spec in pairs(highlights) do
    if spec.link then
      vim.cmd(string.format("highlight! link %s %s", group, spec.link))
    else
      -- Apply custom highlight (if needed in future)
      local cmd = string.format("highlight %s", group)
      if spec.bold then
        cmd = cmd .. " bold"
      end
      vim.cmd(cmd)
    end
  end
end

-- Apply highlights when entering a LaTeX buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function()
    M.setup()
  end,
})

-- Also apply on ColorScheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Only apply if we're in a LaTeX buffer
    if vim.bo.filetype == "tex" or vim.bo.filetype == "latex" then
      M.setup()
    end
  end,
})

return M
