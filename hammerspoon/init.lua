-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

function openWebBrowser(address)
	news = "app = Application.currentApplication(); app.includeStandardAdditions = true; app.doShellScript('open " .. address .. "')"
	hs.osascript.javascript(news)
end

k:bind('', 'c', nil, 
	function()
		openWebBrowser('https://calendar.google.com/calendar/')
		k.triggered = true
	end
	)


k:bind('', 'a', nil, 
	function()
		hs.application.launchOrFocus("Android Studio")
		k.triggered = true
	end
	)


-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
	k.triggered = false
	k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
	k:exit()
	if not k.triggered then
		hs.eventtap.keyStroke({}, 'ESCAPE')
	end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

