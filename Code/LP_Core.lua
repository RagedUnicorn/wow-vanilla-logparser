--[[
  MIT License

  Copyright (c) 2018 Michael Wiesendanger

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

lp = lp or {}
local me = lp

me.tag = "Core"

-- global
local _G = getfenv(0)

--[[
  Testing

  Hook GetLocale to return a fixed value. Deactivate in production!
  Note: This is used for testing only. If the locale doesn't match with the actual
  locale of the combatlog the Addon is unable to parse the log.
]]--
--[[
  function _G.GetLocale()
    return "deDE"
  end
]]--

--[[Addon load]]--
function me.OnLoad()
  me.RegisterEvents()
  me.SetupSlashCmdList()
end

--[[
  MainFrame OnEvent handler
]]--
function me.OnEvent()
  local messageType

  if event == "PLAYER_LOGIN" then
    me.logger.LogEvent(me.tag, "PLAYER_LOGIN")
    me.Initialize()
  elseif event == "CHAT_MSG_SPELL_FAILED_LOCALPLAYER" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_FAILED_LOCALPLAYER")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_SELF_DAMAGE")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_AURA_GONE_OTHER" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_AURA_GONE_OTHER")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_COMBAT_HOSTILE_DEATH" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_COMBAT_HOSTILE_DEATH")
    me.eventManager.HandleEvent(arg1, event)
  end
end

--[[
  register addon events
]]--
function me.RegisterEvents()
  -- register to player login event also fires on /reload
  this:RegisterEvent("PLAYER_LOGIN")
end

--[[
  init function
]]--
function me.Initialize()
  --setup random seed
  math.randomseed(GetTime())

  me.logger.LogDebug(me.tag, "Initialize addon")
end

--[[
  Print cmd options for addon
]]--
local function ShowInfoMessage()
  local reload = "|cFFFFFF00reload|r - reload UI"
  local info = "|cFFFFFF00info|r - show this message"

  DEFAULT_CHAT_FRAME:AddMessage(string.format(LP_ENVIRONMENT.ADDON_NAME
    .. "|cFFFFFF00(%s)|r:", LP_ENVIRONMENT.ADDON_VERSION))
  DEFAULT_CHAT_FRAME:AddMessage(reload)
  DEFAULT_CHAT_FRAME:AddMessage(info)
end

--[[
  Setup slash command handler
]]--
function me.SetupSlashCmdList()
  SLASH_LOGPARSER1 = "/lp"
  SLASH_LOGPARSER2 = "/logparser"

  SlashCmdList["LOGPARSER"] = function(msg)
    me.logger.LogDebug(me.tag, "/lp passed argument: " .. msg)

    if msg == "" or msg == "info" then
      ShowInfoMessage()
    elseif msg == "rl" or msg == "reload" then
      ReloadUI()
    else
      me.logger.PrintUserError("Invalid argument passed")
    end
  end
end
