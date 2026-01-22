-- Hammerspoon configuration

local hyper = { "shift", "cmd", "alt", "ctrl" }

-- Load SpoonInstall
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

-- Install PaperWM from GitHub archive if not already installed
local paperwm_path = hs.spoons.resourcePath("PaperWM")
if not paperwm_path then
	spoon.SpoonInstall:installSpoonFromZipURL("https://github.com/mogenson/PaperWM.spoon/archive/refs/heads/main.zip")
	-- Rename the extracted folder to match expected Spoon name
	local spoons_dir = os.getenv("HOME") .. "/.hammerspoon/Spoons"
	os.rename(spoons_dir .. "/PaperWM.spoon-main", spoons_dir .. "/PaperWM.spoon")
end

-- Load and configure PaperWM
PaperWM = hs.loadSpoon("PaperWM")
PaperWM.window_filter:setScreens({ "DELL U4025QW" })
PaperWM.window_ratios = { 1 / 3, 1 / 2, 2 / 3, 1 }
PaperWM.drag_window = { "shift", "ctrl", "alt" }
PaperWM.lift_window = { "ctrl", "alt" }
PaperWM:bindHotkeys({
	-- Switch to left/right/up/down window
	focus_left = { hyper, "h" },
	focus_right = { hyper, "l" },
	focus_up = { hyper, "k" },
	focus_down = { hyper, "j" },

	-- Move current window to left/right/up/down
	swap_left = { { "alt", "shift" }, "h" },
	swap_right = { { "alt", "shift" }, "l" },
	swap_up = { { "alt", "shift" }, "k" },
	swap_down = { { "alt", "shift" }, "j" },

	center_window = { hyper, "c" },
	toggle_floating = { hyper, "f" },

	switch_space_1 = { hyper, "1" },
	switch_space_2 = { hyper, "2" },
	switch_space_3 = { hyper, "3" },
	move_window_1 = { { "alt", "shift" }, "1" },
	move_window_2 = { { "alt", "shift" }, "2" },
	move_window_3 = { { "alt", "shift" }, "3" },

	increase_width = { hyper, "=" },
	decrease_width = { hyper, "-" },

	cycle_width = { hyper, "r" },

	-- Add/remove column
	slurp_in = { { "alt" }, "i" },
	barf_out = { { "alt" }, "o" },

	-- Refresh window layout
	refresh_windows = { { "alt" }, "r" },
})
PaperWM:start()
