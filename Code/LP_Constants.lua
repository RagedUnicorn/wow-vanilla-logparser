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
    ["SELF_AVOIDED"] = 4,
    ["LOCAL_FAILURE"] = 5
  },

  --[[
    Elements
  ]]--
  ELEMENT_LP_MAIN_FRAME = "LP_MainFrame"
}
