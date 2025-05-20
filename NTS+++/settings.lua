local dmgmulti = 1
local sklhealth = 50
local enemy_spawners = {"zombies", "sewer slimes", "skeleton", "dark skulls"}
local general_spawners = {"relics", "orbs", "dragonfruit", "C H E E S E"}
local misc_spawners = {"perm wisps", "keys x5", "coins x5", "new hearts"}
local boss_spawners = {"King Slime", "Deranged Adventurer", "Book", "The Beast"}
local test_spawners = {"test enemy (Fred)", "Sphere"}
local nodmg = false

function onDungeonGenerated()
    GiveRelic("NTS-Spawner")
end

function onModSettingsInit(settingsObject)
    settingsObject.Header("<color=#FF0000>Spawners</color>")
    settingsObject.Buttons("<color=#00FF00>Enemys</color>", "settingsNamespawnerenemysCallback", 1, enemy_spawners)
    settingsObject.Buttons("<color=#00FF00>General</color>", "settingsNamespawnergeneralCallback", 1, general_spawners)
    settingsObject.Buttons("<color=#00FF00>Misc</color>", "settingsNamespawnermiscCallback", 1, misc_spawners)
    settingsObject.Buttons("<color=#00FF00>Bosses</color>", "settingsNamespawnerbossCallback", 1, boss_spawners)
    settingsObject.Buttons("<color=#00FF00>Test</color>", "settingsNamespawnertestCallback", 1, test_spawners)
    settingsObject.Header("<color=#FF0000>Abilities</color>")
    settingsObject.Buttons("<color=#00FFFF>speed</color>", "settingsNamespeedCallback", 1, {"speed"})
    settingsObject.Buttons("<color=#FFFF00>boss tp</color>", "settingsNamebossCallback", 1, {"tp mark"})
    settingsObject.Buttons("<color=#FFFF00>No DMG</color>", "settingsNamedmgaCallback", 1, {"off", "on"})
    settingsObject.Header("<color=#FF0000>Misc</color>")
    settingsObject.Slider("<color=#FFFF00>Damage Multiplier</color>", "settingsNamedmgCallback", 1, 1000, dmgmulti)
    settingsObject.Header("<color=#FF0000>CUSTOM ENEMY CONTROL</color>")
    settingsObject.Slider("<color=#FFFF00>health</color>", "settingsNamesklhealthCallback", 1, 2500, sklhealth)
    settingsObject.Buttons("<color=#00FF00>Enemys</color>", "settingsNamespawnercustomskeletonCallback", 1, {"skeleton", "slime", "kng slm"})
    settingsObject.Header("<color=#FF0000>RELICS+</color>")
    settingsObject.Buttons("<color=#00FF00>...</color>", "settingsNamespawnercustomrelicCallback", 1, {"Pit Friend", "Ginseng Root"})
    settingsObject.Header("<color=#00FFFF>Projectiles</color>")
    settingsObject.Buttons("<color=#00FF00>...</color>", "settingsNamespawnerprojectileCallback", 1, {"Expl Book"})
    settingsObject.Header("<color=#FF0000>Builds</color>")
    settingsObject.Buttons("<color=#00FF00>Bloodshot Build</color>", "settingsNamespawnerglsbuildCallback", 1, {"BloodShot", "Heart Containers", "Glass Cannon"})
    settingsObject.Buttons("<color=#00FF00>Crosbow bow Build</color>", "settingsNamespawnercbowbuildCallback", 1, {"dead weight", "pestein fweching :3", "Hummingbird Fether"})
    settingsObject.Header("<color=#FF0000>madd ppl</color>")
    settingsObject.Buttons("<color=#00FF00>drg frt x 15</color>", "settingsNamespawnerdrgfrtxxxCallback", 1, {"drg"})
    settingsObject.Buttons("<color=#00FF00>insta die</color>", "settingsNamespawnerinstakillCallback", 1, {"die"})
    settingsObject.Buttons("<color=#00FF00>coin x50</color>", "settingsNamespawnercoinxxxCallback", 1, {"coin"})
    settingsObject.Buttons("<color=#00FF00>key x50</color>", "settingsNamespawnerkeyxxxCallback", 1, {"key"})
