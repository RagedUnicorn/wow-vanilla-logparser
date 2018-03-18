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
mod.eventManager = me

me.tag = "EventManager"

--[[
  {
    ["eventType"] = {
      identifier, {number}
      handler {table}
    }
  }
]]--
local callbacks = {}

--[[
  @param {function} handler
  @param {string} evenType
  @return {number}
    The generated identifier. Should be saved by the caller for later unregistering
    of the handler
]]--
function me.RegisterCallbackHandler(handler, eventType)
  assert(type(handler) == "function",
    string.format("bad argument #1 to `RegisterCallbackHandler` (expected function got %s)", type(handler)))

  assert(type(eventType) == "string",
    string.format("bad argument #2 to `RegisterCallbackHandler` (expected string got %s)", type(eventType)))

  local callback

  callback = {
    ["identifier"] = math.floor(math.random() * 100000),
    ["handler"] = handler
  }

  if not callbacks[eventType] then
    callbacks[eventType] = {}
  end

  table.insert(callbacks[eventType], callback)
  mod.logger.LogInfo(me.tag, "Registered new callback for type: " .. eventType)

  return callback.identifier
end

--[[
  Unregistering a callback by its numeric identifier

  @param {number} identifier
]]--
function me.UnregisterCallbackHandler(identifier)
  local state = 0

  for eventType, _ in pairs(callbacks) do
    for i = 1, table.getn(callbacks[eventType]) do
      if callbacks[eventType][i].identifier == identifier then
        mod.logger.LogInfo(me.tag, "Found matching identifier unregistering callback with type: "
          .. eventType)
        table.remove(callbacks[eventType], i)
        state = 1
        return
      end
    end
  end

  if state == 0 then
    mod.logger.LogWarn(me.tag, "Failed to unregister callback with identifier " .. identifier)
  end
end

--[[
  Work through all the callbacks and see whether there is a registered callback
  for the detected eventType

  @param {number} status
    1 - msg was successfully parsed
    0 - unable to parse msg
  @param {table} spellData
]]--
function me.DispatchEvent(status, spellData)
  if not callbacks[spellData.type] then
    mod.logger.LogDebug(me.tag, "No callbacks registered for type: " .. spellData.type)
    return
  end

  -- call all registered callbacks
  for key, callback in pairs(callbacks[spellData.type]) do
    callback.handler(status, spellData)
  end
end
