#!/bin/bash

# Arguments: title message icon timeout mode
# If mode is 'update' it will update an existing notification with the same title
# Example usage: ~/scripts/notify.sh 'Audio Volume' ${vol} ~/scripts/music.jpg 2 update

CWD=$(cd `dirname $0` && pwd)

awesome-client '
  naughty = require("naughty")

  local cwd = "'"$CWD"'"
  local title = "'"$1"'"
  local message = "'"$2"'"

  local icon = "'"$3"'"

  if string.find(icon, "^/") or string.find(icon, "^~") then
    icon = "'$(realpath "$3")'"
  else
    icon = cwd.."/"..icon
  end

  local timeout = tonumber("'"$4"'")
  local mode = "'"$5"'"

  if mode == "update" then
    for k, n in ipairs(naughty.active) do
      if n.title == title then
        -- naughty.destroy(n, "aaa")
        n.text = message
        return
      end
    end
  end

  naughty.notify({
    title = title, 
    text = message, 
    icon = icon, 
    timeout = timeout
  })
'