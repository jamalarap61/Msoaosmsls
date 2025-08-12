


local Data = {}
Data.ReplicatedStorage = game:GetService("ReplicatedStorage")
Data.Players = game:GetService("Players")
Data.RunService = game:GetService("RunService")
Data.LocalPlayer = Data.Players.LocalPlayer
Data.Char = Data.LocalPlayer.Character or Data.LocalPlayer.CharacterAdded:Wait()
Data.Backpack = Data.LocalPlayer.Backpack
Data.Humanoid = Data.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Data.HRP = Data.Char:WaitForChild("HumanoidRootPart")
Data.PlayerGui = Data.LocalPlayer.PlayerGui
Data.GameEvents = Data.ReplicatedStorage.GameEvents 
Data.Farms = workspace.Farm
Data.VirtualUser = game:GetService("VirtualUser")
Data.UIS = game:GetService("UserInputService")
Data.HttpService = game:GetService("HttpService")
Data.TeleportService = game:GetService("TeleportService")
Data.collectionService = game:GetService("CollectionService")
Data.RemoteCraft = Data.ReplicatedStorage.GameEvents.CraftingGlobalObjectService
Data.MutationHandler = require(game:GetService("ReplicatedStorage").Modules:WaitForChild("MutationHandler"))
Data.ItemModule = require(game:GetService("ReplicatedStorage"):WaitForChild("Item_Module"))
Data.PlantRE = Data.ReplicatedStorage.GameEvents.Plant_RE
Data.WaterRE = Data.ReplicatedStorage.GameEvents.Water_RE
Data.SellPetRE = Data.ReplicatedStorage.GameEvents.SellPet_RE
Data.RemotePlace = Data.ReplicatedStorage.GameEvents.PetEggService
Data.RemoveItem = Data.ReplicatedStorage.GameEvents.Remove_Item
Data.Character = Data.LocalPlayer.Character or Data.LocalPlayer.CharacterAdded:Wait()
Data.ECWB = workspace.CraftingTables.EventCraftingWorkBench
Data.SCWB = workspace.CraftingTables.SeedEventCraftingWorkBench
Data.Collect = game:GetService("CollectionService")
Data.Delete = Data.ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("DeleteObject")
Data.SprinklerRE = Data.ReplicatedStorage.GameEvents.SprinklerService
Data.PetBoost= Data.ReplicatedStorage.GameEvents.PetBoostService
Data.Camera = workspace.CurrentCamera
Data.VirtualInputManager = game:GetService("VirtualInputManager")
Data.GuiService = game:GetService("GuiService")
Data.FavoriteItem = Data.ReplicatedStorage.GameEvents.Favorite_Item
Data.CookingPotService_RE = Data.ReplicatedStorage.GameEvents.CookingPotService_RE
Data.SubmitFoodService_RE = Data.ReplicatedStorage.GameEvents.SubmitFoodService_RE

--Boolean
Data.SelectedSeed = nil
Data.SelectedGear = nil
Data.SelectedEgg = nil
Data.SelectedPets = nil
Data.SelectedPetMids = nil
Data.SelectedFruit = nil
Data.SelectedEvent = nil
Data.SelectedPlantSeed = nil
Data.SelectedPlayerGift = nil
Data.SelectedSellPet = nil
Data.SelectedHatchPet = nil
Data.RemoveFruit = nil
Data.RemoveWeight = nil
Data.AutoRemoveFruit = false
Data.SelectedPlant = {}
Data.SelectedMuta = {}
Data.SelectedFPlant = {}
Data.SelectedFMuta = {}
Data.petuuid = {}
Data.petReal = {}
Data.petRealMid = {}
Data.PetListData = {}
Data.PetListDataMid = {}
Data.Inven = "~"
Data.BestFarm = 0
Data.BestAll = 0
Data.NameFarm = "~"
Data.NameAll = "~"
Data.FarmMuta = "~"
Data.AllMuta = "~"
Data.WeightFarm = 0
Data.WeightAll = 0
Data.BestPall = "~"
Data.SelectedToys = nil

--List
Data.SeedList = {"Carrot","Strawberry","Blueberry","Orange Tulip","Tomato",
                    "Corn","Daffodil","Watermelon","Pumpkin","Apple","Bamboo",
                    "Coconut","Cactus","Dragon Fruit","Mango","Grape","Mushroom",
                    "Pepper","Rafflesia","Cacao","Beanstalk","Ember Lily","Sugar Apple","Burning Bud","Giant Pinecone", "Elder Strawberry", "Cauliflower","Green Apple","Avocado","Banana","Pineapple","Kiwi","Bell Pepper","Prickly Pear","Pitcher Plant", "Loquat","Feijoa"}

Data.GearList = {"Watering Can","Trading Ticket", "Trowel","Recall Wrench","Basic Sprinkler",
                    "Advanced Sprinkler","Godly Sprinkler","Grandmaster Sprinkler", "Lightning Rod",
                    "Master Sprinkler","Favorite Tool","Magnifying Glass","Tanning Mirror","Cleaning Spray","Harvest Tool", "Levelup Lollipop", "Medium Toy", "Medium Treat"}
Data.TwilList = {"Night Egg", "Night Seed Pack", "Twilight Crate", "Moon Cat", "Celestiberry", "Star Caller", "Moon Mango"}
Data.BloodList = {"Mysterious Crate","Night Egg","Night Seed Pack",
                    "Blood Banana","Moon Melon","Star Caller",
                    "Blood Hedgehog","Blood Kiwi","Blood Owl"}
Data.EggList = { "Anti Bee Egg", "Bee Egg", "Bug Egg", "Common Egg", "Common Summer Egg", "Divine Egg", "Epic Egg", "Exotic Bug Egg", "Legendary Egg", "Mythical Egg", "Night Egg", "Paradise Egg", "Premium Anti Bee Egg", "Rare Egg", "Rare Summer Egg", "Uncommon Egg", "Oasis Egg", "Dinosaur Egg", "Zen Egg", "Primal Egg"}
Data.FruitList = {"Artichoke", "Amber Spine", "Aloe Vera", "Apple", "Avocado", "Bamboo", "Banana", "Banana", "Beanstalk", "Bee Balm", "Bell Pepper", "Bendboo", "Blood Banana", "Blue Lollipop", "Blueberry", "Bone Blossom", "Boneboo", "Burning Bud", "Candy Blossom", "Cacao", "Cactus", "Cantaloupe", "Carrot", "Cauliflower", "Celestiberry", "Ceramic", "Cherry Blossom", "Chocolate Carrot", "Cocovine", "Coconut", "Cranberry", "Crimson Vine", "Crocus", "Crown Melon", "Corn", "Cursed Fruit", "Daffodil", "Dandelion", "Delphinium", "Dragon Fruit", "Dragon Pepper", "Durian", "Dezen", "Enkaku", "Easter Egg",  "Eggplant", "Elephant Ears", "Ember Lily", "Elder Strawberry", "Feijoa", "Firefly Fern", "Firework Flower", "Foxglove", "Fossilight", "Fruitball", "Grand Volcania", "Grand Tomato", "Grape", "Green Apple", "Guanabana", "Giant Pinecone", "Hive Fruit", "Honeysuckle", "Horned Dinoshroom", "Horsetail", "Hinomai", "Ice Cream Bean", "Jalapeno", "Kiwi", "Lavender", "Lemon", "Lingonberry", "Liberty Lily", "Lilac", "Lily of the Valley", "Lime", "Loquat", "Lotus", "Lumira", "Lucky Bamboo", "Monobloma", "Manuka Flower", "Mango", "Mega Mushroom", "Merica Mushroom", "Mint", "Moon Blossom", "Moon Melon", "Moon Mango", "Moonflower", "Moonglow", "Mushroom", "Maple Apple", "Nectar Thorn", "Nectarine", "Nectarshade", "Noble Flower", "Onion", "Orange Tulip", "Papaya", "Paradise Petal", "Parasol Flower", "Passionfruit", "Peace Lily", "Peach", "Pepper", "Pear", "Pineapple", "Pink Lily", "Pink Tulip", "Pitcher Plant", "Plasma", "Prickly Pear", "Pumpkin", "Purple Cabbage", "Purple Dahlia", "Rafflesia", "Raspberry", "Red Lollipop", "Rose", "Rosy Delight", "Soul Fruit", "Stonebite", "Starfruit", "Strawberry", "Sugar Apple", "Spiked Mango", "Sugarglaze", "Succulent", "Suncoil", "Sunflower", "Serenity", "Sakura Bush", "Soft Sunshine", "Tall Asparagus", "Tranquil Bloom", "Traveler's Fruit", "Tomato", "Taco Fern", "Venus Fly Trap", "Violet Corn", "Watermelon", "White Mulberry", "Wild Carrot", "Zen Rocks", "Zenflare"}
Data.ListMutation = {
    "Acidic", "Alienlike", "Amber", "AncientAmber", "Aurora", "Blitzshock", "Bloodlit", "Burnt", "Celestial", "Chilled", "Choc", "Clay", "Ceramic", "Chakra", 
    "Cloudtouched", "Cooked", "Corrupt", "Dawnbound", "Disco", "Drenched", "Eclipsed", "Enlightened", "FoxfireChakra", "Fried", "Friendbound", "Frozen", "Galactic", "Heavenly",
    "HoneyGlazed", "Infected", "Jackpot", "Meteoric", "Molten", "Moonlit", "OldAmber", "Paradisal", "Plasma", "Pollinated", "Radioactive", "Sandy",
    "Shocked", "Sundried", "Subzero", "Twisted", "Tranquil", "Toxic", "Tempestuous", "TouchDown", "Verdant", "Voidtouched", "Wet", "Wiltproof", "Windstruck", "Zombified"
  }
