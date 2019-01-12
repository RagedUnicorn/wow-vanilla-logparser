--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local mod = lp
local me = {}
mod.eventManager = me

me.tag = "EventManager"

--[[
  Eventmanager is responsible to manage registering and unregistering to WoW API events.
  Based on the information the Eventmanager gets from the Subscriptionmanager an event
  can be registered because it is newly needed or unregistered because no more subscriptions
  for that event exist.
]]--


--[[
  Events that the logparser supports. Subscriptions that try to subscribe to an
  unsupported event will fail
]]--
local supportedEvents = {
  "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
  "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
  "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
  "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
  "CHAT_MSG_SPELL_AURA_GONE_OTHER",
  "CHAT_MSG_SPELL_SELF_DAMAGE",
  "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",
  "CHAT_MSG_SPELL_FAILED_LOCALPLAYER",
  "CHAT_MSG_COMBAT_HOSTILE_DEATH"
}

--[[
  @param {string} msg
  @param {string} event
]]--
function me.HandleEvent(msg, event)
  local status, spellData = mod.parser.ParseCombatText(msg, event)

  mod.subscriptionManager.DispatchEvent(status, spellData)
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
    mod.logger.LogDebug(me.tag, "Registered event - " .. eventType)
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
  mod.logger.LogDebug(me.tag, "Unregistered event - " .. eventType)
end

--[[
  Check whether there is at least one Addon registered to a certain event. Only if
  no Addon is registered to the event it should be unregistered.

  @param {string} eventType
  @return {boolean}
    true if the event should be unregistered because no subscription is active
    false if the event should not be unregistered because there is at least one subscription
    active
]]--
function me.ShouldUnregisterEvent(eventType)
  local subscriptions = mod.subscriptionManager.GetSubscriptions()
  local eventSubscription = subscriptions[eventType]

  if eventSubscription == nil or table.getn(eventSubscription) == 0 then
    mod.logger.LogDebug(me.tag, "No active subscription found for - "
      .. eventType .. " - event can be unregistered")
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
