# get width of display
# see http://daringfireball.net/2006/12/display_size_applescript_the_lazy_way
# note: won't work with multiple monitors, so just remove & set manually, i.e.
# 		"set display_x_size to 1280"
tell application "Finder"
	set _b to bounds of window of desktop
	set display_x_size to item 3 of _b
end tell

set cur_app to name of (info for (path to frontmost application))

tell application cur_app
	tell front window
		set {x1, y1, x2, y2} to (get bounds)
		set win_width to (x2 - x1)
		set room_right to (display_x_size - x2)
		if room_right > win_width then
			set x1 to (x1 + win_width)
			set x2 to (x2 + win_width)
		else
			set x2 to display_x_size
			set x1 to (display_x_size - win_width)
		end if
		
		# stupid hack for 10.5/10.6 Terminal.app
		# see http://openradar.appspot.com/5765608
		if cur_app = "Terminal.app" then
			set win_height to (y2 - y1)
			set y1 to (y1 + win_height)
			set y2 to (y2 + win_height)
		end if
		
		set bounds to {x1, y1, x2, y2}
		
	end tell
end tell
