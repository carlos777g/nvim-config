-- LaTeX configuration for Neovim
local M = {}

-- Load LaTeX highlights configuration
require("config.latex-highlights")

-- Setup autocmd for tex files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function(event)
    local bufnr = event.buf

    -- Enable syntax highlighting for LaTeX
    vim.cmd("syntax on")
    vim.cmd("set syntax=tex")

    -- Try to enable Treesitter highlighting for LaTeX
    local ok, ts = pcall(require, "vim.treesitter")
    if ok then
      pcall(function()
        ts.start(bufnr, "latex")
      end)
    end

    -- Set some nice options for LaTeX
    vim.opt_local.conceallevel = 0
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en,es"
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 0

    -- Make sure VimTeX highlighting is active
    if vim.g.vimtex then
      vim.cmd("set ft=tex")
    end

    -- Create toggle for concealing
    vim.keymap.set("n", "<leader>tc", function()
      local level = vim.wo.conceallevel
      vim.wo.conceallevel = (level == 0) and 2 or 0
      vim.notify("Conceal level: " .. vim.wo.conceallevel, vim.log.levels.INFO)
    end, { buffer = bufnr, desc = "Toggle LaTeX concealing" })

    -- Build on F9
    vim.keymap.set("n", "<F9>", function()
      vim.cmd("VimtexCompile")
    end, { buffer = bufnr, desc = "Compile LaTeX" })

    -- View compiled PDF
    vim.keymap.set("n", "<F10>", function()
      vim.cmd("VimtexView")
    end, { buffer = bufnr, desc = "View LaTeX PDF" })
  end,
})

return M
