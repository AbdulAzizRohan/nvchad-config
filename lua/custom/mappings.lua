local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start of continue the debugger",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "upate crates"
    }
  }
}

M.vimtex = {
  n = {
    ["<leader>ll"] = { "<cmd>VimtexCompile<CR>", "Compile LaTeX document" },
    ["<leader>lv"] = { "<cmd>VimtexView<CR>", "View PDF" },
    ["<leader>lc"] = { "<cmd>VimtexClean<CR>", "Clean auxiliary files" },
    ["<leader>lt"] = { "<cmd>VimtexTocToggle<CR>", "Toggle table of contents" },
  }
}

return M
