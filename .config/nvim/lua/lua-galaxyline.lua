local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {" "} -- keeping this table { } as empty will show inactive statuslines

local colors = {
    main = "#9783b1",
    bg = "NONE",
    bg_alt = "#342942",
    fg = "#9783b1",
    commented = "#503f65",
    green = "#98c379",
    orange = "#d19a66",
    blue = "#61afef",
    red = "#e06c75",
    white = "#abb2bf"
}

local mode_map = {
    n = {"  NORMAL ", colors.main},
    i = {"  INSERT ", colors.blue},
    c = {"  COMMAND ", colors.main},
    V = {"  VISUAL ", colors.green},
    [""] = {"  VISUAL ", colors.green},
    v = {"  VISUAL ", colors.green},
    R = {"  REPLACE ", colors.green}
}

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or colors.main end

local function highlight1(group, fg, gui)
    local cmd = string.format('highlight %s guifg=%s', group, fg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end

local function highlight2(group, bg, fg, gui)
    local cmd = string.format('highlight %s guibg=%s guifg=%s', group, bg, fg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end


gls.left[1] = {
    leftRounded = {
        provider = function()
            return ""
        end,
        highlight = 'GalaxyViModeInv'
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            --local modehl = mode_hl()
            highlight2('GalaxyViMode', mode_hl(), colors.bg_alt, 'bold')
            highlight1('GalaxyViModeInv', mode_hl(), 'bold')
            return string.format(' %s', mode_label())
        end,
        separator = "",
        separator_highlight = 'GalaxyViMode', colors.bg_alt
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg_alt}
    }
}

gls.left[4] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.bg_alt}
    }
}

gls.left[5] = {
    teech = {
        provider = function()
            return ""
        end,
        separator = "",
        highlight = {colors.bg_alt, colors.bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.green, colors.bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.red, colors.bg}
    }
}

gls.left[9] = {
    LeftEnd = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.bg, colors.bg}
    }
}

gls.left[10] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.bg}
    }
}

gls.left[11] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.bg, colors.bg}
    }
}

gls.left[12] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return "  "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.bg}
    }
}

gls.right[3] = {
    right_LeftRounded = {
        provider = function()
            return "  "
        end,
        highlight = {colors.bg_alt, colors.bg}
    }
}

gls.right[4] = {
    LineInfo = {
        provider = "LineColumn",
        separator = "  ",
        separator_highlight = {colors.commented, colors.bg_alt},
        highlight = {colors.main, colors.bg_alt}
    }
}

gls.right[5] = {
    PerCent = {
        provider = "LinePercent",
        separator = "  ",
        separator_highlight = {colors.commented, colors.bg_alt},
        highlight = {colors.main, colors.bg_alt}
    }
}

gls.right[6] = {
    rightRounded = {
        provider = function()
            return ""
        end,
        highlight = {colors.bg_alt, colors.bg}
    }
}