Data.ListSellPet = {
    "Axolotl", "Bald Eagle", "Bear Bee", "Bee", "Black Bunny", "Blood Hedgehog", "Blood Kiwi", "Blood Owl",
    "Brontosaurus", "Brown Mouse", "Bunny", "Butterfly", "Capybara", "Caterpillar", "Cat", "Ceramic", "Chicken",
    "Chicken Zombie", "Cooked Owl", "Cow", "Crab", "Deer", "Disco Bee", "Dog", "Echo Frog", "Fennec Fox", "Firefly",
    "Flamingo", "Frog", "Giant Ant", "Golden Bee", "Golden Lab", "Grey Mouse", "Hamster", "Hedgehog", "Honey Bee",
    "Hyacinth Macaw", "Kiwi", "Meerkat", "Mimic Octopus", "Mole", "Monkey", "Moon Cat", "Moth", "Night Owl",
    "Orange Tabby", "Orangutan", "Ostrich", "Owl", "Pack Bee", "Panda", "Peacock", "Petal Bee", "Pig", "Polar Bear",
    "Praying Mantis", "Pterodactyl", "Queen Bee", "Raccoon", "Raptor", "Red Fox", "Red Giant Ant", "Rooster",
    "Sand Snake", "Scarlet Macaw", "Sea Otter", "Sea Turtle", "Seagull", "Seal", "Silver Monkey", "Snail",
    "Spotted Deer", "Squirrel", "Starfish", "Stegosaurus", "T-Rex", "Tarantula Hawk", "Toucan", "Triceratops",
    "Turtle", "Wasp", "Shiba Inu", "Nihonzaru", "Tanuki", "Tanchozuru", "Kappa", "Kitsune", "Raiju", "Corrupted Kitsune", "Kodama", "Corrupted Kodama", "Maneki-neko", "Bagel Bunny", "Pancake Mole", "Sushi Bear", "Spagetthi Sloth", "French Fry Ferret", "Mochi Mouse"
  }
Data.ZenShop = {"Zen Seed Pack", "Zen Egg", "Hot Spring", "Zen Sand", "Zenflare", "Zen Crate", "Soft Sunshine", "Koi", "Zen Gnome Crate", "Spiked Mango", "Pet Shard Tranquil", "Pet Shard Corrupted", "Raiju"}
Data.PackList = { "Ancient Seed Pack", "Basic Seed Pack", "Corrupted Zen Seed Pack", "Crafters Seed Pack", "Exotic Ancient Seed Pack", "Exotic Crafters Seed Pack", "Exotic Flower Seed Pack", "Exotic Gourmet Seed Pack", "Exotic Kitsune Chest", "Exotic Seed Pack", "Exotic Summer Seed Pack", "Exotic Zen Seed Pack", "Flower Seed Pack", "Gourmet Seed Pack", "Kitsune Chest", "Night Seed Pack", "Normal Seed Pack", "Premium Night Seed Pack", "Premium Seed Pack", "Rainbow Basic Seed Pack", "Rainbow Exotic Ancient Seed Pack", "Rainbow Exotic Crafters Seed Pack", "Rainbow Exotic Flower Seed Pack", "Rainbow Exotic Gourmet Seed Pack", "Rainbow Exotic Kitsune Chest", "Rainbow Exotic Summer Seed Pack", "Rainbow Exotic Zen Seed Pack", "Rainbow Pack", "Rainbow Premium Seed Pack", "Rainbow Sack", "Summer Seed Pack", "Zen Seed Pack" }




-- Load Library
local Library, SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/jamalarap61/Mslspakwnendlsowjnssoaknana/refs/heads/main/wnsoaowknswlwksnwmk.lua"))()

function MainMenu() 
function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

-- Buat Window (Ukuran besar untuk layar HP)
local Window = Library:CreateWindow({
    Title = gradient("LimitHub", Color3.fromHex("#8ab4f8"), Color3.fromHex("#00ffe1")),
    SubTitle = "Grow A Garden v0.0.0",
    Size = UDim2.new(0, 480, 0, 300), -- Ukuran besar, cocok HP
    TabWidth = 120,
    Theme = "LimitHub",    
    Acrylic = false
})
local ConfigLod = "LimitHub/Garden/config/Garden.json"


function NotifyHub(text) 
Library:Notify({
Title = "LimitHub", 
Content = text,
Duration = 5,
})
end

local Tab1 = Window:AddTab({
    Title = "Home",
    Icon = "home"
})
local Tab2 = Window:AddTab({
    Title = "Event",
    Icon = "gamepad"
})
local Tab3 = Window:AddTab({
    Title = "Farming",
    Icon = "leaf"
})
local Tab4 = Window:AddTab({
    Title = "Pet",
    Icon = "bone"
})
local Tab5 = Window:AddTab({
    Title = "Shop",
    Icon = "shopping-cart"
})
local Tab6 = Window:AddTab({
    Title = "ESP/Dialog UI",
    Icon = "boxes"
})
local Tab7 = Window:AddTab({
    Title = "Vulnerability",
    Icon = "recycle"
})
local Tab8 = Window:AddTab({
    Title = "Teleport",
    Icon = "map-pin"
})
local Tab9 = Window:AddTab({
    Title = "Performance",
    Icon = "signal"
})
local Tab10 = Window:AddTab({
    Title = "Other",
    Icon = "align-justify"
})
local Tab11 = Window:AddTab({
    Title = "Settings",
    Icon = "settings"
})

Window:SelectTab(1) 

