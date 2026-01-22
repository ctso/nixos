-- Hammerspoon configuration

local hyper = { "shift", "cmd", "alt", "ctrl" }

-- Load SpoonInstall
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

-- Register PaperWM custom repository
spoon.SpoonInstall.repos.PaperWM = {
	url = "https://github.com/mogenson/PaperWM.spoon",
	desc = "PaperWM.spoon repository",
	branch = "release",
}

-- Install and configure PaperWM using SpoonInstall's andUse method
spoon.SpoonInstall:andUse("PaperWM", {
	repo = "PaperWM",
	config = {
		window_ratios = { 1 / 3, 1 / 2, 2 / 3, 1 },
		drag_window = { "shift", "ctrl", "alt" },
		lift_window = { "ctrl", "alt" },
	},
	hotkeys = {
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
		reverse_cycle_width = { hyper, "e" },

		-- Add/remove column
		slurp_in = { { "alt" }, "i" },
		barf_out = { { "alt" }, "o" },

		-- Refresh window layout
		refresh_windows = { { "alt" }, "r" },
	},
	start = true,
})
