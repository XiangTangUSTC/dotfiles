local wezterm = require("wezterm")

-- 正确初始化配置
local config = wezterm.config_builder()

-- 加载 tabline 插件（确保插件已正确安装）
local tabline = wezterm.plugin.require("/Users/tangxiang/.config/wezterm/plugins/tabline.wez")
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- local statusbar = wezterm.plugin.require("/Users/tangxiang/.config/wezterm/plugins/statusbar.wezterm")

tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'Catppuccin Mocha',
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = {},
    tabline_b = {  },
    tabline_c = { 'datetime', 'battery'  },
    tab_active = {
      'index',
      -- { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'cpu','ram'  },
    tabline_y = {  },
    tabline_z = {  },
  },
  extensions = {},
})


-- 基础配置
config.automatically_reload_config = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 13
config.color_scheme = "Nord (Gogh)"
config.default_cursor_style = 'BlinkingBlock'
config.macos_window_background_blur = 25

-- 快捷键配置
config.keys = {
    {key="LeftArrow", mods="CMD|OPT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="CMD|OPT", action=wezterm.action{ActivateTabRelative=1}},
}

-- 背景配置
config.background = {
    {
        source = { Color = "#282c35" },
        width = "100%",
        height = "100%",
        opacity = 0.55,
    }
}

-- 窗口边距
config.window_padding = {
    left = 3,
    right = 3,
    top = 10,
    bottom = 0,
}

-- 初始窗口大小
config.initial_rows = 30
config.initial_cols = 100

-- 应用 tabline 插件（必须在 return 之前！）
tabline.apply_to_config(config)



return config