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

mod.testSpellHostilePlayerDamageDe = me

me.tag = "TestSpellHostilePlayerDamageDe"

-- global
local _G = getfenv(0)
local eventName = "SpellHostilePlayerDamage"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SPELL_HOSTILE_PLAYER_DAMAGE_DE__Test()
  mod.testReporter.StartTestRun("global_spell_hostile_player_damage_de_all")
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
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameHits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameHits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameHits)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCrits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCrits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCrits)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameBeginsToCast)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameBeginsToCast)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameBeginsToCast)

  mod.testReporter.PlayTestQueue()
end

function me.TestParseNormalSpellNameHits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameHits",
    "dummyspell",
    "$player$ trifft Euch (mit Dummyspell). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameHits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameHits",
    "dummy_spell",
    "$player$ trifft Euch (mit Dummy Spell). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameHits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameHits",
    "dummy_spell",
    "$player$ trifft Euch (mit Dummy (Spell):-s). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameCrits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCrits",
    "dummyspell",
    "$player$ trifft Euch kritisch (mit Dummyspell). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameCrits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCrits",
    "dummy_spell",
    "$player$ trifft Euch kritisch (mit Dummy Spell). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameCrits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCrits",
    "dummy_spell",
    "$player$ trifft Euch kritisch (mit Dummy (Spell):-s). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameBeginsToCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameBeginsToCast",
    "dummyspell",
    "$player$ beginnt Dummyspell zu wirken.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameBeginsToCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameBeginsToCast",
    "dummy_spell",
    "$player$ beginnt Dummy Spell zu wirken.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameBeginsToCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameBeginsToCast",
    "dummy_spell",
    "$player$ beginnt Dummy (Spell):-s zu wirken.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end