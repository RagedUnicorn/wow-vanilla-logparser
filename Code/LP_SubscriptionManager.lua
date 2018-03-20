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
mod.subscriptionManager = me

me.tag = "SubscriptionManager"

--[[
  {
    ["eventType"] = {
      identifier, {number}
      handler {table}
    }
  }
]]--
local subscriptions = {}

--[[
  @return {table}
]]--
function me.GetSubscriptions()
  return subscriptions
end

--[[
  Subscribe a callback to a specific event

  @param {function} callback
  @param {string} evenType
  @return {number}
    The generated identifier. Should be saved by the caller for later unregistering
    of the callback
]]--
function me.SubscribeEvent(callback, eventType)
  assert(type(callback) == "function",
    string.format("bad argument #1 to `SubscribeEvent` (expected function got %s)", type(callback)))

  assert(type(eventType) == "string",
    string.format("bad argument #2 to `SubscribeEvent` (expected string got %s)", type(eventType)))

  local subscription

  subscription = {
    ["identifier"] = math.floor(math.random() * 100000),
    ["callback"] = callback
  }

  if not subscriptions[eventType] then
    subscriptions[eventType] = {}
  end

  table.insert(subscriptions[eventType], subscription)
  mod.logger.LogInfo(me.tag, "Registered new subscription for type: " .. eventType)
  mod.eventManager.RegisterEvent(eventType) -- register event on mainframe

  return subscription.identifier
end

--[[
  Unregistering a subscription by its numeric identifier

  @param {number} identifier
]]--
function me.UnsubscribeEvent(identifier)
  local state = 0

  for eventType, _ in pairs(subscriptions) do
    for i = 1, table.getn(subscriptions[eventType]) do
      if subscriptions[eventType][i].identifier == identifier then
        mod.logger.LogInfo(me.tag, "Found matching identifier unregistering subscription with type: "
          .. eventType)
        table.remove(subscriptions[eventType], i)

        -- check if event should be unregistered
        if mod.eventManager.ShouldUnregisterEvent(eventType) then
          mod.eventManager.UnregisterEvent(eventType)
        end

        state = 1
        return
      end
    end
  end

  if state == 0 then
    mod.logger.LogWarn(me.tag, "Failed to unregister subscription with identifier " .. identifier)
  end
end

--[[
  Work through all the subscriptions and see whether there is a registered callback
  for the detected eventType

  @param {number} status
    1 - msg was successfully parsed
    0 - unable to parse msg
  @param {table} spellData
]]--
function me.DispatchEvent(status, spellData)
  if not subscriptions[spellData.type] then
    mod.logger.LogDebug(me.tag, "No subscriptions registered for type: " .. spellData.type)
    return
  end

  -- call all registered subscriptions
  for key, subscription in pairs(subscriptions[spellData.type]) do
    subscription.callback(status, spellData)
  end
end
