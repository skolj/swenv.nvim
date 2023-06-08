local M = require('lualine.component'):extend()

local default_opts = {
  icon = require("nvim-web-devicons").get_icon_by_filetype("python"),
  color = { fg = "#FFD43B" },
}

function M:init(options)
  options = vim.tbl_deep_extend("keep", options or {}, default_opts)
  M.super.init(self, options)
end

function M:update_status()
  if vim.bo.filetype ~= "python" then
    return
  end

  local venv = require('swenv.api').get_current_venv()
  if venv then
    return venv.name
  else
    return ''
  end
end

return M
