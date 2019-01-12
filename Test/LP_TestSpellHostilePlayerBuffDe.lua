--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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
mod.testSpellHostilePlayerBuffsDe = me

me.tag = "TestSpellHostilePlayerBuffsDe"

-- global
local _G = getfenv(0)
local eventName = "SpellHostilePlayerBuffs"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SPELL_HOSTILE_PLAYER_BUFFS_DE__Test()
  mod.testReporter.StartTestRun("global_spell_hostile_player_buffs_de_all")
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
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameHeal)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameHeal)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameHeal)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCast)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCast)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCast)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerform)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerform)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerform)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCriticalHeal)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCriticalHeal)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCriticalHeal)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameGainsRessource)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameGainsRessource)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameGainsRessource)

  mod.testReporter.PlayTestQueue()
end

function me.TestParseNormalSpellNameHeal()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameHeal",
    "dummyspell",
    "$player$s Dummyspell heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMultiwordSpellNameHeal()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameHeal",
    "dummy_spell",
    "$player$s Dummy Spell heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseSpecialCharacterSpellNameHeal()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameHeal",
    "dummy_spell",
    "$player$s Dummy (Spell):-s heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseNormalSpellNameCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCast",
    "dummyspell",
    "$player$ wirkt Dummyspell.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMultiwordSpellNameCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCast",
    "dummy_spell",
    "$player$ wirkt Dummy Spell.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseSpecialCharacterSpellNameCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCast",
    "dummy_spell",
    "$player$ wirkt Dummy (Spell):-s.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseNormalSpellNamePerform()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerform",
    "dummyspell",
    "$player$ beginnt Dummyspell auszuführen.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMultiwordSpellNamePerform()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerform",
    "dummy_spell",
    "$player$ beginnt Dummy Spell auszuführen.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseSpecialCharacterSpellNamePerform()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerform",
    "dummy_spell",
    "$player$ beginnt Dummy (Spell):-s auszuführen.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseNormalSpellNameCriticalHeal()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCriticalHeal",
    "dummyspell",
    "Kritische Heilung: $player$s Dummyspell heilt $player$ um $amount$ Punkte.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMultiwordSpellNameCriticalHeal()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCriticalHeal",
    "dummy_spell",
    "Kritische Heilung: $player$s Dummy Spell heilt $player$ um $amount$ Punkte.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseSpecialCharacterSpellNameCriticalHeal()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCriticalHeal",
    "dummy_spell",
    "Kritische Heilung: $player$s Dummy (Spell):-s heilt $player$ um $amount$ Punkte.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseNormalSpellNameGainsRessource()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameGainsRessource",
    "dummyspell",
    "$player$ bekommt $amount$ Energie durch $player$s Dummyspell.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMultiwordSpellNameGainsRessource()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameGainsRessource",
    "dummy_spell",
    "$player$ bekommt $amount$ Energie durch $player$s Dummy Spell.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseSpecialCharacterSpellNameGainsRessource()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameGainsRessource",
    "dummy_spell",
    "$player$ bekommt $amount$ Energie durch $player$s Dummy (Spell):-s.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end
