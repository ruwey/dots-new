local naughty = require("naughty")

helpers = {}

-- Return progress bar
helpers.progress = function(percent, total)
	full = math.floor(((total * percent)/100 + 0.5) / 1)
	empty = total - full

	bar = ""
	for i = 1, full do
		bar = bar .. '▉'
	end

	for i = 1, empty do
		bar = bar .. '-'
	end

	return bar
end

-- Auto-Updating Notifications from: 
-- https://github.com/elenapan/dotfiles/blob/master/config/awesome/notifications/init.lua
function helpers.notify(args, notif)
    local n = notif
    if n and not n._private.is_destroyed and not n.is_expired then
        notif.title = args.title or notif.title
        notif.message = args.message or notif.message
        -- notif.text = args.text or notif.text
        notif.icon = args.icon or notif.icon
        notif.timeout = args.timeout or notif.timeout
    else
        n = naughty.notification(args)
    end
    return n
end

return helpers