--Function
local function JoinRand()
    local placeId = game.PlaceId
    local currentJobId = game.JobId
    local cursor = ""
    local availableServers = {}
    local maxPages = 5

    for i = 1, maxPages do
        local url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100%s"):format(
            placeId,
            cursor ~= "" and ("&cursor=" .. cursor) or ""
        )

        local success, result = pcall(function()
            return Data.HttpService:JSONDecode(game:HttpGet(url))
        end)

        if success and result and result.data then
            for _, server in ipairs(result.data) do
                -- Cek validitas data sebelum dibandingkan
                if typeof(server.playing) == "number" and typeof(server.maxPlayers) == "number" and server.id ~= currentJobId then
                    if server.playing < server.maxPlayers then
                        table.insert(availableServers, server.id)
                    end
                end
            end

            if result.nextPageCursor then
                cursor = result.nextPageCursor
                task.wait(0.1)
            else
                break
            end
        else
            warn("Failed Get data server.")
            break
        end
    end

    if #availableServers > 0 then
        local randomServerId = availableServers[math.random(1, #availableServers)]
        Data.TeleportService:TeleportToPlaceInstance(placeId, randomServerId, Data.Players.LocalPlayer)
    else
        warn("Server Not Found for Hop")
    end
end

local function click()
    local viewportSize = Data.Camera.ViewportSize
    local x = viewportSize.X / 2
    local y = 5

    Data.VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
    Data.VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)
end

local function GetBP()
return #Data.Backpack:GetChildren()
end

function EquipSingle(namePart)
    for _, tool in ipairs(Data.Backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name:lower(), namePart:lower()) then
            Data.Humanoid:EquipTool(tool)
            break
        end
    end
end

local function GetFarm()
    for _, farm in ipairs(workspace.Farm:GetChildren()) do
        local important_folder = farm:FindFirstChild("Important")
        if important_folder then
            local owner_value = important_folder:FindFirstChild("Data") and important_folder.Data:FindFirstChild("Owner")
            if owner_value and owner_value.Value == Data.LocalPlayer.Name then
                return farm
            end
        end
    end
    return nil
end

function BuySeed(Seed)
	Data.GameEvents.BuySeedStock:FireServer(Seed)
end

function BuyGear(gear) 
Data.GameEvents.BuyGearStock:FireServer(gear)
end

function BuyEvent1(event) 
Data.GameEvents.BuyEventShopStock:FireServer(event)
end

function BuyEvent2(events) 
Data.GameEvents.BuyNightEventShopStock:FireServer(events)
end

function BuyPet(num)
Data.GameEvents.BuyPetEgg:FireServer(num)
end

function Teleport(vec)
local hrp = Data.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
hrp.CFrame = vec
end

local function ScanUUID(partialName)
    for _, item in pairs(Data.Backpack:GetChildren()) do
        if string.find(item.Name, partialName) then
            local uuid = item:GetAttribute("c")
            if uuid then
                return uuid
            end
        end
    end
    return nil
end

local function FormatNumber(num)
    local formatted = tostring(num)
    while true do
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
        if k == 0 then break end
    end
    return formatted
end


local function Calplantvalue(obj)
    local s = obj:FindFirstChild("Item_String")
    local v = obj:FindFirstChild("Variant")
    local w = obj:FindFirstChild("Weight")
    local id = s and s.Value or obj.Name

    if not (v and w) then return 0 end
    local data = Data.ItemModule.Return_Data(id)
    if not data or #data < 3 then return 0 end

    local base, div = data[3], data[2]
    local multiplier = Data.MutationHandler:CalcValueMulti(obj) * Data.ItemModule.Return_Multiplier(v.Value)
    local factor = math.clamp(w.Value / div, 0.95, 1e8)
    local result = math.round(base * multiplier * factor * factor)

    return FormatNumber(result)
end

local TeleUI = game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame
for _, UITel in pairs(TeleUI:GetChildren()) do
if UITel:IsA("ImageButton") then
UITel.Visible = true
end
end

local eggModels = {}
local eggPets = {}
local DongoPet = {}

local val, gege = pcall(function()
	local hatchFunc = getupvalue(getupvalue(getconnections(Data.ReplicatedStorage.GameEvents.PetEggService.OnClientEvent)[1].Function, 1), 2)
	eggModels = getupvalue(hatchFunc, 1) or {}
	eggPets = getupvalue(hatchFunc, 2) or {}
end)

if not val then
print("GetUp Error: "..gege) 
end

local function ScanBestFarm()
    local MyFarm = GetFarm()
    if not MyFarm then return end
    local MyPlant = MyFarm:FindFirstChild("Important")
    if not MyPlant then return end
    MyPlant = MyPlant:FindFirstChild("Plants_Physical")
    if not MyPlant then return end
    local bestFruit = nil
    local bestValue = -math.huge
    for _, obj in pairs(MyPlant:GetDescendants()) do
        local weight = obj:FindFirstChild("Weight")
        if weight and obj.Parent and obj.Parent.Name == "Fruits" then
            local rawValue = Calplantvalue(obj)
            local valueStr = string.gsub(tostring(rawValue), "%.", "")
            local value = tonumber(valueStr) or 0
            if value > bestValue then
                bestValue = value
                bestFruit = obj
            end
        end
    end
    if bestFruit then
        local fruitName = bestFruit.Name
        local plantName = bestFruit.Parent and bestFruit.Parent.Parent and bestFruit.Parent.Parent.Name or "?"
        local weight = bestFruit:FindFirstChild("Weight") and bestFruit.Weight.Value or 0
        local roundedWeight = math.round(weight)
        local mutationList = {}
        for _, mut in ipairs(Data.MutationHandler:GetPlantMutations(bestFruit)) do
            table.insert(mutationList, mut.Name)
        end
        local variantValue = bestFruit:FindFirstChild("Variant")
        if variantValue and variantValue:IsA("StringValue") then
            table.insert(mutationList, tostring(variantValue.Value))
        end
        local mutationStr = #mutationList > 0 and table.concat(mutationList, ", ") or "None"
        Data.NameFarm = fruitName
        Data.WeightFarm = roundedWeight
        Data.FarmMuta = mutationStr
        Data.BestFarm = FormatNumber(bestValue)
    else
        NotifyHub("[Best Fruit] No fruit found.")
    end
end


local function ScanBestAll()
    local bestFruit = nil
    local bestValue = -math.huge
    local bestOwnerName = "Unknown"
    for _, farm in pairs(workspace:GetDescendants()) do
        local important = farm:FindFirstChild("Important")
        if important then
            local physical = important:FindFirstChild("Plants_Physical")
            if physical then
                for _, obj in pairs(physical:GetDescendants()) do
                    local weight = obj:FindFirstChild("Weight")
                    if weight and obj.Parent and obj.Parent.Name == "Fruits" then
                        local rawValue = Calplantvalue(obj)
                        local valueStr = string.gsub(tostring(rawValue), "%.", "")
                        local value = tonumber(valueStr) or 0
                        if value > bestValue then
                            bestValue = value
                            bestFruit = obj
                            local data = important:FindFirstChild("Data")
                            local ownerVal = data and data:FindFirstChild("Owner")
                            if ownerVal and typeof(ownerVal.Value) == "string" then
                                bestOwnerName = ownerVal.Value
                            end
                        end
                    end
                end
            end
        end
    end

    if bestFruit then
        local fruitName = bestFruit.Name
        local plantName = bestFruit.Parent and bestFruit.Parent.Parent and bestFruit.Parent.Parent.Name or "?"
        local weight = bestFruit:FindFirstChild("Weight") and bestFruit.Weight.Value or 0
        local roundedWeight = math.round(weight)
        local mutationList = {}
        for _, mut in ipairs(Data.MutationHandler:GetPlantMutations(bestFruit)) do
            table.insert(mutationList, mut.Name)
        end
        local variantValue = bestFruit:FindFirstChild("Variant")
        if variantValue and variantValue:IsA("StringValue") then
            table.insert(mutationList, tostring(variantValue.Value))
        end
        local mutationStr = #mutationList > 0 and table.concat(mutationList, ", ") or "None"
        Data.BestPall = bestOwnerName
        Data.NameAll = fruitName
        Data.WeightAll = roundedWeight
        Data.AllMuta = mutationStr
        Data.BestAll = FormatNumber(bestValue)
    else
        NotifyHub("[Best Fruit - ALL FARMS] No fruit found.")
    end
end



local function createSimplePetEsp(object, petName)
            local hl = Instance.new("Highlight")
			hl.Name = "EggESP"
			hl.Adornee = object
			hl.FillColor = Color3.fromRGB(255, 200, 100)
			hl.FillTransparency = 0.25
			hl.OutlineColor = Color3.fromRGB(255, 255, 255)
			hl.OutlineTransparency = 0
			hl.Parent = object

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "PetESP_Simple"
	billboard.Adornee = object
	billboard.Size = UDim2.new(0, 150, 0, 30)
	billboard.StudsOffset = Vector3.new(0, 2, 0)
	billboard.AlwaysOnTop = true

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -10, 1, -10)
label.Position = UDim2.new(0, 5, 0, 5)
label.BackgroundTransparency = 0.6
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.Text = petName or "Not Ready"
label.TextColor3 = Color3.fromRGB(0, 255, 0)
label.TextStrokeColor3 = Color3.fromRGB(0, 100, 0)
label.TextStrokeTransparency = 0
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.TextWrapped = true
label.Parent = billboard
billboard.Parent = object

end

local function removeSimplePetEsp(object)
    -- Hapus Highlight jika ada
    local highlight = object:FindFirstChild("EggESP")
    if highlight and highlight:IsA("Highlight") then
        highlight:Destroy()
    end

    -- Hapus BillboardGui jika ada
    local billboard = object:FindFirstChild("PetESP_Simple")
    if billboard and billboard:IsA("BillboardGui") then
        billboard:Destroy()
    end
end

local EspBool = false

local function checkPet()
    local success, result = pcall(function()
        for _, object in pairs(Data.collectionService:GetTagged("PetEggServer")) do
            if object:GetAttribute("OWNER") then
                local objectId = object:GetAttribute("OBJECT_UUID")
                local petName = eggPets[objectId] or "Unready"

                if EspBool then
                    -- Buat ESP jika belum ada
                    if not object:FindFirstChild("EggESP") then
                        table.insert(DongoPet, petName)
                        createSimplePetEsp(object, petName)
                    end
                else
                    -- Hapus ESP jika ada
                    removeSimplePetEsp(object)
                end
            end
        end
        return true
    end)

    if not success then
        warn("CheckForTargetPet Error: " .. tostring(result))
        return false
    end

    return result
end

function GetEgg()
    local Ladang = GetFarm()
    local ObjLadang = Ladang:WaitForChild("Important"):WaitForChild("Objects_Physical")
    return #ObjLadang:GetChildren()
end


local Home1 = Tab1:AddSection("Auto") 
Home1:AddButton({
Title = "Button", 
Callback = function()
print("jawa") 
end
})

local Event1 = Tab2:AddSection("Cooking Event")
Data.AutoSHP = false
Event1:AddToggle("ASHP",{
Title = "Auto Submit Held Plant",
Description = "Cooking Pot",
Default = false,
Callback = function(Value)
Data.AutoSHP = Value
if Value then
task.spawn(function()
while Data.AutoSHP do
local folderChar = workspace:FindFirstChild(Data.LocalPlayer.Name)
if folderChar then
for _, item in ipairs(folderChar:GetChildren()) do
if item:GetAttribute("b") == "j" then
Data.CookingPotService_RE:FireServer("SubmitHeldPlant")
task.wait(0.1)
end
end
end
task.wait(0.1) 
end
end)
else
Data.AutoSHP = false
end
end
})

