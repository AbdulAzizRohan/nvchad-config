local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", { -- Ensure the filetype is "tex"
  s("beg", {
    t({ "\\begin{" }), i(1, "environment"), t({ "}", "" }),
    t({ "  " }), i(0),
    t({ "", "\\end{" }), i(1), t({ "}" }),
  }),
})
