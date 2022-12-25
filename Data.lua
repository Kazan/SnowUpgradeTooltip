local startIcon, endIcon = "\124T", ":14\124t"

Icons =
{
    Valor = string.format("%s%d%s", startIcon,  463447, endIcon)
}

Colors =
{
    Available = "FF00EEAA",
    Unavailable = "FF8F6563",
    UnmetRequirements = "FFBC2C00",
}

RequiredRating =
{
    [1] = {MinRating = 0, iLevel = 376},
    [2] = {MinRating = 0, iLevel = 379},
    [3] = {MinRating = 0, iLevel = 382},
    [4] = {MinRating = 0, iLevel = 385},
    [5] = {MinRating = 0, iLevel = 389},
    [6] = {MinRating = 0, iLevel = 392},
    [7] = {MinRating = 600, iLevel = 395},
    [8] = {MinRating = 1000, iLevel = 398},
    [9] = {MinRating = 1000, iLevel = 402},
    [10] = {MinRating = 1400, iLevel = 405},
    [11] = {MinRating = 1700, iLevel = 408},
    [12] = {MinRating = 2000, iLevel = 412},
    [13] = {MinRating = 2400, iLevel = 415},
}

UpgradeCosts =
{
    -- 250: Necks, Bracers, Cloaks, Rings, Shields, Off-Hands
    INVTYPE_NECK            = {Cost = 250},
    INVTYPE_WRIST           = {Cost = 250},
    INVTYPE_CLOAK           = {Cost = 250},
    INVTYPE_FINGER          = {Cost = 250},
    INVTYPE_SHIELD          = {Cost = 250},
    INVTYPE_WEAPONOFFHAND   = {Cost = 250},
    INVTYPE_HOLDABLE        = {Cost = 250},

    -- 400: Shoulders, Gloves, Belts, Boots, Trinkets
    INVTYPE_SHOULDER    = {Cost = 400},
    INVTYPE_HAND        = {Cost = 400},
    INVTYPE_WAIST       = {Cost = 400},
    INVTYPE_FEET        = {Cost = 400},
    INVTYPE_TRINKET     = {Cost = 400},

    -- 475: Helms, Chests, Legs
    INVTYPE_HEAD    = {Cost = 475},
    INVTYPE_CHEST   = {Cost = 475},
    INVTYPE_LEGS    = {Cost = 475},
    INVTYPE_ROBE    = {Cost = 475},

    -- 500: One-Handed Agility Weapons, One-Handed Strength Weapons
    INVTYPE_WEAPONMAINHAND  = {Cost = 500},
    INVTYPE_WEAPON          = {Cost = 500},

    -- 750: One-Handed Intellect Weapons
    -- TODO find how to differentiate these...
    INVTYPE_WEAPON_INTELLECT = {Cost = 750},

    -- 1000: Two-Handed Weapons
    INVTYPE_2HWEAPON = {Cost = 1000},
}