end

function GiveRelic(id)
    pickup = game.itemInterpreter.GetPickupById(id)
    pickup.Execute("onPickup", nil)
    pickup.OnPickup()
end

function settingsNamespawnerenemysCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 1)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 2)
    end
    if buttonIndex == 2 then 
        saveInt("NTS-Spawner-Mode", 3)
    end
    if buttonIndex == 3 then
        saveInt("NTS-Spawner-Mode", 4)
    end
end

function settingsNamespawnergeneralCallback(buttonIndex)
    if buttonIndex == 0 then 
        saveInt("NTS-Spawner-Mode", 5)
    end
    if buttonIndex == 1 then 
        saveInt("NTS-Spawner-Mode", 6)
    end
    if buttonIndex == 2 then 
        saveInt("NTS-Spawner-Mode", 7)
    end
    if buttonIndex == 3 then
        saveInt("NTS-Spawner-Mode", 8)
    end
end

function settingsNamespawnermiscCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 9)
    end
    if buttonIndex == 1 then 
        saveInt("NTS-Spawner-Mode", 10)
    end
    if buttonIndex == 2 then
        saveInt("NTS-Spawner-Mode", 11)
    end
    if buttonIndex == 3 then
        saveInt("NTS-Spawner-Mode", 12)
    end
end

function settingsNamespawnerbossCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 13)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 14)
    end
    if buttonIndex == 2 then
        saveInt("NTS-Spawner-Mode", 15)
    end
    if buttonIndex == 3 then
        saveInt("NTS-Spawner-Mode", 16)
    end
end

function settingsNamespawnertestCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 17)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 18)
    end
end


function settingsNamedmgCallback(value)
    dmgmulti = value
end

function onMeleeHitEntity(infos)
	return infos.damage * dmgmulti
end

function onRangedHitEntity(infos)
	return infos.damage * dmgmulti
end

function settingsNamebossCallback(buttonIndex)
    saveInt("NTS-Spawner-Mode", 19)
end

function settingsNamespeedCallback(buttonIndex)
    saveInt("NTS-Spawner-Mode", 20)
end

function onPlayerHit(playerDamage)
    if nodmg == true then
        return 0
    end
    return playerDamage
end

function settingsNamedmgaCallback(buttonIndex)
    if buttonIndex == 0 then
         nodmg = false
    end
    if buttonIndex == 1 then
        nodmg = true
   end
end

function settingsNamesklhealthCallback(value)
    saveInt("skl-maxhealth", value)
end

function settingsNamespawnercustomskeletonCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 21)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 22)
    end
    if buttonIndex == 2 then
        saveInt("NTS-Spawner-Mode", 31)
    end
end

function settingsNamespawnercustomrelicCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 23)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 24)
    end
end

function settingsNamespawnerprojectileCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 26) 
    end
end

function settingsNamespawnerinstakillCallback(buttonIndex)
    saveInt("NTS-Spawner-Mode", 27)
end

function settingsNamespawnercoinxxxCallback(buttonIndex)
    saveInt("NTS-Spawner-Mode", 29)
end

function settingsNamespawnerkeyxxxCallback(buttonIndex)
    saveInt("NTS-Spawner-Mode", 28)
end

function settingsNamespawnerdrgfrtxxxCallback(buttonIndex)
    saveInt("NTS-Spawner-Mode", 30)
end

function settingsNamespawnerglsbuildCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 32)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 33)
    end
    if buttonIndex == 2 then
        saveInt("NTS-Spawner-Mode", 34)
    end
end

function settingsNamespawnerglsbuildCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 32)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 25)
    end
    if buttonIndex == 2 then
        saveInt("NTS-Spawner-Mode", 34)
    end
end

function settingsNamespawnercbowbuildCallback(buttonIndex)
    if buttonIndex == 0 then
        saveInt("NTS-Spawner-Mode", 35)
    end
    if buttonIndex == 1 then
        saveInt("NTS-Spawner-Mode", 36)
    end
    if buttonIndex == 2 then
        saveInt("NTS-Spawner-Mode", 37)
    end
end
