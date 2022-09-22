local M = {}

M.ui = {
  theme = "nightfox",
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.options = require "custom.options"

return M
