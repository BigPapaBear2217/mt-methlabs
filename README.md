# mt-methlabs
Meth Labs script for QBCore

# Preview: https://youtu.be/MXAlVBKNkBo

# Instalation:

Add to qb-core/shared/items.lua
```
	-- mt-methlabs
	["meth_jobrecive"]  		= {["name"] = "meth_jobrecive", 				["label"] = "Key Job Recive", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "meth_jobrecive.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["meth_key"]  				= {["name"] = "meth_key", 						["label"] = "Labs Key", 									["weight"] = 100, 		["type"] = "item", 			["image"] = "meth_key.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["meth"]  					= {["name"] = "meth", 							["label"] = "Meth", 										["weight"] = 100, 		["type"] = "item", 			["image"] = "meth.png", 							["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["hydrochloric_acid"]  		= {["name"] = "hydrochloric_acid", 				["label"] = "Hydrochloric Acid", 							["weight"] = 100, 		["type"] = "item", 			["image"] = "hydrochloric_acid.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["sodium_hydroxide"]  		= {["name"] = "sodium_hydroxide", 				["label"] = "Sodium Hydroxide", 							["weight"] = 100, 		["type"] = "item", 			["image"] = "sodium_hydroxide.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["sulfuric_acid"]  			= {["name"] = "sulfuric_acid", 					["label"] = "Sulfuric Acid", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "sulfuric_acid.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["meth_baggies"]  			= {["name"] = "meth_baggies", 					["label"] = "Meth Baggies", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "meth_baggies.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["meth_epmty_baggies"]  	= {["name"] = "meth_epmty_baggies", 			["label"] = "Empty Baggies", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "meth_epmty_baggies.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

Drag and drop images to qb-inventory/html/images

# Dependicies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-menu - https://github.com/qbcore-framework/qb-menu
- qb-phone - https://github.com/qbcore-framework/qb-phone
