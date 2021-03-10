return function()
  local gl = require("galaxyline")
  local gls = gl.section
  gl.short_line_list = { "NvimTree", "dbui" }

  local colors = {
    bg = "#49464e",
    yellow = "#fabd2f",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#608B4E",
    orange = "#FF8800",
    purple = "#5d4d7a",
    magenta = "#d16d9e",
    grey = "#c0c0c0",
    blue = "#569CD6",
    red = "#D16969",
    black = "#000000"
  }

  local space = {
    Space = {
      provider = function()
        return " "
      end
    }
  }

  local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
      return true
    end
    return false
  end

  local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
      return true
    end
    return false
  end

  gls.left[2] = {
    ViMode = {
      provider = function()
        local mode_color = {
          n = colors.purple,
          i = colors.green,
          v = colors.blue,
          [''] = colors.blue,
          V = colors.blue,
          c = colors.purple,
          no = colors.magenta,
          s = colors.purple,
          S = colors.purple,
          [''] = colors.purple,
          ic = colors.yellow,
          R = colors.red,
          Rv = colors.red,
          cv = colors.red,
          ce=colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!']  = colors.red,
          t = colors.red
        }

        vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
        local alias = { n = 'NORMAL', i = 'INSERT', c= 'COMMAND', v = 'VISUAL', V= 'VISUAL',  [''] = 'VISUAL' }
        if alias[vim.fn.mode()] == nil then
          return "  :) "
        end
        return "  " .. alias[vim.fn.mode()] .. " "
      end,
      separator = ' ',
      separator_highlight = {colors.yellow,function()
        if not buffer_not_empty() then
          return colors.bg
        end
        return colors.bg
      end},
      highlight = { colors.grey, colors.bg, 'bold' },
    },
  }

  gls.left[3] = {
    GitIcon = {
      provider = function()
        return " "
      end,
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      highlight = { colors.orange, colors.bg }
    }
  }

  gls.left[4] = {
    GitBranch = {
      provider = "GitBranch",
      separator = " ",
      separator_highlight = { colors.purple, colors.bg },
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      highlight = { colors.grey, colors.bg }
    }
  }

  gls.left[5] ={
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
  }

  gls.left[6] = {
    FileName = {
      provider = 'FileName',
      condition = buffer_not_empty,
      separator = ' ',
      separator_highlight = { colors.purple, colors.bg },
      highlight = { colors.grey, colors.bg }
    }
  }

  gls.left[7] = {
    LeftEnd = {
      provider = function() return ' ' end,
      separator = ' ',
      separator_highlight = {colors.purple,colors.bg},
      highlight = {colors.purple,colors.bg}
    }
  }

  gls.right[1]= {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red,colors.bg}
    }
  }
  gls.right[2] = {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.yellow,colors.bg},
    }
  }
  gls.right[3] = {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '   ',
      highlight = {colors.blue,colors.bg},
    }
  }
  gls.right[4] = {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '   ',
      highlight = {colors.orange,colors.bg},
    }
  }
  gls.right[5]= {
    FileFormat = {
      provider = 'FileFormat',
      separator = ' | ',
      separator_highlight = { colors.bg, colors.bg },
      highlight = { colors.grey, colors.bg },
    }
  }
  gls.right[6] = {
    LineInfo = {
      provider = 'LineColumn',
      separator = ' | ',
      separator_highlight = { colors.black, colors.bg },
      highlight = { colors.grey, colors.bg },
    },
  }
  gls.right[7] = {
    PerCent = {
      provider = 'LinePercent',
      separator = ' |',
      separator_highlight = { colors.black, colors.bg },
      highlight = { colors.grey, colors.bg },
    }
  }

  gls.short_line_left[1] = {
    LeftEnd = {
      provider = function() return ' ' end,
      separator = ' ',
      separator_highlight = { colors.purple, colors.bg },
      highlight = { colors.purple, colors.bg }
    }
  }
end
