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

mod.testSpellDamageShieldsOnSelfEn = me

me.tag = "TestSpellDamageShieldsOnSelfEn"

-- global
local _G = getfenv(0)
local eventName = "SpellDamageShieldsOnSelf"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SPELL_DAMAGE_SHIELDS_ON_SELF_EN__Test()
  mod.testReporter.StartTestRun("global_spell_damage_shields_on_self_en_all")
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
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameResisted)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameResisted)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameResisted)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameImmune)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameImmune)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameImmune)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameMissed)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameMissed)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameMissed)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameDodged)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameDodged)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameDodged)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameParried)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameParried)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameParried)

  mod.testReporter.PlayTestQueue()
end

function me.TestParseNormalSpellNameResisted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameResisted",
    "dummyspell",
    "Your Dummyspell was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseMultiwordSpellNameResisted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameResisted",
    "dummy_spell",
    "Your Dummy Spell was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseSpecialCharacterSpellNameResisted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameResisted",
    "dummy_spell",
    "Your Dummy (Spell):-'s was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseNormalSpellNameImmune()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameImmune",
    "dummyspell",
    "Your Dummyspell failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseMultiwordSpellNameImmune()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameImmune",
    "dummy_spell",
    "Your Dummy Spell failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseSpecialCharacterSpellNameImmune()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameImmune",
    "dummy_spell",
    "Your Dummy (Spell):-'s failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseNormalSpellNameMissed()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameMissed",
    "dummyspell",
    "Your Dummyspell missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseMultiwordSpellNameMissed()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameMissed",
    "dummy_spell",
    "Your Dummy Spell missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseSpecialCharacterSpellNameMissed()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameMissed",
    "dummy_spell",
    "Your Dummy (Spell):-'s missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseNormalSpellNameDodged()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameDodged",
    "dummyspell",
    "Your Dummyspell was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseMultiwordSpellNameDodged()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameDodged",
    "dummy_spell",
    "Your Dummy Spell was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseSpecialCharacterSpellNameDodged()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameDodged",
    "dummy_spell",
    "Your Dummy (Spell):-'s was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseNormalSpellNameParried()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameParried",
    "dummyspell",
    "Your Dummyspell is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseMultiwordSpellNameParried()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameParried",
    "dummy_spell",
    "Your Dummy Spell is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end

function me.TestParseSpecialCharacterSpellNameParried()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameParried",
    "dummy_spell",
    "Your Dummy (Spell):-'s is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf
  )
end