Data.AutoSCK = false
Event1:AddToggle("ASCOK",{
Title = "Auto Start Cooking",
Description = "Cooking Pot",
Default = false,
Callback = function(Value)
Data.AutoSCK = Value
if Value then
task.spawn(function()    
while Data.AutoSCK do
task.wait(0.1) 
Data.CookingPotService_RE:FireServer("CookBest")
task.wait(0.1) 
end
end)
else
Data.AutoSCK = false
end
end
})

Data.AutoSCF = false
Event1:AddToggle("ASCLA",{
Title = "Auto Claim Food",
Description = "Cooking Pot",
Default = false,
Callback = function(Value)
Data.AutoSCF = Value
if Value then
task.spawn(function()    
while Data.AutoSCF do
local agg = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CookingTimerBB"):WaitForChild("Timer").Text
if string.find(tostring(agg), "Ready") then
Data.CookingPotService_RE:FireServer("GetFoodFromPot")
task.wait(0.1) 
end
task.wait(0.1)
end
end) 
else
Data.AutoSCF = false
end
end
})

Data.AutoSHF = false
Event1:AddToggle("ASHF",{
Title = "Auto Submit Held Food",
Description = "Pig Chef",
Default = false,
Callback = function(Value)
Data.AutoSHF = Value
if Value then
task.spawn(function()
local folderCharw = workspace:FindFirstChild(Data.LocalPlayer.Name)
while Data.AutoSHF do
if folderCharw then
for _, item in ipairs(folderCharw:GetChildren()) do
if item:GetAttribute("b") == "u" then
Data.SubmitFoodService_RE:FireServer("SubmitHeldFood")
task.wait(0.1)
end
end
end
task.wait(0.1) 
end
end)
else
Data.AutoSHF = false
end
end
})

local Farm1 = Tab3:AddSection("Auto Plant Seed")
Farm1:AddDropdown("SeAPS", {
Title = "Select: Seed",
Description = "Seed Target",
Values = Data.FruitList, 
Default = nil,
Multi = false,
AllowNull = true, 
Callback = function(Value)
Data.SelectedPlantSeed = Value
end
})

Data.PlantUto = false
Farm1:AddToggle("APS",{
Title = "Auto Plant",
Description = "Stacked",
Default = false,
Callback = function(Value)
        Data.PlantUto = Value
        if Value then
            if not Data.SelectedPlantSeed then
                NotifyHub("Please select a seed first!")
                return
            end
            local Character = Data.LocalPlayer.Character or Data.LocalPlayer.CharacterAdded:Wait()
            local foundTool = nil
            for _, item in ipairs(Data.Backpack:GetChildren()) do
                if item:IsA("Tool") and string.find(item.Name, Data.SelectedPlantSeed) and string.find(item.Name, "Seed") then
                    foundTool = item
                    break
                end
            end
            if not foundTool then
                NotifyHub("[Auto Plant] Seed not found: " .. Data.SelectedPlantSeed)
                return
            end
            Data.Humanoid:EquipTool(foundTool)
            task.spawn(function()
                while Data.PlantUto do
                    local HRP = Character:FindFirstChild("HumanoidRootPart")
                    if HRP then
                        Data.PlantRE:FireServer(HRP.Position, Data.SelectedPlantSeed)
                    end
                    task.wait(0.01)
                end
            end)
        else
            Data.PlantUto = false
        end
    end
})

