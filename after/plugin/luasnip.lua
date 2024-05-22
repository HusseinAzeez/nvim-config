local ls = require "luasnip"
local types = require "luasnip.util.types"

local s = ls.snippet
local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets("lua", {
    s({
            trig = "meta",
            namr = "Metadata",
            dscr = "Yaml metadata format for markdown"
        },
        {
            t({ "---",
                "title: " }), i(1, "note_title"), t({ "",
            "author: " }), i(2, "author"), t({ "",
            "date: " }), f(date, {}), t({ "",
            "categories: [" }), i(3, ""), t({ "]",
            "lastmod: " }), f(date, {}), t({ "",
            "tags: [" }), i(4), t({ "]",
            "comments: true",
            "---", "" }),
            i(0)
        }),
})

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes.
vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
