hs.hotkey.bind({"alt"}, "space", function()
  local alacritty = hs.application.get('Alacritty')
  if (alacritty ~= nil and alacritty:isFrontmost()) then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
