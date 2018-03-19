--[[
  LogParser - A WoW 1.12.1 Addon to alert the player of pvp events
  Copyright (C) 2017 Michael Wiesendanger <michael.wiesendanger@gmail.com>

  This file is part of LogParser.

  LogParser is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  LogParser is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with LogParser.  If not, see <http://www.gnu.org/licenses/>.
]]--

local mod = lp
local me = {}
mod.debug = me

me.tag = "Debug"

-- store an identifier for a registered event
local identifier = nil

-- global
local _G = getfenv(0)

local function callback()
  mod.logger.LogDebug(me.tag, "Debug callback was called")
end

function _G.__LP__DEBUG_RegisterCallback()
  identifier = lp.eventManager.RegisterCallbackHandler(
    callback,
    "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
  )
end

function _G.__LP__DEBUG_UnregisterCallback()
  if identifier == nil then
    mod.logger.LogError(me.tag, "Failed to unregister callback. Make sure to call RegisterCallback first")
  else
    lp.eventManager.UnregisterCallbackHandler(identifier)
  end
end
