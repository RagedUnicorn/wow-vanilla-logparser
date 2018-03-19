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
mod.eventHandler = me

me.tag = "EventHandler"

local supportedEvents = {
  "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
  "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
  "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
  "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
  "CHAT_MSG_SPELL_AURA_GONE_OTHER",
  "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF",
  "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS",
  "CHAT_MSG_SPELL_SELF_DAMAGE",
  "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
}

--[[
  @param {string} msg
  @param {string} event
]]--
function me.HandleEvent(msg, event)
  local status, spellData = mod.parser.ParseCombatText(msg, event)

  mod.eventManager.DispatchEvent(status, spellData)
end

--[[
  Register a new event. A event can only be registered once on a frame. Because of
  this we don't need to check whether an event is already registered.

  @param {string} eventType
]]--
function me.RegisterEvent(eventType)
  local mainFrame = getglobal(LP_CONSTANTS.ELEMENT_LP_MAIN_FRAME)

  if me.IsEventSupported(eventType) then
    mainFrame:RegisterEvent(eventType)
    mod.logger.LogDebug(me.tag, "Registered event - " .. eventType .. " - ")
  else
    mod.logger.LogError(me.tag, "Event - " .. eventType .. " - is not supported")
  end
end

--[[
  Unregister an event

  @param {string} eventType
]]--
function me.UnregisterEvent(eventType)
  local mainFrame = getglobal(LP_CONSTANTS.ELEMENT_LP_MAIN_FRAME)

  mainFrame:UnregisterEvent(eventType)
  mod.logger.LogDebug(me.tag, "Unregistered event - " .. eventType .. " - ")
end

--[[
  Check whether there is at least one Addon registered to a certain event. Only if
  no Addon is registered to the event it should be unregistered.

  @param {string} eventType
  @return {boolean}
    true if the event should be unregistered because no callback is active
    false if the event should not be unregistered because there is at least one callback
    active
]]--
function me.ShouldUnregisterEvent(eventType)
  local callbacks = mod.eventManager.GetCallbacks()
  local registeredCallbacks = callbacks[eventType]

  if registeredCallbacks == nil or table.getn(registeredCallbacks) == 0 then
    mod.logger.LogDebug(me.tag, "No active callbacks found event can be unregistered")
    return true
  end

  return false
end

--[[
  @param {string} eventType
  @return {boolean}
    true if the event is supported
    false if the event is not supported
]]--
function me.IsEventSupported(eventType)
  for i = 1, table.getn(supportedEvents) do
    if supportedEvents[i] == eventType  then
      return true
    end
  end

  return false
end
