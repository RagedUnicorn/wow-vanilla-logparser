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

lp = lp or {}
local me = lp

me.tag = "Core"

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
  elseif event == "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF")
    me.eventManager.HandleEvent(arg1, event)
  elseif event == "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS" then
    me.logger.LogEvent(me.tag, "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS")
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

  DEFAULT_CHAT_FRAME:AddMessage(string.format(LP_CONSTANTS.ADDON_NAME
    .. "|cFFFFFF00(%s)|r:", LP_CONSTANTS.ADDON_VERSION))
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
