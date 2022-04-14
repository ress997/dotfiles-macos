local wezterm = require 'wezterm';

return {
	font = wezterm.font("HackGenNerd Console"),
	use_ime = true,
	font_size = 16.0,
	color_scheme = "iceberg-dark",
	hide_tab_bar_if_only_one_tab = true,
	-- フォントサイズ変更時にウィンドウサイズも変更されないようにする
	adjust_window_size_when_changing_font_size = false,
}
