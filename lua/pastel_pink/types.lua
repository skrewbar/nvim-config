---@class pastel_pink.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias pastel_pink.Highlights table<string,pastel_pink.Highlight|string>

---@alias pastel_pink.HighlightsFn fun(colors: ColorScheme, opts:pastel_pink.Config):pastel_pink.Highlights

---@class pastel_pink.Cache
---@field groups pastel_pink.Highlights
---@field inputs table
