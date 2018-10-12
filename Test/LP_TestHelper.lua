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

local mod = lp
local me = {}
mod.testHelper = me

me.tag = "TestHelper"

local playerPlaceholder = "%$player%$"
local amountPlaceholder = "%$amount%$"
local dummyPlayerName = "Player"
local dummyNumber = "100"

me.eventTypeCombatHostileDeath = "CHAT_MSG_COMBAT_HOSTILE_DEATH"
me.eventTypeSpellPeriodicSelfDamage = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"
me.eventTypeSpellHostilePlayerBuff = "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
me.eventTypeSpellPeriodicHostilePlayerBuffs = "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
me.eventTypeSpellHostilePlayerDamage = "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE"
me.eventTypeSpellPeriodicSpellHostilePlayerDamage = "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
me.eventTypeSpellAuraGoneOther = "CHAT_MSG_SPELL_AURA_GONE_OTHER"
me.eventTypeSpellSelfDamage = "CHAT_MSG_SPELL_SELF_DAMAGE"
me.eventTypeSpellDamageShieldsOnSelf = "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF"
me.eventTypeSpellFailedLocalPlayer = "CHAT_MSG_SPELL_FAILED_LOCALPLAYER"

--[[
  Prepare a passed combat message by replacing player and number with dummy values

  @param {string} msg
  @return {string}
    Prepared combat message
]]--
function me.PrepareCombatMessage(msg)
  local combatMessage = msg

  -- replace with dummy player
  combatMessage = string.gsub(combatMessage, playerPlaceholder, dummyPlayerName)
  -- replace with dummy number
  combatMessage = string.gsub(combatMessage, amountPlaceholder, dummyNumber)

  return combatMessage
end

--[[
  Test parsing a normal spell combat message

  @param {string} eventName
  @param {string} testName
  @param {string} spellName
  @param {string} combatMessage
  @param {string} eventType

]]--
function me.TestParse(eventName, testName, spellName, combatMessage, eventType)
  local status = 0

  mod.testReporter.StartTest(eventName, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, eventType)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(eventName, testName,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(eventName, testName,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(eventName, testName)
end
