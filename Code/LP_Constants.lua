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

LP_CONSTANTS = {
  --[[
    Addon basic variables
  ]]--
  ADDON_NAME = "LogParser",
  ADDON_NAME_SHORT = "LP",
  ADDON_VERSION = "0.0.1",

  SPELL_TYPES = {
    ["SPELL"] = 1,
    ["SPELL_DOWN"] = 2,
    ["ENEMY_AVOIDED"] = 3,
    ["SELF_AVOIDED"] = 4
  },

  --[[
    Elements
  ]]--
  ELEMENT_LP_MAIN_FRAME = "LP_MainFrame"
}
