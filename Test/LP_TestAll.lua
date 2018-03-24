--[[
  MIT License

  Copyright (c) 2018 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

--[[
  To run the tests make sure to include this file into LogParser.toc.

  start test by calling from the game with /run [functionName]
]]--
local mod = lp
local me = {}
mod.testAll = me

me.tag = "TestAll"

-- global
local _G = getfenv(0)

--[[
  Global function to run all tests
]]--
function _G.__LP__TEST_ALL()
  local testEvents = {
    "SpellAuraGoneOther",
    "SpellDamageShieldsOnOthers",
    "SpellDamageShieldsOnSelf",
    "SpellHostilePlayerBuffs",
    "SpellHostilePlayerDamage",
    "SpellPeriodicHostilePlayerBuffs",
    "SpellPeriodicHostilePlayerDamage",
    "SpellPeriodicSelfDamage",
    "ChatMsgSpellSelfDamage"
  }

  -- clear saved testcases
  mod.testReporter.ClearSavedTestReports()
  -- start new testrun
  mod.testReporter.StartTestRun("test_all")

  for i = 1, table.getn(testEvents) do
    local moduleName
    local testEventWithLocale

    if GetLocale() == "deDE" then
      testEventWithLocale = testEvents[i] .. "De"
    else
      -- default locale english
      testEventWithLocale = testEvents[i] .. "En"
    end

    mod.testReporter.StartTestEventSet(testEvents[i])
    moduleName = "test" .. string.gsub(testEventWithLocale, "^%l", string.upper)
    mod.logger.LogDebug(me.tag, "moduleName: " .. moduleName)

    assert(type(mod[moduleName].RunAll) == "function",
      string.format("Each test event should have a `RunAll`" ..
      " testcase (expected function got %s)", type(mod[moduleName].RunAll)))

    mod[moduleName].RunAll()
  end
end
