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
mod.testSpellPeriodicHostilePlayerBuffsEn = me

me.tag = "TestSpellPeriodicHostilePlayerBuffsEn"

-- global
local _G = getfenv(0)
local eventName = "SpellPeriodHostilePlayerBuffs"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SPELL_PERIOD_HOSTILE_PLAYER_BUFFS_EN__Test()
  mod.testReporter.StartTestRun("global_spell_period_hostile_player_buffs_en_all")
  mod.testReporter.StartTestEventSet(eventName)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  me.RunAll()
end

--[[
  @param {boolean} playManual
    true if testqueue is started manually
    false if testqueue should be started
]]--
function me.RunAll()
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameGains)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameGains)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameGains)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameGainsRessource)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameGainsRessource)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameGainsRessource)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameGainsCharge)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameGainsCharge)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameGainsCharge)

  mod.testReporter.PlayTestQueue()
end

function me.TestParseNormalSpellNameGains()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameGains",
    "dummyspell",
    "$player$ gains Dummyspell.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseMultiwordSpellNameGains()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameGains",
    "dummy_spell",
    "$player$ gains Dummy Spell.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseSpecialCharacterSpellNameGains()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameGains",
    "dummy_spell",
    "$player$ gains Dummy (Spell):-'s.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseNormalSpellNameGainsRessource()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameGainsRessource",
    "dummyspell",
    "$player$ gains $amount$ Energy from $player$'s Dummyspell.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseMultiwordSpellNameGainsRessource()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameGainsRessource",
    "dummy_spell",
    "$player$ gains $amount$ Energy from $player$'s Dummy Spell.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseSpecialCharacterSpellNameGainsRessource()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameGainsRessource",
    "dummy_spell",
    "$player$ gains $amount$ Energy from $player$'s Dummy (Spell):-'s.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseNormalSpellNameGainsCharge()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameGainsCharge",
    "dummyspell",
    "$player$ gains Dummyspell (20).",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseMultiwordSpellNameGainsCharge()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameGainsCharge",
    "dummy_spell",
    "$player$ gains Dummy Spell (20).",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseSpecialCharacterSpellNameGainsCharge()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameGainsCharge",
    "dummy_spell",
    "$player$ gains Dummy (Spell):-'s (20).",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end
