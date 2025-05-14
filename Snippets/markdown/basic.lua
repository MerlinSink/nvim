local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local l = extras.lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{ trig = "fc", snippetType = "autosnippet" },
		fmt("```{}\n{}\n```", {
			i(1, "language"),
			i(2, "code here"),
		})
	),

	s(
		{ trig = "ig", snippetType = "autosnippet" },
		fmt("![{}]({})", {
			i(1, "alt text"),
			i(2, "url or path"),
		})
	),

	s(
		{ trig = "lk", snippetType = "autosnippet" },
		fmt("[{}]({})", {
			i(1, "text"),
			i(2, "url"),
		})
	),
}