local Farm2 = Tab3:AddSection("Auto Watering Can")
local WaterCa = false
local WtrDelay = 0.1
local function EquipWateringCan()
    if Data.Backpack then
        for _, tool in ipairs(Data.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.Name:lower():find("watering") then
                tool.Parent = Data.LocalPlayer.Character
                task.wait(0.01)
                break
            end
        end
    end
end

Farm2:AddSlider("DWTC", {
    Title       = "Watering Speed",
    Description = "Set Your Speed",
    Min         = 0.1,      
    Max         = 100,  
    Default     = 0.1,
    Rounding = 1,
    Callback    = function(Value)
    WtrDelay = tonumber(Value) 
    end
})

Farm2:AddToggle("AWTC",{
Title = "Auto Watering Can",
Description = "Stacked",
Default = false,
Callback = function(Value)
        WaterCa = Value
        if Value then
            task.spawn(function()
                while WaterCa do
                    local Character = Data.LocalPlayer.Character or Data.LocalPlayer.CharacterAdded:Wait()
                    local HRP = Character:FindFirstChild("HumanoidRootPart")
                    if HRP then
                        EquipWateringCan()
                        local belowPos = HRP.Position - Vector3.new(0, 3, 0)
                        Data.WaterRE:FireServer(belowPos)
                    end
                    task.wait(WtrDelay)
                end
            end)
            else
            WaterCa = false
        end
    end
})

local Farm3 = Tab3:AddSection("Auto Collect Fruit")
local MaxWeight = nil
Farm3:AddDropdown("SeACF", {
Title = "Filter: Fruit",
Description = "Fruit Target",
Values = Data.FruitList, 
Default = {},
Multi = true, 
Callback = function(Value)
Data.SelectedPlant = type(Value) == "table" and Value or { Value }	
end
})

Farm3:AddDropdown("SMTF", {
Title = "Filter: Mutation",
Description = "Mutation Target",
Values = Data.ListMutation, 
Default = {},
Multi = true, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedMuta = type(Value) == "table" and Value or { Value }
end
})

Farm3:AddInput("FilterWKG",{
Title = "Filter: Weight",
Description = "Below KG",
Placeholder = "100",
Numeric = true,
Finished = true,
Callback = function(Value)
MaxWeight = tonumber(Value) 
end
})

Farm3:AddToggle("ACF",{
Title = "Auto Collect",
Description = "Fruit",
Default = false,
Callback = function(Value)
AutoCollectBtn = Value
if Value then        
        local MyFarm = GetFarm()
        local MyPlant = MyFarm and MyFarm.Important:FindFirstChild("Plants_Physical")
        task.spawn(function()
            while AutoCollectBtn do
                if not MyPlant then
                    task.wait(1)
                    MyFarm = GetFarm()
                    MyPlant = MyFarm and MyFarm.Important:FindFirstChild("Plants_Physical")
                    continue
                end
                for _, pohon in ipairs(MyPlant:GetChildren()) do
                    if not AutoCollectBtn then break end
                    local fruits = pohon:FindFirstChild("Fruits")
                    if fruits then
                        for _, fruitModel in ipairs(fruits:GetChildren()) do
                            if not AutoCollectBtn then break end
                            for _, part in ipairs(fruitModel:GetChildren()) do
                                if not AutoCollectBtn then break end
                                local prompt = part:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if prompt and prompt.Enabled then
                                    local model = prompt:FindFirstAncestorOfClass("Model")
                                    if model then
                                        local allowPlant = (#Data.SelectedPlant == 0 or table.find(Data.SelectedPlant, model.Name))
                                        local allowMutation = false
                                        local mutations = Data.MutationHandler:GetPlantMutations(model)
                                        if #Data.SelectedMuta == 0 then
                                            allowMutation = true
                                        else
                                            for _, mut in ipairs(mutations) do
                                                if table.find(Data.SelectedMuta, mut.Name) then
                                                    allowMutation = true
                                                    break
                                                end
                                            end
                                        end
                                        local weightOK = true
                                        local weightVal = model:FindFirstChild("Weight")
                                        if MaxWeight and weightVal and weightVal:IsA("NumberValue") then
                                            weightOK = tonumber(weightVal.Value) < tonumber(MaxWeight) 
                                        end
                                        if allowPlant and allowMutation and weightOK then
                                            game:GetService("ReplicatedStorage").ByteNetReliable:FireServer(
                                                buffer.fromstring("\001\001\000\001"),
                                                { model }
                                            )
                                            task.wait(0.01)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.01)
                end
                task.wait(0.01)
            end
        end)
        else
        AutoCollectBtn = false
end
end
})

local Farm4 = Tab3:AddSection("Auto Shovel")
local function isEquipShovel()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
    local char = player.Character
    if not char then return nil end

    for _, obj in ipairs(char:GetChildren()) do
        if obj:IsA("Tool") then
            -- case-insensitive cek substring "shovel"
            if string.find(string.lower(obj.Name), "shovel") then
                return obj
            end
        end
    end
    return nil
end

Farm4:AddDropdown("SACF4", {
Title = "Filter: Fruit",
Description = "Fruit Target",
Values = Data.FruitList, 
Default = {},
Multi = true, 
Callback = function(Value)
Data.RemoveFruit = type(Value) == "table" and Value or { Value }
end
})

Farm4:AddInput("FWKG4",{
Title = "Filter: Weight",
Description = "Below KG",
Placeholder = "100",
Numeric = true,
Finished = true,
Callback = function(Value)
Data.RemoveWeight = tonumber(Value) 
end
})

Farm4:AddToggle("ASHVF",{
Title = "Auto Remove Fruit",
Description = "Shovel Fruit",
Default = false,
Callback = function(Value)
        Data.AutoRemoveFruit = Value
        if Value then
            if not Data.RemoveFruit then
                NotifyHub("Please Select Fruit Filter")
                return
            end
            if not Data.RemoveWeight then
                NotifyHub("Please Input Weight Filter")
                return
            end

            task.spawn(function()
                while Data.AutoRemoveFruit do
                    -- tangkap semua error agar loop tetap jalan
                    local ok, err = xpcall(function()
                        local MyFarm = GetFarm()
                        if not MyFarm then return end

                        local Plants = MyFarm:FindFirstChild("Important")
                                      and MyFarm.Important:FindFirstChild("Plants_Physical")
                        if not Plants then return end

                        for _, pohon in ipairs(Plants:GetChildren()) do
                            if not Data.AutoRemoveFruit then break end
                            local fruits = pohon:FindFirstChild("Fruits")
                            if not fruits then continue end

                            for _, fruitModel in ipairs(fruits:GetChildren()) do
                                if not Data.AutoRemoveFruit then break end

                                -- cari ProximityPrompt
                                local prompt = fruitModel:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if not prompt then continue end

                                local model = prompt:FindFirstAncestorOfClass("Model")
                                if not model then continue end
                                if model:FindFirstChild("LockBillboardGui", true) then continue end

                                -- cek filter nama
                                local allowPlant = (#Data.RemoveFruit == 0)
                                                   or table.find(Data.RemoveFruit, model.Name)

                                -- cek berat dengan safe-guard
                                local weightOK = true
                                local weightVal = model:FindFirstChild("Weight")
                                if Data.RemoveWeight and weightVal and weightVal:IsA("NumberValue") then
                                    weightOK = (weightVal.Value < Data.RemoveWeight)
                                end

                                -- eksekusi shovel
                                if allowPlant and weightOK then
                                    if not isEquipShovel() then
                                    EquipSingle("Shovel")
                                    end
                                    task.wait(0.01)
                                    Data.GameEvents.Remove_Item:FireServer(prompt.Parent)
                                end
                            end
                        end
                    end, function(err)
                        -- error handler: log dan kirim notif
                        warn("[AutoRemoveFruit] Error: "..tostring(err))
                        NotifyHub("AutoRemoveFruit Error: "..tostring(err))
                    end)

                    -- meski ok==false, kita tunggu dulu sebelum iterasi lagi
                    task.wait(0.01)
                end
            end)
        else
            Data.AutoRemoveFruit = false
        end
end
})

local Farm5 = Tab3:AddSection("Seed Pack/Chest")
Data.SelectedSeedPack = nil
Farm5:AddDropdown("SeSP", {
Title = "Select: Seed Pack/Chest",
Description = "Target",
Values = Data.PackList, 
Default = nil,
Multi = false, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedSeedPack = Value
end
})

Data.AutoKC = false
Farm5:AddToggle("OPNSPC",{
Title = "Auto Open Seed Pack/Chest",
Description = "Selected Target",
Default = false,
Callback = function(Value)
    Data.AutoKC = Value
    if Value then
    task.spawn(function()
    while Data.AutoKC do
    Data.ButSkip = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RollCrate_UI")
    for _, item in ipairs(Data.Backpack:GetChildren()) do
    if not Data.AutoKC then break end
    local ahm = item:GetAttribute("n")
    if item:GetAttribute("b") == "a" and string.find(tostring(ahm), Data.SelectedSeedPack) and not Data.ButSkip.Enabled then
    Data.Humanoid:EquipTool(item)
    task.wait(0.1)
    click()
    task.wait(0.05) 
    EquipSingle("Shovel")
    task.wait(0.05) 
    end
    end
    task.wait(0.15)
    end
    end)
    else
    Data.AutoKC = false
    end
end
})

Data.AutoSkipA = false
Farm5:AddToggle("ASKP",{
Title = "Auto Skip",
Description = "Pack/Chest",
Default = false,
Callback = function(Value)
        Data.AutoSkipA = Value
        Data.GuiService.AutoSelectGuiEnabled = false
        Data.GuiService.SelectedObject = nil
        if Value then
            task.spawn(function()
                while Data.AutoSkipA do
                local obj = game:GetService("Players").LocalPlayer.PlayerGui.RollCrate_UI.Frame.Skip
                            if obj and obj:IsA("ImageButton") and obj.Visible and obj.Active then
                                Data.GuiService.SelectedObject = obj
                                Data.VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                Data.VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                    task.wait()
                end
            end)
            else
            Data.AutoSkipA = false
            Data.GuiService.SelectedObject = nil
        end
end
})

local ACRK = false
local Farm6 = Tab3:AddSection("Auto Crafting")
Farm6:AddToggle("CrfC",{
Title = "Auto Craft Reclaimer",
Description = "Crafting Table",
Default = false,
Callback = function(Value)
        ACRK = Value
        if Value then
        task.spawn(function()
        while ACRK do
        Data.RemoteCraft:FireServer(
    "Claim",
    Data.ECWB,
    "GearEventWorkbench",
    1
)
task.wait(2)
        Data.RemoteCraft:FireServer("SetRecipe", ECWB, "GearEventWorkbench", "Reclaimer")
        task.wait(2)
        Data.RemoteCraft:FireServer(
    "InputItem",
    Data.ECWB,
    "GearEventWorkbench",
    1,
    {
        ItemType = "PetEgg",
        ItemData = {
            UUID = ScanUUID("Common Egg")
        }
    }
)
task.wait(2)
Data.RemoteCraft:FireServer(
    "InputItem",
    Data.ECWB,
    "GearEventWorkbench",
    2,
    {
        ItemType = "Harvest Tool",
        ItemData = {
            UUID = ScanUUID("Harvest Tool")
        }
    }
)
task.wait(2)
Data.RemoteCraft:FireServer(
    "Craft",
    Data.ECWB,
    "GearEventWorkbench"
)
NotifyHub("Waiting 25 Minutes...")
task.wait(1515)
Data.RemoteCraft:FireServer(
    "Claim",
    Data.ECWB,
    "GearEventWorkbench",
    1
)
NotifyHub("Continue Craft Reclaimer...")
task.wait(2)
        end
        end)
        else
       ACRK = false 
        end
end
})

local Farm7 = Tab3:AddSection("Auto Gift")
Data.SelectedGiftFruit = nil
function GetPlayers()
    local players = {}
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer then
            table.insert(players, plr.Name)
        end
    end
    return players
end

local Sply = Farm7:AddDropdown("SelectPly", {
Title = "Select: Player",
Description = "Target Player",
Values = {}, 
Multi = false, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedPlayerGift = Value
end
})

Farm7:AddDropdown("SGiftF", {
Title = "Select: Gift Fruit",
Description = "Target Fruit",
Values = Data.FruitList, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedGiftFruit = type(Value) == "table" and Value or { Value }
end
})

Farm7:AddButton({
Title = "Refresh Player", 
Callback = function()
Sply:SetValues(GetPlayers()) 
Sply:SetValue(nil) 
end
})

local DelayLP = 0.1
local AutoGift = false
local Tsdj = Farm7:AddToggle("ATGF",{
Title = "Auto Gift Fruit",
Description = "Player",
Default = false,
Callback = function(Value)
        AutoGift = Value   
        if Value then
            task.spawn(function()
                while AutoGift do
                    local PlayerModel = workspace:FindFirstChild(Data.SelectedPlayerGift)
                    if not PlayerModel then
                        NotifyHub("[Auto Gift] Player not found in workspace")
                        task.wait(1)
                        continue
                    end

                    local myChar = Data.LocalPlayer.Character or Data.LocalPlayer.CharacterAdded:Wait()
                    local HRP = myChar:FindFirstChild("HumanoidRootPart")
                    local targetHRP = PlayerModel:FindFirstChild("HumanoidRootPart")
                    if targetHRP and HRP and (HRP.Position - targetHRP.Position).Magnitude > 10 then
                        HRP.CFrame = targetHRP.CFrame * CFrame.new(2, 0, 0)
                        task.wait(0.5)
                    end

                    local prompt = nil
                    for _, desc in ipairs(PlayerModel:GetDescendants()) do
                        if desc:IsA("ProximityPrompt") then
                            prompt = desc
                            break
                        end
                    end

                    if not prompt then
                        NotifyHub("[Auto Gift] No valid ProximityPrompt found.")
                        task.wait(1)
                        continue
                    end

                    local GiftedFruit = {} -- Simpan buah yang sudah digift
                    for _, item in ipairs(Data.Backpack:GetChildren()) do
                        if not AutoGift then break end
                        for _, name in ipairs(Data.SelectedGiftFruit) do
                            Data.FruitTrib = item:GetAttribute("f")
                            Data.FruitUuid = item:GetAttribute("c")
                            Data.Btext = item:GetAttribute("b")
                            if string.find(tostring(Data.FruitTrib), name)
                                and Data.Btext == "j"
                                and not GiftedFruit[Data.FruitUuid] then
                                Data.Humanoid:EquipTool(item)
                                GiftedFruit[Data.FruitUuid] = true -- Tandai sudah digift            
                                task.wait(.05)
                                fireproximityprompt(prompt)
                                task.wait(.05)                                
                            end
                        end
                    end

                    task.wait(DelayLp) -- delay antar loop utama
                end
            end)
            else
            AutoGift = false
        end
end
})

Farm7:AddSlider("DATGC", {
    Title       = "Gift Speed Loop",
    Description = "Gift Speed Loop",
    Min         = 0.1,      
    Max         = 100,  
    Default     = 0.1,
    Rounding = 1,
    Callback    = function(Value)
    DelayLP = tonumber(Value)
    end
})

local ForceLp = false
Farm7:AddToggle("PSAG",{
Title = "Prevent Stopped",
Description = "Auto Gift",
Default = false,
Callback = function(Value)
ForceLp = Value
    if Value then
    task.spawn(function() 
    while ForceLp do
    Tsdj:SetValue(false)
    task.wait(1)
    Tsdj:SetValur(true)
    task.wait(DelayLp)
    end
    end) 
    else 
    ForceLp = false
    end
end
})

local AutoGiftAccept = false
Farm7:AddToggle("AAGA",{
Title = "Auto Accept Gift",
Description = "Accept All Gift",
Default = false,
Callback = function(Value)
AutoGiftAccept = Value
        if Value then
            task.spawn(function()
            local GuiService = game:GetService("GuiService")
            local VIM = game:GetService("VirtualInputManager")
            GuiService.AutoSelectGuiEnabled = false
            GuiService.SelectedObject = nil
                while AutoGiftAccept do
                    local GiftUI = Data.Players.LocalPlayer:FindFirstChild("PlayerGui")
                        and Data.Players.LocalPlayer.PlayerGui:FindFirstChild("Gift_Notification")
                    if GiftUI then
                        for _, obj in ipairs(GiftUI:GetDescendants()) do
                            if obj:IsA("ImageButton") and obj.Name == "Accept" and obj.Visible and obj.Active then
                                GuiService.SelectedObject = obj
                                VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                task.wait(0.08)
                                break
                            end
                        end
                    end
                    task.wait(0.08)
                end
            end)
            else
            AutoGiftAccept = false
        end
end
})

local Farm8 = Tab3:AddSection("Auto Selling")
local TimerSL = 60
Farm8:AddSlider("TMSL", {
    Title       = "Timer: Auto Sell",
    Description = "In Minutes",
    Min         = 1,      
    Max         = 100,  
    Default     = 1,
    Rounding = 0,
    Callback    = function(Value)
    local bjhg = tonumber(Value) 
    TimerSL = tonumber(bjhg) 
    end
})

local ASIIK = false
Farm8:AddToggle("ASTM",{
Title = "Auto Sell Inventory",
Description = "Timer",
Default = false,
Callback = function(Value)
ASIIK = Value
if Value then
        task.spawn(function()
            while ASIIK do
                local root = Data.LocalPlayer.Character and Data.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local originalPos = root and root.CFrame
                Teleport(CFrame.new(86.58, 3.00, 0.43))
                task.wait(1.5)
                game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
                task.wait(1.5)
                if originalPos then
                    Teleport(originalPos)
                end
                task.wait(TimerSL)
            end
        end)
        else
        ASIIK = false
        end
end
})

local Farm9 = Tab3:AddSection("Sprinklers")
Data.pl = game:GetService("Players").LocalPlayer
Data.cam = workspace.CurrentCamera
Data.uis = game:GetService("UserInputService")
Data.rs = game:GetService("ReplicatedStorage")
Data.cs = game:GetService("CollectionService")
Data.del = Data.rs:WaitForChild("GameEvents"):WaitForChild("DeleteObject")
Data.rem = Data.rs:WaitForChild("GameEvents"):WaitForChild("Remove_Item")
Data.getFarm = require(Data.rs.Modules.GetFarm)

function isSpr(name)
	return name:lower():find("sprinkler")
end

function ray(pos)
	Data.r = Data.cam:ViewportPointToRay(pos.X, pos.Y)
	Data.p = RaycastParams.new()
	Data.p.FilterType = Enum.RaycastFilterType.Exclude
	Data.p.FilterDescendantsInstances = {Data.cs:GetTagged("ShovelIgnore")}
	return workspace:Raycast(Data.r.Origin, Data.r.Direction * 500, Data.p)
end

function delSpr(pos)
	Data.hit = ray(pos)
	if not Data.hit then return end
	Data.m = Data.hit.Instance:FindFirstAncestorWhichIsA("Model") or Data.hit.Instance
	if not Data.m or not isSpr(Data.m.Name) then return end
	Data.f = Data.getFarm(Data.pl)
	if not Data.f or not Data.hit.Instance:IsDescendantOf(Data.f) then return end
	if Data.cs:HasTag(Data.m, "PlaceableObject") then
		Data.del:FireServer(Data.m)
	else
		Data.rem:FireServer(Data.hit.Instance)
	end
end

Data.DeleteMode = false
Data.InputConn = nil

Farm9:AddToggle("APSPK",{
Title = "Auto Place Sprinklers",
Description = "All Sprinkler On Backpack",
Default = false,
Callback = function(Value)
if Value then
    task.spawn(function() 
        for _, v in pairs(Data.Backpack:GetChildren()) do
        print(v.Name) 
        Data.SprinkPos = Data.HRP.Position
        Data.CreateSprink = CFrame.new(Data.SprinkPos)
        if string.find(tostring(v.Name), "Sprinkler") then
        Data.Humanoid:EquipTool(v)
        task.wait(0.1) 
        Data.SprinklerRE:FireServer("Create", Data.CreateSprink)
        task.wait(0.1)
        end
        end
        end)
    end
end
})

Farm9:AddToggle("SVSP",{
Title = "Shovel Sprinkler",
Description = "Manual",
Default = false,
Callback = function(Value)
        Data.DeleteMode = Value
        if Value then
            NotifyHub("Equip Shovel and Click Sprinklers")
            Data.InputConn = {
                Touch = nil,
                Mouse = nil,
            }
            if Data.uis.TouchEnabled then
                Data.InputConn.Touch = Data.uis.TouchTapInWorld:Connect(function(pos)
                    delSpr(pos)
                end)
            end
            Data.InputConn.Mouse = Data.uis.InputBegan:Connect(function(input, gp)
                if not gp and input.UserInputType == Enum.UserInputType.MouseButton1 then
                    delSpr(Data.uis:GetMouseLocation())
                end
            end)
        else
            if Data.InputConn then
                if Data.InputConn.Touch then
                    Data.InputConn.Touch:Disconnect()
                end
                if Data.InputConn.Mouse then
                    Data.InputConn.Mouse:Disconnect()
                end
                Data.InputConn = nil
                Data.DeleteMode = false
            end
        end
    end
})

local Farm10 = Tab3:AddSection("Calculate")
local IVvl = Farm10:AddParagraph ({
	Title = "Inventory Value", 
	Content = "$"..Data.Inven, 
}) 

Farm10:AddButton({
Title = "Calculate Inventory", 
Callback = function()
    task.spawn(function() 
    local value = require(game:GetService("ReplicatedStorage").Modules.CalculatePlantValue)
    local total = 0
for _, item in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if item:GetAttribute("b") and item:GetAttribute("b") == "j" then
local juml = value(item) or 0
total = total + juml
Data.Inven = total
end
end
IVvl:SetDesc("$"..FormatNumber(Data.Inven))
end)
end
})

local BFIF = Farm10:AddParagraph ({
	Title = "Best Fruit in Farm", 
	Content = "Name: "..Data.NameFarm.."\nWeight: "..Data.WeightFarm.." KG\nValue: $"..Data.BestFarm.. "\nMutation: "..Data.FarmMuta,
})

Farm10:AddButton({
Title = "Scan Farm", 
Callback = function()
ScanBestFarm()
task.wait(0.1)
BFIF:SetDesc("Name: "..Data.NameFarm.."\nWeight: "..Data.WeightFarm.." KG\nValue: $"..Data.BestFarm.. "\nMutation: "..Data.FarmMuta)
end
})

local BFIS = Farm10:AddParagraph ({
	Title = "Best Fruit In Server", 
	Content = "Player: "..Data.BestPall.."\nName: "..Data.NameAll.."\nWeight: "..Data.WeightAll.." KG\nValue: $"..Data.BestAll.."\nMutation: "..Data.AllMuta, 
}) 

Farm10:AddButton({
Title = "Scan Server", 
Callback = function()
ScanBestAll()
task.wait(0.1)
BFIS:SetDesc("Player: "..Data.BestPall.."\nName: "..Data.NameAll.."\nWeight: "..Data.WeightAll.." KG\nValue: $"..Data.BestAll.."\nMutation: "..Data.AllMuta) 
end
})

local Pet1 = Tab4:AddSection("Auto Feed Pet")
local ssddf = Pet1:AddDropdown("SAFP", {
Title = "Select: Pet Target",
Description = "Refresh First",
Values = {}, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
        Data.SelectedPets = {}

        local selectedNames = (typeof(Value) == "table") and Value or {Value}
        local copy = {}
        for i, v in ipairs(Data.PetListData) do
            copy[i] = { Name = v.Name, UUID = v.UUID, used = false }
        end

        for _, selectedName in ipairs(selectedNames) do
            for i, pet in ipairs(copy) do
                if pet.Name == selectedName and not pet.used then
                    table.insert(Data.SelectedPets, {
                        Name = pet.Name,
                        UUID = pet.UUID
                    })
                    pet.used = true
                    break
                end
            end
        end
    end
})

Pet1:AddButton({
Title = "Refresh Pet List", 
Callback = function()
        Data.PetListData = {}
        Data.petReal = {}
        local Empty = {}
        local ijh = 1
        local framet = game:GetService("Players").LocalPlayer.PlayerGui.ActivePetUI.Frame.Main.ScrollingFrame
        for _, obj in ipairs(framet:GetChildren()) do
            if not string.find(obj.Name, "Template") then
                local petNameLabel = obj:FindFirstChild("PET_TYPE")
                if petNameLabel and petNameLabel:IsA("TextLabel") then
                    local petName = petNameLabel.Text
                    local uuid = obj.Name

                    table.insert(Data.PetListData, {
                        Name = petName,
                        UUID = uuid
                    })

                    table.insert(Data.petReal, petName.." ("..ijh..")")
                    ijh += 1
                end
            end
        end
        task.wait(.1)
        ssddf:SetValues(Data.petReal)
        ssddf:SetValue(Empty) 
    end
})

Pet1:AddDropdown("SFFTF", {
Title = "Select: Fruit Feed",
Description = "Target Fruit",
Values = Data.FruitList, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
if type(Value) == "table" then
Data.SelectedFruit= Value
else
Data.SelectedFruit = {Value}
end
end
})

local DelayFeed = 1
Pet1:AddInput("DLYF",{
Title = "Delay: Auto Feed",
Description = "In Minutes",
Default = "1", 
Placeholder = "1",
Numeric = true,
Finished = true,
Callback = function(Value)
local ffghj = tonumber(Value) 
DelayFeed = tonumber(ffghj)
end
})

local AutoFeedEnabled = false
Pet1:AddToggle("ATFSP",{
Title = "Auto Feed",
Description = "Selected Pet",
Default = false,
Callback = function(Value)
AutoFeedEnabled = Value
        if AutoFeedEnabled then
        if not DelayFeed then
        NotifuHub("Please Set Delay Auto Feed") 
        return
        end
            task.spawn(function()
                while AutoFeedEnabled do
                    if #Data.SelectedPets > 0 and Data.SelectedFruit and #Data.SelectedFruit > 0 then
                        for _, petData in ipairs(Data.SelectedPets) do
                            local petName = petData.Name
                            local uuid = petData.UUID
                            for _, fruitName in ipairs(Data.SelectedFruit) do
                                local foundTool = nil
                                for _, tool in ipairs(Data.Backpack:GetChildren()) do
                                    if tool:IsA("Tool")
                                    and string.find(tool.Name, fruitName)
                                    and not string.find(tool.Name, "Seed")
                                    and not string.find(tool.Name, "Blood Kiwi") then
                                        foundTool = tool
                                        break
                                    end
                                end
                                if foundTool then
                                    Data.Humanoid:EquipTool(foundTool)
                                    task.wait(0.3)
                                    Data.ReplicatedStorage.GameEvents.ActivePetService:FireServer("Feed", uuid)
                                    print("✅ Feeding", petName, "UUID:", uuid)
                                    task.wait(0.3)
                                    break
                                end
                            end
                        end
                    end
                    task.wait(DelayFeed)
                end
            end)
            else
           AutoFeedEnabled = false      
        end
end
})

local AutoPickupEnabled = false
Pet1:AddToggle("APPSP",{
Title = "Auto Pickup Pet",
Description = "Selected Pet",
Default = false,
Callback = function(Value)
        AutoPickupEnabled = Value
        if AutoPickupEnabled and #Data.SelectedPets > 0 then
            task.spawn(function()
                for _, selected in ipairs(Data.SelectedPets) do
                    local uuid = selected.UUID
                    local name = selected.Name

                    local args = {
                        [1] = "UnequipPet",
                        [2] = uuid
                    }

                    Data.ReplicatedStorage.GameEvents.PetsService:FireServer(unpack(args))
                    NotifyHub("Pickup " .. name)
                    task.wait(0.1)
                end

                AutoPickupEnabled = false
            end)
        end
    end
})

local Pet2 = Tab4:AddSection("Hatch Egg")
local AutoPlcEgg = false
local MaxEggSlot = 3
local function RandomPlace()
    local MyFarmCeleng = GetFarm()
    local PlantLocations = MyFarmCeleng:WaitForChild("Important"):WaitForChild("Plant_Locations")
    if not PlantLocations then return end

    local Lands = PlantLocations:GetChildren()
    if #Lands == 0 then return end

    local Land = Lands[math.random(1, #Lands)]
    local Center = Land.Position
    local Size = Land.Size

    local X = math.random(Center.X - Size.X / 2, Center.X + Size.X / 2)
    local Z = math.random(Center.Z - Size.Z / 2, Center.Z + Size.Z / 2)

    return Vector3.new(X, Land.Position.Y, Z)
end

local function FindMatchingTool()
    local function isMatch(name)
        local baseName = name:match("^(.-) x") or name
        baseName = baseName:lower():gsub("%s+", "")
        for _, eggName in ipairs(SelectedHatchPet) do
            local target = tostring(eggName):lower():gsub("%s+", "")
            if baseName == target then
                return true
            end
        end
        return false
    end

    for _, tool in ipairs(Data.Backpack:GetChildren()) do
        if tool:IsA("Tool") and isMatch(tool.Name) then
            return tool
        end
    end

    local charFolder = workspace[Data.LocalPlayer.Name]
    if charFolder then
        for _, obj in ipairs(charFolder:GetDescendants()) do
            if obj:IsA("Tool") and isMatch(obj.Name) then
                return obj
            end
        end
    end

    return nil
end

Pet2:AddDropdown("SEGGH", {
Title = "Select: Egg",
Description = "Target",
Values = Data.EggList, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedHatchPet = typeof(Value) == "table" and Value or { Value }
end
})

Pet2:AddInput("MXEGG",{
Title = "Set: Max Slot Egg",
Description = "In Your Garden",
Placeholder = "3",
Numeric = true,
Finished = true,
Callback = function(Value)
MaxEggSlot = tonumber(Value) 
end
})

Pet2:AddToggle("APESJ",{
Title = "Auto Place Egg",
Description = "Selected",
Default = false,
Callback = function(Value)
        AutoPlcEgg = Value
        if Value then
            if not SelectedHatchPet or typeof(SelectedHatchPet) ~= "table" or #SelectedHatchPet == 0 then
                NotifyHub("Please Select egg to Auto Place")
                return
            end
            task.spawn(function()
                while AutoPlcEgg do
                    local eggCounted = GetEgg()
                    local placeded = 0
                    local foundAny = false
                    if eggCounted < MaxEggSlot then
                        local tool = FindMatchingTool()
                        while tool and eggCounted < MaxEggSlot do
                            if not AutoPlcEgg then return end
                            local PosEgg = RandomPlace()
                            foundAny = true
                            Data.Humanoid:EquipTool(tool)
                            task.wait(0.5)
                            Data.RemotePlace:FireServer("CreateEgg", PosEgg)
                            placeded += 1
                            eggCounted += 1
                            task.wait(0.5)
                            tool = FindMatchingTool()
                        end
                    end
                    if not foundAny and eggCounted < MaxEggSlot then
                        NotifyHub("No eggs in your inventory!")
                    end
                    task.wait(1)
                end
            end)
            else
            AutoPlcEgg = false
        end
    end
})

local AutoEPH = false
Pet2:AddToggle("AHEGS",{
Title = "Auto Hatch Egg",
Description = "Selected",
Default = false,
Callback = function(Value)
        AutoEPH = Value
        if Value then
            task.spawn(function()
                while AutoEPH do
                local Ladangs = GetFarm()
                local Object = Ladangs:WaitForChild("Important"):WaitForChild("Objects_Physical")
                    for _, desc in ipairs(Object:GetDescendants()) do
                        if desc:IsA("ProximityPrompt") and desc.Enabled and string.find(desc.ActionText, "Hatch") then
                            for _, eggName in ipairs(SelectedHatchPet) do
                                if string.find(tostring(desc.Parent), eggName) then
                                    local part = desc.Parent
                                    if part then
                                        local cf = part:IsA("Model") and part:GetPivot() or part.CFrame
                                        Teleport(cf)
                                        task.wait(0.5)
                                        fireproximityprompt(desc)
                                        task.wait(0.5)
                                        break
                                    end
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
            end)
            else 
            AutoEPH = false
        end
    end
})

local Pet3 = Tab4:AddSection("Auto Sell Pet")
Pet3:AddDropdown("SASPT", {
Title = "Select: Pet List",
Description = "Target Pet",
Values = Data.ListSellPet, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedSellPet = type(Value) == "table" and Value or { Value }
end
})

local TargetWS = 0
Pet3:AddInput("FWSBTK",{
Title = "Filter: Weight",
Description = "Sell Below This KG",
Placeholder = "5",
Numeric = true,
Finished = true,
Callback = function(Value)
TargetWS = Value
end
})

local TargetAge = 0
Farm4:AddInput("F",{
Title = "Filter: Age",
Description = "Sell Below This Age",
Placeholder = "0",
Numeric = true,
Finished = true,
Callback = function(Value)
TargetAge = Value
end
})

local AutoSP = false
Pet3:AddToggle("ASPSPS",{
Title = "Auto Sell Pet",
Description = "Selected Pet",
Default = false,
Callback = function(Value)
        AutoSP = Value
        if Value then
            if not Data.SelectedSellPet or #Data.SelectedSellPet == 0 then
                NotifyHub("Please select at least one pet to sell!")
                TogSP:Set(false)
                return
            end
            task.spawn(function()
                while AutoSP do
                    for _, pet in ipairs(Data.Backpack:GetChildren()) do
                        local petName = pet.Name
                        if string.find(petName, "Age") and not pet:GetAttribute("d") then
                            local baseName = petName:match("^(.-) %[")
                            for _, targetName in ipairs(Data.SelectedSellPet) do
                                if baseName and baseName == targetName then
                                    local weightStr = petName:match("%[(%d+%.?%d*) KG%]")
                                    local ageStr = petName:match("%[Age (%d+)%]")
                                    local allowWeight = false
                                    local allowAge = false
                                    if not TargetWS or TargetWS == 0 then
                                        allowWeight = true
                                    elseif weightStr then
                                        local weightNum = tonumber(weightStr)
                                        if weightNum and weightNum < TargetWS then
                                            allowWeight = true
                                        end
                                    end
                                    if not TargetAge or TargetAge == 0 then
                                        allowAge = true
                                    elseif ageStr then
                                        local ageNum = tonumber(ageStr)
                                        if ageNum and ageNum <= TargetAge then
                                            allowAge = true
                                        end
                                    end
                                    if allowWeight and allowAge then
                                        Data.Humanoid:EquipTool(pet)
                                        task.wait(1)
                                        Data.SellPetRE:FireServer(pet)
                                        break
                                    end
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
            end)
        else
            AutoSP = false
        end
    end
})

local Pet4 = Tab4:AddSection("Pet Booster")
local SelectedBPets = {}
Pet4:AddDropdown("SPBT", {
Title = "Select: Pet List",
Description = "Target Pet",
Values = {}, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
        Data.SelectedBPets = {}

        local selectedNames = (typeof(Value) == "table") and Value or {Value}
        local copy = {}
        for i, v in ipairs(Data.PetListData) do
            copy[i] = { Name = v.Name, UUID = v.UUID, used = false }
        end

        for _, selectedName in ipairs(selectedNames) do
            for i, pet in ipairs(copy) do
                if pet.Name == selectedName and not pet.used then
                    table.insert(Data.SelectedBPets, {
                        Name = pet.Name,
                        UUID = pet.UUID
                    })
                    pet.used = true
                    break
                end
            end
        end
end
})

Pet4:AddButton({
Title = "Refresh Pet List", 
Callback = function()
        Data.PetListData = {}
        Data.petReal = {}
        local Empty = {}
        local ijhs = 1
        local framet = game:GetService("Players").LocalPlayer.PlayerGui.ActivePetUI.Frame.Main.ScrollingFrame
        for _, obj in ipairs(framet:GetChildren()) do
            if not string.find(obj.Name, "Template") then
                local petNameLabel = obj:FindFirstChild("PET_TYPE")
                if petNameLabel and petNameLabel:IsA("TextLabel") then
                    local petName = petNameLabel.Text
                    local uuid = obj.Name

                    table.insert(Data.PetListData, {
                        Name = petName,
                        UUID = uuid
                    })

                    table.insert(Data.petReal, petName.." ("..ijh..")")
                    ijhs += 1
                end
            end
        end
        task.wait(.1)
        ssddf:SetValues(Data.petReal)
        ssddf:SetValue(Empty) 
    end
})

Pet4:AddDropdown("SBTY", {
Title = "Select: Toy",
Description = "Target Toy",
Values = {"Small Pet Toy", "Medium Pet Toy", "Small Pet Treat", "Medium Pet Treat"}, 
Multi = false, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedToys = Value
end
})

Pet4:AddButton({
Title = "Apply Boost 1x", 
Callback = function()
task.spawn(function() 
for _, v in pairs(Data.SelectedBPets) do
local abcg = v.UUID
EquipSingle(tostring(Data.SelectedToys))
task.wait()
Data.PetBoost:FireServer("ApplyBoost", tostring(abcg))
end
end)
end
})

local DelayBoost = 60
Pet4:AddSlider("DAAPB", {
    Title       = "Apply Boost Delay",
    Description = "In Minutes",
    Min         = 1,      
    Max         = 100,  
    Default     = 1,
    Rounding = 0,
    Callback    = function(Value)
    local kmwn = tonumber(Value) 
    DelayBoost = tonumber(kmwn) * 60
    end
})

local AutoBoostPet = false
Pet4:AddToggle("AABP",{
Title = "Auto Apply Boost",
Description = "Selected Pet",
Default = false,
Callback = function(Value)
    AutoBoostPet = Value
    if Value then
task.spawn(function()
while AutoBoostPet do
for _, v in pairs(Data.SelectedBPets) do
local abcg = v.UUID
EquipSingle(tostring(Data.SelectedToys))
task.wait()
Data.PetBoost:FireServer("ApplyBoost", tostring(abcg))
end
task.wait(DelayBoost)
end
end)
else
AutoBoostPet = false
    end
end
})


local Shp1 = Tab5:AddSection("Zen Event Shop")
Shp1:AddDropdown("SZSHP", {
Title = "Select: Zen Shop",
Description = "Target Item",
Values = Data.ZenShop, 
Value = {},
Multi = true, 
AllowNull = true, 
Callback = function(Value)
if type(Value) == "table" then
            Data.SelectedEvent = Value
        else
            Data.SelectedEvent = {Value}
        end
end
})

local AutoBHon = false 
Shp1:AddToggle("ABESSI",{
Title = "Auto Buy Event Shop",
Description = "Selected Item",
Default = false,
Callback = function(Value)
AutoBHon = Value        
        if Value then
        local soundService = game:GetService("SoundService").Notification
        local notifFrame = game:GetService("Players").LocalPlayer.PlayerGui.Top_Notification.Frame
        if not Data.SelectedEvent then
            NotifyHub("Please Select Zen item")
            return
        end
            notifFrame.Visible = false
            soundService.Volume = 0
            task.spawn(function()
                while AutoBHon do
                    for _, item in pairs(Data.SelectedEvent) do
                        BuyEvent1(item)
                        task.wait(0.1)
                    end
                    task.wait(math.random(1, 2))
                end
            end)
        else
        AutoBHon = false
        local soundService = game:GetService("SoundService").Notification
        local notifFrame = game:GetService("Players").LocalPlayer.PlayerGui.Top_Notification.Frame
            notifFrame.Visible = true
            soundService.Volume = 0.5
        end
end
})

local Shp2 = Tab5:AddSection("Seed Shop")
Shp2:AddDropdown("SSSHP", {
Title = "Select: Seed Shop",
Description = "Target Seed",
Values = Data.SeedList, 
Value = {},
Multi = true, 
AllowNull = true, 
Callback = function(Value)
if type(Value) == "table" then
            Data.SelectedSeed = Value
        else
            Data.SelectedSeed = {Value}
        end
end
})

local SeedAuto = false
Shp2:AddToggle("ABSSS",{
Title = "Auto Buy Seed",
Description = "Selected Seed",
Default = false,
Callback = function(Value)
SeedAuto = Value
if Value then
    if not Data.SelectedSeed or #Data.SelectedSeed == 0 then
        NotifyHub("Please Select Seed to Auto Buy")
        return
    end
    task.spawn(function()
    while SeedAuto do
    for i = 1,10 do
    for _, item in pairs(Data.SelectedSeed) do
    BuySeed(item)
    task.wait() 
    end
    task.wait() 
    end
    task.wait(math.random(3, 5))
    end
    end) 
else
    SeedAuto = false
end
end
})



SaveManager:SetLibrary(Library)

if isfile(ConfigLod) then
SaveManager:Load(ConfigLod)
print("Auto Load Script") 
end

task.spawn(function()
while true do
task.wait(3) 
SaveManager:Save(ConfigLod)
NotifyHub("Auto Save")
end
end)

end

local StartLoad = tick() 
MainMenu()
local EndLoad = tick() - StartLoad
print(("Script Loaded in %.2f seconds"):format(EndLoad))
