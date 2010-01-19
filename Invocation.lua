if(select(2, UnitClass('player')) ~= 'WARLOCK') then return DisableAddOn(...) end

local spells = {
	[GetSpellInfo(698)] = true, -- Ritual of Summoning
	[GetSpellInfo(29893)] = true, -- Ritual of Souls
}

local function channelName()
	local _, type = IsInstance()
	if(type == 'pvp' or type == 'arena') then
		return 'BATTLEGROUND'
	elseif(GetNumRaidMembers() > 0) then
		return 'RAID'
	elseif(GetNumPartyMembers() > 0) then
		return 'PARTY'
	end
end

local addon = CreateFrame('Frame')
addon:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED')
addon:SetScript('OnEvent', function(self, event, unit, spellName)
	if(unit == 'player' and spells[spellName] and channelName()) then
		SendChatMessage('- Click the portal for free candy! -', channelName())
	end
end)
