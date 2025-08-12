


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
local Library, SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/jamalarap61/Mslspakwnendlsowjnssoaknana/main/wnsoaowknswlwksnwmk.lua"))()

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
    Title = "Server",
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
        Data.RemoteCraft:FireServer("SetRecipe", Data.ECWB, "GearEventWorkbench", "Reclaimer")
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

                    task.wait(DelayLP) -- delay antar loop utama
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
    Tsdj:SetValue(true)
    task.wait(DelayLP)
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

local Farm11 = Tab3:AddSection("Infinity Jump")
local infinityJumpEnabled = false
Data.UIS.JumpRequest:Connect(function()
    if infinityJumpEnabled and Data.LocalPlayer.Character and Data.LocalPlayer.Character:FindFirstChild("Humanoid") then
        Data.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Farm11:AddToggle("INFJUMP",{
Title = "Infinity Jump",
Description = "Enable/Disable",
Default = false,
Callback = function(Value)
if Value then
infinityJumpEnabled = true
else
infinityJumpEnabled = false
end
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
        NotifyHub("Please Set Delay Auto Feed") 
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
        for _, eggName in ipairs(Data.SelectedHatchPet) do
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

Pet2:AddDropdown("SHEGG", {
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
            if not Data.SelectedHatchPet or typeof(Data.SelectedHatchPet) ~= "table" or #Data.SelectedHatchPet == 0 then
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
                            for _, eggName in ipairs(Data.SelectedHatchPet) do
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


local Shp3 = Tab5:AddSection("Gear Shop")
Shp3:AddDropdown("SGSHPPP", {
Title = "Select: Gear Shop",
Description = "Target Gear",
Values = Data.GearList, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
if type(Value) == "table" then
            Data.SelectedGear = Value
        else
            Data.SelectedGear = {Value}
        end
end
})

local GearAuto = false
Shp3:AddToggle("ABGSGAAA",{
Title = "Auto Buy Gear",
Description = "Selected Gear",
Default = false,
Callback = function(Value)
GearAuto = Value
if Value then
    if not Data.SelectedGear or #Data.SelectedGear == 0 then
        NotifyHub("Please Select Gear to Auto Buy")
        return
    end
    task.spawn(function()
    while GearAuto do
    for i = 1,10 do
    for _, item in pairs(Data.SelectedGear) do
    BuyGear(item)
    task.wait() 
    end
    task.wait() 
    end
    task.wait(math.random(3, 5))
    end
    end) 
else
    GearAuto = false
end
end
})

local Shp4 = Tab5:AddSection("Egg Shop")
Shp4:AddDropdown("SGSHPPJK", {
Title = "Select: Egg Shop",
Description = "Target Egg",
Values = Data.EggList, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
if type(Value) == "table" then
            Data.SelectedEgg = Value
        else
            Data.SelectedEgg = {Value}
        end
end
})

local EggAuto = false
Shp4:AddToggle("ABEGGSGZ",{
Title = "Auto Buy Egg",
Description = "Selected Egg",
Default = false,
Callback = function(Value)
    EggAuto = Value
if Value then
    if not Data.SelectedEgg or #Data.SelectedEgg == 0 then
        NotifyHub("Please Select Egg to Auto Buy")
        return
    end
    task.spawn(function()
            while EggAuto do
            for jg = 1, 5 do
               for _, v in pairs(Data.SelectedEgg) do
               Data.GameEvents.BuyPetEgg:FireServer(v)
               end
               task.wait()
               end
               task.wait(math.random(1, 5)) 
               end
        end)
    else 
    EggAuto = false
    end
end
})

local Esp1 = Tab6:AddSection("ESP Pet Snip")
Esp1:AddToggle("ESPPET",{
Title = "Pet Snip",
Description = "Check Pet Name Inside Ready Hatch Egg",
Default = false,
Callback = function(Value)
if Value then
    EspBool = true
    task.wait(0.5)
    checkPet()
    else
    EspBool = false
    task.wait(0.5)
    checkPet()
    end
end
})


local petAddedConnection = nil 
local Esp2 = Tab6:AddSection("Cooldown Pet ESP")
Esp2:AddToggle("ESPCDPT",{
Title = "Enable ESP",
Description = "Cooldown Pet ESP",
Default = false,
Callback = function(Value)
if Value then
            getgenv().PetESP = true

            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local lp = Players.LocalPlayer

            local PetUI = lp:WaitForChild("PlayerGui"):WaitForChild("ActivePetUI")
            local GetCooldown = ReplicatedStorage.GameEvents:WaitForChild("GetPetCooldown")
            local PetsPhysical = workspace:WaitForChild("PetsPhysical")

            local ESPFolder = Instance.new("Folder", game.CoreGui)
            ESPFolder.Name = "PetESP"

            local CooldownMap = {}
            local ESPMap = {}

            local function GetAllUUIDs()
                local UUIDs = {}
                for _, v in ipairs(PetUI.Frame.Main.PetDisplay.ScrollingFrame:GetChildren()) do
                    if v:IsA("Frame") and v.Name ~= "PetTemplate" and v:FindFirstChild("PET_TYPE") then
                        table.insert(UUIDs, v.Name)
                    end
                end
                return UUIDs
            end
            local function GetNames()
                local jawa = nil
                for _, v in ipairs(PetUI.Frame.Main.PetDisplay.ScrollingFrame:GetChildren()) do
                    if v:IsA("Frame") and v.Name ~= "PetTemplate" and v:FindFirstChild("PET_TYPE") then
                        local jawir = v:FindFirstChild("PET_TYPE")
                        jawa = jawir.Text
                    end
                end
                return jawa
            end

            local function UpdateCooldownData()
                CooldownMap = {}
                local UUIDs = GetAllUUIDs()
                for _, uuid in ipairs(UUIDs) do
                    local result = GetCooldown:InvokeServer(uuid)
                    if result and result[1] then
                        for key, value in pairs(result[1]) do
                            if string.find(key, "Time") and type(value) == "number" then
                                CooldownMap[uuid] = {
                                    EndTime = os.time() + math.floor(value),
                                    Expired = false
                                }
                            end
                        end
                    end
                end
            end

            local function CreateESP(part, uuid)
    local billboard = Instance.new("BillboardGui", ESPFolder)
    billboard.Name = "ESP_" .. uuid
    billboard.Adornee = part
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2, 0)

    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextStrokeColor3 = Color3.fromRGB(255, 255, 200)
    label.TextStrokeTransparency = 0.2
    label.TextScaled = false
    label.TextSize = 15
    label.Font = Enum.Font.GothamBold
    label.Text = "..."

    return label
end


            local function InitESP()
                for _, part in ipairs(PetsPhysical:GetChildren()) do
                    if part:IsA("Part") and not ESPMap[part] then
                        local uuid = part:GetAttribute("UUID")
                        if uuid then
                            local label = CreateESP(part, uuid)
                            ESPMap[part] = { Label = label, UUID = uuid }
                        end
                    end
                end
            end

            local function RefreshESP()
                for part, data in pairs(ESPMap) do
                    local info = CooldownMap[data.UUID]
                    if info and type(info) == "table" and info.EndTime then
                        local remaining = math.max(0, info.EndTime - os.time())

                        if remaining <= 0 and not info.Expired then
                            info.Expired = true
                            task.spawn(function()
                                local result = GetCooldown:InvokeServer(data.UUID)
                                if result and result[1] then
                                    for key, val in pairs(result[1]) do
                                        if string.find(key, "Time") and type(val) == "number" then
                                            CooldownMap[data.UUID] = {
                                                EndTime = os.time() + math.floor(val),
                                                Expired = false
                                            }
                                        end
                                    end
                                end
                            end)
                        end

                        if remaining > 0 then
                            local mins = math.floor(remaining / 60)
                            local secs = remaining % 60
                            data.Label.Text = "[Timer] "..mins .. "m : " .. secs .. "s"
                        else
                            data.Label.Text = "Ready"
                        end
                    else
                        data.Label.Text = "Ready"
                    end
                end
            end

            -- Mulai loop realtime ESP
            task.spawn(function()
                while getgenv().PetESP do
                    pcall(UpdateCooldownData)
                    InitESP()
                    for i = 1, 300 do
                        if not getgenv().PetESP then break end
                        RefreshESP()
                        task.wait(1)
                    end
                end
            end)

            -- Pasang koneksi ChildAdded → simpan ke variabel global
            petAddedConnection = PetsPhysical.ChildAdded:Connect(function()
                task.wait(1)
                InitESP()
            end)

        else
            
            getgenv().PetESP = false

            -- Hapus folder ESP
            local folder = game.CoreGui:FindFirstChild("PetESP")
            if folder then folder:Destroy() end

            -- Putuskan koneksi ChildAdded
            if petAddedConnection then
                petAddedConnection:Disconnect()
                petAddedConnection = nil
            end
        end
    end
})

local Esp3 = Tab6:AddSection("Fruit ESP")
Esp3:AddDropdown("FFTF", {
Title = "Filter: Fruit",
Description = "Target Fruit",
Values = Data.FruitList, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedFPlant = type(Value) == "table" and Value or { Value }
end
})

Esp3:AddDropdown("FMFTF", {
Title = "Filter: Mutation Fruit",
Description = "Target Fruit",
Values = Data.ListMutation, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
Data.SelectedFMuta = type(Value) == "table" and Value or { Value }
end
})

Esp3:AddInput("FWKG4",{
Title = "Filter: Weight",
Description = "Show Fruit Above This KG",
Placeholder = "50",
Numeric = true,
Finished = true,
Callback = function(Value)
Data.MaxFWeight = Value
end
})

local fruitAddedConnection = nil

Esp3:AddToggle("EFESPS",{
Title = "Enable Fruit Esp",
Description = "Show Selected Fruit Esp",
Default = false,
Callback = function(Value)
 local MyFarm = GetFarm()
        if not MyFarm then return end

        local MyPlant = MyFarm:FindFirstChild("Important")
        if not MyPlant then return end
        MyPlant = MyPlant:FindFirstChild("Plants_Physical")
        if not MyPlant then return end

        local function CreateFruitESP(obj)
            if obj:FindFirstChild("FruitESP") then return end

            local weight = obj:FindFirstChild("Weight")
            if not weight then return end

            local fruitName = obj.Name
            local value = Calplantvalue(obj)
            local roundedWeight = math.round(weight.Value)

            if Data.SelectedFPlant and #Data.SelectedFPlant > 0 and not table.find(Data.SelectedFPlant, fruitName) then
                return
            end

            if Data.SelectedFMuta and #Data.SelectedFMuta > 0 then
                local matched = false
                for _, mut in ipairs(Data.MutationHandler:GetPlantMutations(obj)) do
                    if table.find(Data.SelectedFMuta, mut.Name) then
                        matched = true
                        break
                    end
                end
                if not matched then return end
            end

            if MaxFWeight and MaxFWeight > 0 and roundedWeight < MaxFWeight then
                return
            end

            local esp = Instance.new("BillboardGui")
            esp.Name = "FruitESP"
            esp.Size = UDim2.new(0, 80, 0, 30)
            esp.StudsOffset = Vector3.new(0, 2, 0)
            esp.AlwaysOnTop = true
            esp.Adornee = obj
            esp.Parent = obj

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255, 255, 0)
            label.TextStrokeColor3 = Color3.fromRGB(255, 255, 200)
            label.TextStrokeTransparency = 0.2
            label.TextScaled = false
            label.TextSize = 15
            label.Font = Enum.Font.GothamBold
            label.Text = fruitName .. " - " .. roundedWeight .. "KG - $" .. value
            label.Parent = esp
        end

        if Value then
            for _, plant in ipairs(MyPlant:GetChildren()) do
                local fruitsFolder = plant:FindFirstChild("Fruits")
                if fruitsFolder then
                    for _, fruit in ipairs(fruitsFolder:GetChildren()) do
                        CreateFruitESP(fruit)
                    end
                end
            end

            if fruitAddedConnection then fruitAddedConnection:Disconnect() end
            fruitAddedConnection = MyPlant.ChildAdded:Connect(function(plant)
                local fruitsFolder = plant:WaitForChild("Fruits", 2)
                if fruitsFolder then
                    for _, fruit in ipairs(fruitsFolder:GetChildren()) do
                        CreateFruitESP(fruit)
                    end
                    fruitsFolder.ChildAdded:Connect(function(fruit)
                        task.wait(0.1)
                        CreateFruitESP(fruit)
                    end)
                end
            end)

        else
            if fruitAddedConnection then
                fruitAddedConnection:Disconnect()
                fruitAddedConnection = nil
            end

            for _, plant in ipairs(MyPlant:GetChildren()) do
                local fruitsFolder = plant:FindFirstChild("Fruits")
                if fruitsFolder then
                    for _, fruit in ipairs(fruitsFolder:GetChildren()) do
                        local esp = fruit:FindFirstChild("FruitESP")
                        if esp then esp:Destroy() end
                    end
                end
            end
        end
    end
})

local Dlg1 = Tab6:AddSection("Show Dialog UI")
Dlg1:AddToggle("SZSUI",{
Title = "Zen Shop UI",
Description = "Show Zen Shop UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.EventShop_UI
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("STMUI",{
Title = "Traveling Merchant UI",
Description = "Show Traveling Merchant UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.TravelingMerchantShop_UI
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("SPTUI",{
Title = "Pet Shop UI",
Description = "Show Pet Shop UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.PetShop_UI
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("SDSUI",{
Title = "Seed Shop UI",
Description = "Show Seed Shop UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.Seed_Shop
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("SGRSUI",{
Title = "Gear Shop UI",
Description = "Show Gear Shop UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.Gear_Shop
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("DQUIS",{
Title = "Daily Quest UI",
Description = "Show Daily Quest UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.DailyQuests_UI
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("SUPSUI",{
Title = "Upgrade Pet Slot UI",
Description = "Show Upgrade Pet Slot UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.PetEquipSlots_UI
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

Dlg1:AddToggle("COSMUI",{
Title = "Cosmetic Shop UI",
Description = "Show Cosmetic Shop UI",
Default = false,
Callback = function(Value)
local asv = game:GetService("Players").LocalPlayer.PlayerGui.CosmeticShop_UI
    if Value then
    asv.Enabled = true
    else
    asv.Enabled = false
    end
end
})

local Tp1 = Tab8:AddSection("Teleport Event")
Tp1:AddButton({
Title = "Event Teleport", 
Callback = function()
Teleport(CFrame.new(-101.005455, 4.000012, -8.197269))
end
})

local Tp2 = Tab8:AddSection("Teleport Sell NPC")
Tp2:AddButton({
Title = "Sell NPC Teleport", 
Callback = function()
Teleport(CFrame.new(86.58, 3.00, 0.43)) 
end
})

local Tp3 = Tab8:AddSection("Teleport Seed NPC")
Tp3:AddButton({
Title = "Seed NPC Teleport", 
Callback = function()
Teleport(CFrame.new(86.59, 3.00, -27.00))
end
})

local Tp4 = Tab8:AddSection("Teleport Gear NPC")
Tp4:AddButton({
Title = "Gear NPC Teleport", 
Callback = function()
Teleport(CFrame.new(-286.93, 3.00, -33.03))
end
})

local Tp5 = Tab8:AddSection("Teleport Cosmetic NPC")
Tp5:AddButton({
Title = "Cosmetic NPC Teleport", 
Callback = function()
Teleport(CFrame.new(-287.01, 3.00, -14.90))
end
})

local Tp6 = Tab8:AddSection("Teleport Egg NPC")
Tp6:AddButton({
Title = "Egg NPC Teleport", 
Callback = function()
Teleport(CFrame.new(-283.60, 3.00, 3.51))
end
})

local IdleAbl = false
local ZenEv = false
Data.SellMultiX = 1000
local Vuln1 = Tab7:AddSection("Sell Multiplier (Pet)")
Vuln1:AddParagraph ({
    Title = "Sell Multiplier (Pet)", 
    Content = "1. You Need 2 Account to Held a Pet\n2. Held a Expensive Pet on Account 1\n3. Held a Cheapest Pet on Account 2 (then enable sell multiplier)", 
}) 

Vuln1:AddSlider("MLTSLL", {
    Title       = "Multiplier: 1000-5000",
    Description = "Cheap Pet Multiplier Value",
    Min         = 1000,      
    Max         = 5000,  
    Default     = 1000,
    Rounding = 0,
    Callback    = function(Value)
    Data.SellMultiX = tonumber(Value) 
    end
})

Vuln1:AddToggle("ASPMDS",{
Title = "Auto Sell Pet Multiplier",
Description = "Dupe Sheckless",
Default = false,
Callback = function(Value)
if Value then
local Players = game:GetService("Players")
for j = 1, Data.SellMultiX do
for _, player in ipairs(Players:GetPlayers()) do
    local charFolder = workspace:FindFirstChild(player.Name)
    if charFolder then
        for _, obj in ipairs(charFolder:GetChildren()) do
            if obj:IsA("Tool") and string.find(obj.Name, "Age") then
            Data.SellPetRE:FireServer(obj)
            end
        end
    end
end
end
    end
end
})

local Vuln2 = Tab7:AddSection("Auto Middle Pet")

Vuln2:AddParagraph ({
    Title = "Auto Middle Pet Guide", 
    Content = "1.Select Your pet Target\n2.Put Pet Cooldown Ex: Mooncat Cd is 1:08m so 68s\n3.Enable Auto Middle Pet", 
})

local zxcas = Vuln2:AddDropdown("SAMPTP", {
Title = "Select: Auto Middle Pet",
Description = "Target Pet (Refresh Pet List)",
Values = {}, 
Multi = true, 
AllowNull = true, 
Callback = function(Value)
 Data.SelectedPetMids = {}

        local selectedNames = (typeof(Value) == "table") and Value or {Value}
        local copy = {}
        for i, v in ipairs(Data.PetListDataMid) do
            copy[i] = { Name = v.Name, UUID = v.UUID, used = false }
        end

        for _, selectedName in ipairs(selectedNames) do
            for i, pet in ipairs(copy) do
                if pet.Name == selectedName and not pet.used then
                    table.insert(Data.SelectedPetMids, {
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

Vuln2:AddButton({
Title = "Refresh Pet List", 
Callback = function()
local player = game:GetService("Players").LocalPlayer
        local scroller = player.PlayerGui.ActivePetUI.Frame.Main.PetDisplay.ScrollingFrame

        Data.PetListDataMid = {}
        Data.petRealMid = {}

        for _, obj in ipairs(scroller:GetChildren()) do
            if obj:IsA("Frame") and not string.find(obj.Name, "Template") then
                local main = obj:FindFirstChild("Main")
                local petNameLabel = main and main:FindFirstChild("PET_TYPE")

                if petNameLabel and petNameLabel:IsA("TextLabel") then
                    local petName = petNameLabel.Text
                    local uuid = obj.Name

                    table.insert(Data.PetListDataMid, { Name = petName, UUID = uuid })
                    table.insert(Data.petRealMid, petName) -- atau petName.." ("..uuid..")" kalau mau tampilkan UUID
                end
            end
        end
        zxcas:SetValues(Data.petRealMid)
        zxcas:SetValue({})
    end
end
})

local RemoteVuln = Data.GameEvents.ActivePetService
local PetCooldowns = 70
Vuln2:AddInput("IPCD",{
Title = "Input: Pet Cooldown",
Description = "Seconds",
Placeholder = "70",
Numeric = true,
Finished = true,
Callback = function(Value)
PetCooldowns = Value
end
})

local MiddlePet = false
Vuln2:AddToggle("AMPYPM",{
Title = "Auto Middle Pet",
Description = "Make Your Pet in Middle",
Default = false,
Callback = function(Value)
MiddlePet = Value
    if Value then
    task.spawn(function()
    while MiddlePet do
    CallIdle:Set(true)
    task.wait(5)
    CallIdle:Set(false)
    task.wait(PetCooldowns + 5)
    end
    end)
    else
    MiddlePet = false
    end
end
})



Vuln2:AddParagraph ({
    Title = "Auto Sync Guide", 
    Content = "Information! This Good For Non Huge Pet like 1:10-1:20m+ Cooldown\n1.Select Your Pet Target Exclude Echo Frog/Triceratops\n2.Put Pet Cooldown Ex: Mooncat Cd is 1:08m give little delay so 1:10-1:20m in second is 60-80\n3.Enable Auto Sync Echo Frog or Triceratops", 
})

Data.AutoSyncFrog = false
Vuln2:AddToggle("ASEFM",{
Title = "Auto Sync Echo Frog",
Description = "Echo Frog Method",
Default = false,
Callback = function(Value)
Data.AutoSyncFrog = Value
        if Value then
        --if Data.AutoSyncTricer then SyncTri:Set(false) continue end
        CallIdle:Set(true) 
            task.spawn(function()            
                while Data.AutoSyncFrog do
                Data.SyncUuid = nil
                    for _, pet in ipairs(Data.PetListDataMid) do
                        if string.find(pet.Name, "Echo Frog") then
                            Data.SyncUuid = pet.UUID      
                        break                     
                        end
                    end             
                    if not Data.SyncUuid then
                        NotifyHub("Echo Frog not found!. Please Refresh Again")
                        task.wait(2)
                        continue
                    end
                    Data.GetCooldown = game:GetService("ReplicatedStorage").GameEvents:WaitForChild("GetPetCooldown")
                    local result = Data.GetCooldown:InvokeServer(Data.SyncUuid)
                    for k, v in pairs(result) do
                        for e, j in pairs(v) do
                            if string.find(e, "Time") then
                                if j == PetCooldowns then
                                NotifyHub("Synchronization") 
                                CallIdle:Set(false)
                                task.wait(PetCooldowns)
                                NotifyHub("Re-Synchronization")
                                CallIdle:Set(true) 
                                task.wait(1) 
                                end
                            end
                        end
                    end
                    task.wait(0.01)
                end
            end)
            else
            Data.AutoSyncFrog = false
        end
end
})

Data.AutoSyncTricer = false
Vuln2:AddToggle("ASTTM",{
Title = "Auto Sync Triceratops",
Description = "Triceratops Method",
Default = false,
Callback = function(Value)
Data.AutoSyncTricer = Value
        if Value then
        --if Data.AutoSyncFrog then SyncFrog:Set(false) continue end
        CallIdle:Set(true) 
            task.spawn(function()            
                while Data.AutoSyncTricer do
                Data.SyncUuids = nil
                    for _, pet in ipairs(Data.PetListDataMid) do
                        if string.find(pet.Name, "Triceratops") then
                            Data.SyncUuids = pet.UUID
                        break                           
                        end
                    end             
                    if not Data.SyncUuids then
                        NotifyHub("Triceratops not found!. Please Refresh Again")
                        task.wait(2)
                        continue
                    end
                    Data.GetCooldown = game:GetService("ReplicatedStorage").GameEvents:WaitForChild("GetPetCooldown")
                    local result = Data.GetCooldown:InvokeServer(Data.SyncUuids)
                    for k, v in pairs(result) do
                        for e, j in pairs(v) do
                            if string.find(e, "Time") then
                                if j == PetCooldowns then
                                NotifyHub("Synchronization") 
                                CallIdle:Set(false)
                                task.wait(PetCooldowns)
                                NotifyHub("Re-Synchronization")
                                CallIdle:Set(true) 
                                task.wait(1) 
                                end
                            end
                        end
                    end
                    task.wait(0.01)
                end
            end)
            else
            Data.AutoSyncTricer = false
        end
end
})

CallIdle = Vuln2:AddToggle("PIDTS",{
Title = "Pet Idle",
Description = "Dont Touch",
Default = false,
Callback = function(Value)
IdleAbl = Value
        if Value then
            task.spawn(function()
                while IdleAbl do
                    if Data.SelectedPetMids and type(Data.SelectedPetMids) == "table" then
                        for _, petData in pairs(Data.SelectedPetMids) do
                            if petData.UUID then
                                RemoteVuln:FireServer("SetPetState", petData.UUID, "Idle")
                                --print("🔄 Set Idle:", petData.Name)
                            end
                            task.wait(0.01)
                        end
                    end
                    task.wait(0.01)
                end
            end)
            else
            IdleAbl = false
        end
end
})

local Perf1 = Tab9:AddSection("Hide Noitification")

Perf1:AddToggle("HDNTF",{
Title = "Hide Notification",
Description = "All Notification",
Default = false,
Callback = function(Value)
if Value then
     local soundService = game:GetService("SoundService").Notification
        local notifFrame = game:GetService("Players").LocalPlayer.PlayerGui.Top_Notification.Frame
            notifFrame.Visible = false
            soundService.Volume = 0
            else
            local soundService = game:GetService("SoundService").Notification
        local notifFrame = game:GetService("Players").LocalPlayer.PlayerGui.Top_Notification.Frame
            notifFrame.Visible = true
            soundService.Volume = 0.5
            end
end
})

local Perf2 = Tab9:AddSection("Hide Backpack")
Perf2:AddToggle("HDBPK",{
Title = "Hide Backpack",
Description = "Item Backpack",
Default = false,
Callback = function(Value)
if Value then
    local agg = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui
    agg.Enabled = false
    else
    local agg = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui
    agg.Enabled = true
    end
end
})

local FPSBooster do
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local Terrain = workspace:FindFirstChildOfClass("Terrain")

    local booster = {
        Enabled = false,
        Aggressive = false,  -- boleh kamu ubah runtime
        FPSCap = 60,         -- dipakai kalau setfpscap tersedia
        Connections = {},
        Saved = {
            Lighting = {},
            Terrain = {},
            Effects = {},   -- post-processing Lighting
            Inst = {},      -- per-instance props
        }
    }

    local EffectClasses = {
        BloomEffect = true,
        SunRaysEffect = true,
        DepthOfFieldEffect = true,
        BlurEffect = true,
        ColorCorrectionEffect = true,
    }

    local function saveOnce(map, inst, kv)
        if map[inst] then return end
        local copy = {}
        for k, v in pairs(kv) do copy[k] = v end
        map[inst] = copy
    end

    local function safeSet(inst, prop, value)
        pcall(function() inst[prop] = value end)
    end

    local function treatInstance(inst)
        if not booster.Enabled then return end
        local class = inst.ClassName

        if class == "ParticleEmitter" or class == "Trail" or class == "Beam" then
            saveOnce(booster.Saved.Inst, inst, {
                Enabled = (inst.Enabled ~= nil and inst.Enabled) or false,
                Rate = (inst.ClassName == "ParticleEmitter" and inst.Rate) or nil
            })
            safeSet(inst, "Enabled", false)
            if inst.ClassName == "ParticleEmitter" and inst.Rate ~= nil then
                safeSet(inst, "Rate", 0)
            end
            return
        end

        if inst:IsA("BasePart") and inst.CastShadow ~= nil then
            saveOnce(booster.Saved.Inst, inst, { CastShadow = inst.CastShadow })
            safeSet(inst, "CastShadow", false)
        end

        if class == "MeshPart" and inst.RenderFidelity ~= nil then
            saveOnce(booster.Saved.Inst, inst, { RenderFidelity = inst.RenderFidelity })
            safeSet(inst, "RenderFidelity", Enum.RenderFidelity.Performance)
        end
    end

    local function applyLightingLow()
        local L = booster.Saved.Lighting
        if not L._saved then
            L._saved = true
            L.GlobalShadows = Lighting.GlobalShadows
            L.EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale
            L.EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale
            L.Brightness = Lighting.Brightness
            L.ShadowSoftness = Lighting.ShadowSoftness
            L.Ambient = Lighting.Ambient
            L.OutdoorAmbient = Lighting.OutdoorAmbient
            for _, v in ipairs(Lighting:GetChildren()) do
                if EffectClasses[v.ClassName] and v:IsA("PostEffect") then
                    saveOnce(booster.Saved.Effects, v, { Enabled = v.Enabled })
                end
            end
        end
        safeSet(Lighting, "GlobalShadows", false)
        safeSet(Lighting, "EnvironmentDiffuseScale", 0)
        safeSet(Lighting, "EnvironmentSpecularScale", 0)
        safeSet(Lighting, "Brightness", 1)
        safeSet(Lighting, "ShadowSoftness", 0)
        safeSet(Lighting, "Ambient", Color3.new())
        safeSet(Lighting, "OutdoorAmbient", Color3.new())
        for inst, _ in pairs(booster.Saved.Effects) do
            if inst and inst.Parent then safeSet(inst, "Enabled", false) end
        end
    end

    local function applyTerrainLow()
        if not Terrain then return end
        local T = booster.Saved.Terrain
        if not T._saved then
            T._saved = true
            T.Decoration = Terrain.Decoration
            T.WaterWaveSize = Terrain.WaterWaveSize
            T.WaterWaveSpeed = Terrain.WaterWaveSpeed
            T.WaterTransparency = Terrain.WaterTransparency
            T.WaterReflectance = Terrain.WaterReflectance
        end
        safeSet(Terrain, "Decoration", false)
        safeSet(Terrain, "WaterWaveSize", 0)
        safeSet(Terrain, "WaterWaveSpeed", 0)
        safeSet(Terrain, "WaterTransparency", 1)
        safeSet(Terrain, "WaterReflectance", 0)
    end

    local function applyQualityCap()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        if typeof(setfpscap) == "function" then
            pcall(setfpscap, booster.FPSCap)
        end
    end

    local function scanWorldChunked()
        local list = workspace:GetDescendants()
        local i, n, step = 1, #list, 300
        while booster.Enabled and i <= n do
            local j = math.min(i + step - 1, n)
            for k = i, j do
                local inst = list[k]
                treatInstance(inst)
            end
            i = j + 1
            RunService.Heartbeat:Wait()
        end
    end

    local function startHooks()
        table.insert(booster.Connections, workspace.DescendantAdded:Connect(function(inst)
            task.defer(function()
                if booster.Enabled then treatInstance(inst) end
            end)
        end))
        table.insert(booster.Connections, RunService.Stepped:Connect(function()
            if not booster.Enabled then return end
            for inst, _ in pairs(booster.Saved.Effects) do
                if inst and inst.Parent and inst.Enabled ~= false then
                    safeSet(inst, "Enabled", false)
                end
            end
        end))
    end

    local function stopHooks()
        for _, c in ipairs(booster.Connections) do
            pcall(function() c:Disconnect() end)
        end
        table.clear(booster.Connections)
    end

    local function restoreAll()
        local L = booster.Saved.Lighting
        if L._saved then
            safeSet(Lighting, "GlobalShadows", L.GlobalShadows)
            safeSet(Lighting, "EnvironmentDiffuseScale", L.EnvironmentDiffuseScale)
            safeSet(Lighting, "EnvironmentSpecularScale", L.EnvironmentSpecularScale)
            safeSet(Lighting, "Brightness", L.Brightness)
            safeSet(Lighting, "ShadowSoftness", L.ShadowSoftness)
            safeSet(Lighting, "Ambient", L.Ambient)
            safeSet(Lighting, "OutdoorAmbient", L.OutdoorAmbient)
        end
        for inst, saved in pairs(booster.Saved.Effects) do
            if inst and inst.Parent and saved.Enabled ~= nil then
                safeSet(inst, "Enabled", saved.Enabled)
            end
        end
        local T = booster.Saved.Terrain
        if Terrain and T._saved then
            safeSet(Terrain, "Decoration", T.Decoration)
            safeSet(Terrain, "WaterWaveSize", T.WaterWaveSize)
            safeSet(Terrain, "WaterWaveSpeed", T.WaterWaveSpeed)
            safeSet(Terrain, "WaterTransparency", T.WaterTransparency)
            safeSet(Terrain, "WaterReflectance", T.WaterReflectance)
        end
        for inst, saved in pairs(booster.Saved.Inst) do
            if inst and inst.Parent then
                for k, v in pairs(saved) do
                    safeSet(inst, k, v)
                end
            end
        end
    end

    function booster:On()
        if self.Enabled then return end
        self.Enabled = true
        applyLightingLow()
        applyTerrainLow()
        applyQualityCap()
        startHooks()
        task.spawn(scanWorldChunked)
        print("[FPSBooster] ON")
    end

    function booster:Off()
        if not self.Enabled then return end
        self.Enabled = false
        stopHooks()
        restoreAll()
        print("[FPSBooster] OFF")
    end

    function booster:Set(state)
        if state then self:On() else self:Off() end
    end

    FPSBooster = booster
end

local Perf3 = Tab9:AddSection("FPS Booster")

Perf3:AddToggle("FPSBST", {
    Title = "FPS Booster",
    Description = "Smooth FPS",
    Default = false,
    Callback = function(Value)
        if Value then
            FPSBooster:Set(true)
            NotifyHub("FPS Booster Enabled")
        else
            FPSBooster:Set(false)
            NotifyHub("FPS Booster Disabled")
        end
    end
})



local afkConnection
local Perf5 = Tab9:AddSection("Anti-AFK")
Perf5:AddToggle("ANTAFKW",{
Title = "ANTI-AFK",
Description = "Prevent Kick from Game",
Default = true,
Callback = function(Value)
if Value then
            afkConnection = Data.LocalPlayer.Idled:Connect(function()
                Data.VirtualUser:CaptureController()
                Data.VirtualUser:ClickButton2(Vector2.new())
            end)
        else
            if afkConnection then
                afkConnection:Disconnect()
                afkConnection = nil
            end
end
})

local Serv1 = Tab10:AddSection("Server Information")
local SerVes = game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.VersionContainer.PlaceVersionLabel
local versNum = tonumber(SerVes.Text:match("%d+"))
Serv1:AddParagraph ({
    Title = "Place Version", 
    Content = versNum, 
}) 

local Serv2 = Tab10:AddSection("Teleport Job ID")
local PutJob = nil 
Serv2:AddInput("TPJBID",{
Title = "Input: Job ID",
Description = "Server Job ID",
Placeholder = "Here",
Numeric = false,
Finished = true,
Callback = function(Value)
PutJob = Value
end
})

Serv2:AddButton({
Title = "Teleport Job ID", 
Callback = function()
if not PutJob then
NotifyHub("Please Input Job Id!")
return
end
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, PutJob)
end
})

Serv2:AddButton({
Title = "Copy Job ID", 
Callback = function()
setclipboard(game.JobId)
NotifyHub("Copied Job Id")
end
})

local Serv3 = Tab10:AddSection("Auto Hop Server")
local PVersion = nil
Serv3:AddInput("TPJBID",{
Title = "Input: Target Place Version",
Description = "Target Hop Place Version",
Placeholder = "0",
Numeric = true,
Finished = true,
Callback = function(Value)
PVersion = tonumber(Value)
end
})

local SPDHP = 3
Serv3:AddInput("TPJBID",{
Title = "Input: Delay Auto Hop",
Description = "Speed Auto Hop",
Placeholder = "3",
Numeric = true,
Finished = true,
Callback = function(Value)
SPDHP = tonumber(Value)
end
})

local HoopPlace = false
Serv3:AddToggle("AHPSFPV",{
Title = "Auto Hop Server",
Description = "until Find Place Version",
Default = false,
Callback = function(Value)
if Value then 
    if not PVersion then
    NotifyHub("Please Set Place Version") 
    return
    end
HoopPlace = Value
task.spawn(function()
while HoopPlace do
local SerV = game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.VersionContainer.PlaceVersionLabel
local Vers = tonumber(SerVes.Text:match("%d+"))
local abj = tostring(Vers)
if abj > PVersion then
NotifyHub("Search "..PVersion.. " Place Version...")
task.wait(5)
JoinRand()
else
HoopPlace = false
NotifyHub("Place Version "..PVersion.. " Found!") 
end
task.wait(1)
end
end)
else
HoopPlace = false
end
end
})

local Serv4 = Tab10:AddSection("Auto Reconnect")
local CoreGui = game:GetService("CoreGui")
local AutoRejoinLoop = false
local ErrorConn = nil

local function RejoinLoop()
	while AutoRejoinLoop do
		Data.TeleportService:Teleport(game.PlaceId)
		task.wait(2)
	end
end

local function EnableAutoRejoin()
	task.spawn(function()
		repeat task.wait() until CoreGui:FindFirstChild("RobloxPromptGui")
		local promptOverlay = CoreGui:WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay", 10)
		if promptOverlay then
			ErrorConn = promptOverlay.ChildAdded:Connect(function(obj)
				if obj.Name == "ErrorPrompt" and AutoRejoinLoop then
					RejoinLoop()
				end
			end)
		end
	end)
end

local function DisableAutoRejoin()
	AutoRejoinLoop = false
	if ErrorConn then
		ErrorConn:Disconnect()
		ErrorConn = nil
	end
end

Serv4:AddToggle("ATRCNT",{
Title = "Auto Reconnect",
Description = "When Disconnected",
Default = true,
Callback = function(Value)
        if Value then
            EnableAutoRejoin()
        else
            DisableAutoRejoin()
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
print(("[LimitHub] Script Loaded in %.2f seconds"):format(EndLoad))
