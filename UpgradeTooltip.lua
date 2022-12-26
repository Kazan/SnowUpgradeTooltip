if Addon == nil then Addon = {} end

local function OnTooltipSetItem(tooltip, _)
    if tooltip == GameTooltip then
        Addon:addUpgradeInfo(tooltip)
    end
end

function Addon:OnLoad()
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)
end

function Addon:addUpgradeInfo(tooltip)
    local clipAfter = string.find(ITEM_UPGRADE_TOOLTIP_FORMAT, "%%d") -1
    local searchValue = string.sub(ITEM_UPGRADE_TOOLTIP_FORMAT, 1, clipAfter)
    local ttname = tooltip:GetName()
    local item, itemLink = tooltip:GetItem()

    for i = 1, tooltip:NumLines() do
        local left = _G[ttname .. "TextLeft" .. i]
        local text = left:GetText()
        if text:find(searchValue) then
            local upgradeInfo = string.sub(text, clipAfter)
            local curLevel, maxLevel = strsplit("/", upgradeInfo)

            curLevel = tonumber(curLevel)
            maxLevel = tonumber(maxLevel)

            -- stop processing if item is already at max level
            if curLevel == maxLevel then return; end
            local nextLevel = curLevel + 1

            local reqsNext = RequiredRating[nextLevel]
            local reqsMax = RequiredRating[maxLevel]

            -- if can't equip we can bail out
            local itemEquipLoc = select(9, GetItemInfo(item))
            if itemEquipLoc == "" then return; end

            -- Hack for intelligence Weapons
            local stats = GetItemStats(itemLink)
            if itemEquipLoc == "INVTYPE_WEAPON" and stats.ITEM_MOD_INTELLECT_SHORT ~= nil then
                itemEquipLoc = "INVTYPE_WEAPON_INTELLECT"
            end

            local slotCost = UpgradeCosts[itemEquipLoc]
            if slotCost == nil then return; end

            local totalCost = slotCost.Cost * (maxLevel - curLevel)

            local currency = C_CurrencyInfo.GetCurrencyInfo(1191)

            local nextColor = Colors.Unavailable
            local maxColor = Colors.Unavailable

            local pInfo = C_PlayerInfo.GetPlayerMythicPlusRatingSummary("player")

            if pInfo.currentSeasonScore < reqsNext.MinRating then
                nextColor = Colors.UnmetRequirements
            elseif currency.quantity >= slotCost.Cost then
                nextColor = Colors.Available
            end

            if pInfo.currentSeasonScore < reqsMax.MinRating then
                maxColor = Colors.UnmetRequirements
            elseif currency.quantity >= totalCost then
                maxColor = Colors.Available
            end

            local extra = string.format(
                " (%s %s / %s %s)",
                self:colorize(slotCost.Cost, nextColor),
                Icons.Valor,
                self:colorize(totalCost, maxColor),
                Icons.Valor
            )

            left:SetText(text .. extra)
        end
    end
end

function Addon:colorize(text, color)
    return string.format("|c%s%s|r", color, text)
end

function Addon:dumpTable(table, depth)
    if (depth > 200) then
        print("Error: Depth > 200 in dumpTable()")
        return
    end
    for k,v in pairs(table) do
        if (type(v) == "table") then
            print(string.rep("  ", depth)..k..":")
            self:dumpTable(v, depth+1)
        else
            print(string.rep("  ", depth)..k..": ",v)
        end
    end
end

Addon:OnLoad()
