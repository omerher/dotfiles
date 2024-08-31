-- NOTE: make sure to add trailing spaces to make line lengths equal
local logo = [[
  ___     ___    ___   __  __ /\_\    ___ ___    
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
]]

logo = string.rep("\n", 4) .. logo .. "\n\n"

local version = vim.version()

local center = {
  {
    desc = "Find File ",
    key = "f",
    icon = " ",
    action = "lua LazyVim.pick()()",
    group = "@markup.heading.1.markdown",
  },
  {
    desc = " Find Text ",
    key = "r",
    icon = " ",
    action = 'lua LazyVim.pick("live_grep")()',
    group = "@markup.heading.2.markdown",
  },
  {
    desc = "New File ",
    key = "n",
    icon = " ",
    action = "ene | startinsert",
    group = "@markup.heading.3.markdown",
  },
  {
    desc = "Recent Sessions ",
    key = "s",
    icon = " ",
    action = "SessionSearch",
    group = "@markup.heading.4.markdown",
  },
}

local footer = {
  "",
  "nvim version " .. version.major .. "." .. version.minor,
}

return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.theme = "hyper"
      opts.config.header = vim.split(logo, "\n")
      opts.config.shortcut = center
      opts.config.footer = footer
      opts.config.packages = { enabled = false }
    end,
  },
}
