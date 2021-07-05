Config = Config or {}

Config.WomanPlayerModels = {
    'mp_f_freemode_01',
}
    
Config.ManPlayerModels = {
    'mp_m_freemode_01',
}

Config.LoadedManModels = {}
Config.LoadedWomanModels = {}

Config.Stores = {
    [1] =   {shopType = "clothing", x = 1693.32,      y = 4823.48,     z = 41.06},
	[2] =   {shopType = "clothing", x = -712.215881,  y = -155.352982, z = 37.4151268},
	[3] =   {shopType = "clothing", x = -1192.94495,  y = -772.688965, z = 17.3255997},
	[4] =   {shopType = "clothing", x =  425.236,     y = -806.008,    z = 28.491},
	[5] =   {shopType = "clothing", x = -162.658,     y = -303.397,    z = 38.733},
	[6] =   {shopType = "clothing", x = 75.950,       y = -1392.891,   z = 28.376},
	[7] =   {shopType = "clothing", x = -822.194,     y = -1074.134,   z = 10.328},
	[8] =   {shopType = "clothing", x = -1450.711,    y = -236.83,     z = 48.809},
	[9] =   {shopType = "clothing", x = 4.254,        y = 6512.813,    z = 30.877},
	[10] =  {shopType = "clothing", x = 615.180,      y = 2762.933,    z = 41.088},
	[11] =  {shopType = "clothing", x = 1196.785,     y = 2709.558,    z = 37.222},
	[12] =  {shopType = "clothing", x = -3171.453,    y = 1043.857,    z = 19.863},
	[13] =  {shopType = "clothing", x = -1100.959,    y = 2710.211,    z = 18.107},
	[14] =  {shopType = "clothing", x = -1207.65,     y = -1456.88,    z = 4.3784737586975},
    [15] =  {shopType = "clothing", x = 121.76,       y = -224.6,      z = 53.56},
	[16] =  {shopType = "barber",   x = -814.3,       y = -183.8,      z = 36.6},
	[17] =  {shopType = "barber",   x = 136.8,        y = -1708.4,     z = 28.3},
	[18] =  {shopType = "barber",   x = -1282.6,      y = -1116.8,     z = 6.0},
	[19] =  {shopType = "barber",   x = 1931.5,       y = 3729.7,      z = 31.8},
	[20] =  {shopType = "barber",   x = 1212.8,       y = -472.9,      z = 65.2},
	[21] =  {shopType = "barber",   x = -32.9,        y = -152.3,      z = 56.1},
	[22] =  {shopType = "barber",   x = -278.1,       y = 6228.5,      z = 30.7}
}

Config.ClothingRooms = {
    [1] = {requiredJob = "police", x = 451.48, y = -993.37, z = 30.69, cameraLocation = {x = 451.48, y = -993.37, z = 30.69, h = 354.95}},
    [2] = {requiredJob = "doctor", x = 0, y = 0, z = 0, cameraLocation = {x = 1462.76, y = 695.59, z = 33.51, h = 175.01}},
    [3] = {requiredJob = "ambulance", x = 298.78, y = -597.97, z = 43.28, cameraLocation = {x = 298.78, y = -597.97, z = 43.28, h = 275.51}},
    [4] = {requiredJob = "police", x = 0, y = 0, z = 0, cameraLocation = {x = 317.62, y = 671.86, z = 14.73, h = 91.53}},
    [5] = {requiredJob = "ambulance", x = 0, y = 0, z = 0, cameraLocation = {x = 339.27, y = 661.63, z = 14.71, h = 315.5}},    
    [6] = {requiredJob = "doctor", x = 0, y = 0, z = 0, cameraLocation = {x = 339.27, y = 661.63, z = 14.71, h = 315.5}}, 
	[7] = {requiredJob = "ambulance", x = 0, y = 0, z = 0, cameraLocation = {x = -1097.15, y = 1750.19, z = 23.35, h = 38.70}},    
    [8] = {requiredJob = "doctor", x = 0, y = 0, z = 0, cameraLocation = {x = -1097.15, y = 1750.19, z = 23.35, h = 38.70}},
	[9] = {requiredJob = "police", x = 0, y = 0, z = 0, cameraLocation = {x = -80.36, y = -130.76, z = 5.03, h = 300.44}},

    --   [1] = {requiredJob = "police", coords = vector3(451.48, -993.37, 30.69), cameraLocation = vector4(451.48, -993.37, 30.69, 354.95)},
   -- [2] = {requiredJob = "ambulance", coords = vector3(298.78, -597.97, 43.28), cameraLocation = vector4(298.7, -598.02, 43.28, 275.51)},
}

Config.Outfits = {
    ["police"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Đồ Cảnh Sát ",
                outfitData = {
                    ["pants"]       = { item = 24, texture = 0},  -- PANTS
                    ["arms"]        = { item = 19, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                  --  ["vest"]        = { item = 0, texture = 0},  -- VEST
                    ["torso2"]      = { item = 55, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 21, texture = 0},  -- SHOES
                    ["decals"]      = { item = 8, texture = 3},  -- Decals
                 --   ["accessory"]   = { item = 0, texture = 0},  -- Neck
                --    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = 46, texture = 0},  -- HAT
             --       ["glass"]       = { item = 0, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = 0, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- MASK
                },
            },
        },
        ["female"] = {
            [1] = {
                outfitLabel = "Đồ Cảnh Sát",
                outfitData = {
                    ["pants"]       = { item = 0, texture = 0},  -- Broek
                    ["arms"]        = { item = 14, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 152, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 95, texture = 0},  -- Jas / Vesten
                    ["shoes"]       = { item = 7, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 7, texture = 0},  -- Decals
                    ["accessory"]   = { item = -1, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 45, texture = 0},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
            --      ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- Masker
                },
            },
        }
    },
    ["ambulance"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "T-Shirt",
                outfitData = {
                    ["pants"]       = { item = 24,texture = 1},  -- Broek
                    ["arms"]        = { item = 85, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                 --   ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 6, texture = 0},  -- Jas / Vesten
                    ["shoes"]       = { item = 76, texture = 18},  -- Schoenen
                    ["decals"]      = { item = 57, texture = 0},  -- Decals
                    ["accessory"]   = { item = 126, texture = 0},  -- Nek / Das
                  --  ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 122, texture = 0},  -- Pet
                  --  ["glass"]       = { item = 0, texture = 0},  -- Bril
                 --   ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
                },
            },
            [2] = {
                outfitLabel = "Polo",
                outfitData = {
                    ["pants"]       = { item = 24,texture = 1},  -- Broek
                    ["arms"]        = { item = 85, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                 --   ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 6, texture = 0},  -- Jas / Vesten
                    ["shoes"]       = { item = 76, texture = 18},  -- Schoenen
                    ["decals"]      = { item = 57, texture = 0},  -- Decals
                    ["accessory"]   = { item = 126, texture = 0},  -- Nek / Das
                  --  ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 122, texture = 0},  -- Pet
                  --  ["glass"]       = { item = 0, texture = 0},  -- Bril
                 --   ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
                },
            },
			[3] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 24,texture = 1},  -- Broek
                    ["arms"]        = { item = 85, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                 --   ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 6, texture = 0},  -- Jas / Vesten
                    ["shoes"]       = { item = 76, texture = 18},  -- Schoenen
                    ["decals"]      = { item = 57, texture = 0},  -- Decals
                    ["accessory"]   = { item = 126, texture = 0},  -- Nek / Das
                  --  ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 122, texture = 0},  -- Pet
                  --  ["glass"]       = { item = 0, texture = 0},  -- Bril
                 --   ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
				},
			},
			[4] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 24,texture = 1},  -- Broek
                    ["arms"]        = { item = 85, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                 --   ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 6, texture = 0},  -- Jas / Vesten
                    ["shoes"]       = { item = 76, texture = 18},  -- Schoenen
                    ["decals"]      = { item = 57, texture = 0},  -- Decals
                    ["accessory"]   = { item = 126, texture = 0},  -- Nek / Das
                  --  ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 122, texture = 0},  -- Pet
                  --  ["glass"]       = { item = 0, texture = 0},  -- Bril
                 --   ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
                },
            },
            [5] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 24,texture = 1},  -- Broek
                    ["arms"]        = { item = 85, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                 --   ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 6, texture = 0},  -- Jas / Vesten
                    ["shoes"]       = { item = 76, texture = 18},  -- Schoenen
                    ["decals"]      = { item = 57, texture = 0},  -- Decals
                    ["accessory"]   = { item = 126, texture = 0},  -- Nek / Das
                  --  ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 122, texture = 0},  -- Pet
                  --  ["glass"]       = { item = 0, texture = 0},  -- Bril
                 --   ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
                },
            },
        },
        ["female"] = {
            [1] = {
                outfitLabel = "short sleeve white polo ",
                outfitData = {
                    ["pants"]       = { item = 14, texture = 8},  -- PANTS
                    ["arms"]        = { item = 87, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- VEST
                    ["torso2"]      = { item = 6, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 6, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = 121, texture = 0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- MASK
                },
            },
            [2] = {
                outfitLabel = "short sleeve blue polo ",
                outfitData = {
                    ["pants"]       = { item = 14, texture = 8},  -- PANTS
                    ["arms"]        = { item = 87, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- VEST
                    ["torso2"]      = { item = 6, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 6, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = 121, texture = 0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- MASK
                },
            },
            [3] = {
                outfitLabel = "short sleeve white button up ",
                outfitData = {
                    ["pants"]       = { item = 14, texture = 8},  -- PANTS
                    ["arms"]        = { item = 87, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- VEST
                    ["torso2"]      = { item = 6, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 6, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = 121, texture = 0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- MASK
                },
            },
            [4] = {
                outfitLabel = "short sleeve blue button up ",
                outfitData = {
                    ["pants"]       = { item = 14, texture = 8},  -- PANTS
                    ["arms"]        = { item = 87, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- VEST
                    ["torso2"]      = { item = 6, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 6, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = 121, texture = 0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- MASK
                },
            },
        },
    },
    ["doctor"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 49,texture = 0},  -- Broek
                    ["arms"]        = { item = 86, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 88, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 118, texture = 7},  -- Jas / Vesten
                    ["shoes"]       = { item = 25, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = -1, texture = -1},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
                    ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
				},
			},
			[2] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 49,texture = 0},  -- Broek
                    ["arms"]        = { item = 85, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 88, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 18, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 32, texture = 6},  -- Jas / Vesten
                    ["shoes"]       = { item = 25, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = -1, texture = -1},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
                    ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
				},
			},			
			[3] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 49,texture = 4},  -- Broek
                    ["arms"]        = { item = 86, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 51, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 2},  -- Jas / Vesten
                    ["shoes"]       = { item = 25, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = -1, texture = -1},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
                    ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker
				},
			},
			[4] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 59,texture = 5},  -- Broek
                    ["arms"]        = { item = 86, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 135, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 3},  -- Jas / Vesten
                    ["shoes"]       = { item = 25, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 79, texture = 0},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
                    ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker	
				},
			},
			[5] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 59,texture = 5},  -- Broek
                    ["arms"]        = { item = 86, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 135, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 5},  -- Jas / Vesten
                    ["shoes"]       = { item = 25, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 79, texture = 0},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
                    ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker	
				},
			},
			[6] = {
                outfitLabel = "Placeholder",
                outfitData = {
                    ["pants"]       = { item = 59,texture = 5},  -- Broek
                    ["arms"]        = { item = 86, texture = 0},  -- Armen
                    ["t-shirt"]     = { item = 135, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 4},  -- Jas / Vesten
                    ["shoes"]       = { item = 25, texture = 0},  -- Schoenen
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Tas
                    ["hat"]         = { item = 79, texture = 0},  -- Pet
                    ["glass"]       = { item = 0, texture = 0},  -- Bril
                    ["ear"]         = { item = 0, texture = 0},  -- Oor accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Masker	
				},
			},		
		},		
        ["female"] = {
            [1] = {
                outfitLabel = "Doctor",
                outfitData = {
                    ["pants"]       = { item = 52, texture = 2},  -- PANTS
                    ["arms"]        = { item = 101, texture = 1},  -- ArmS
                    ["t-shirt"]     = { item = 38, texture = 1},  -- T Shirt
                    ["vest"]        = { item = 20, texture = 0},  -- VEST
                    ["torso2"]      = { item = 139, texture = 2},  -- JACKET
                    ["shoes"]       = { item = 62, texture = 20},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = -1, texture = -0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- MASK
				},
            },
            [2] = {
                outfitLabel = "short sleeve white polo",
                outfitData = {
                    ["pants"]       = { item = 34, texture = 0},  -- PANTS
                    ["arms"]        = { item = 98, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 6, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 20, texture = 0},  -- VEST
                    ["torso2"]      = { item = 237, texture = 1},  -- JACKET
                    ["shoes"]       = { item = 52, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = -1, texture = -0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- MASK
				},
            },
            [3] = {
                outfitLabel = "short sleeve blue polo",
                outfitData = {
                    ["pants"]       = { item = 34, texture = 0},  -- PANTS
                    ["arms"]        = { item = 98, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 6, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 20, texture = 0},  -- VEST
                    ["torso2"]      = { item = 237, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 52, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = -1, texture = -0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- MASK
				},
            },
            [4] = {
                outfitLabel = "short sleeve white button up",
                outfitData = {
                    ["pants"]       = { item = 34, texture = 0},  -- PANTS
                    ["arms"]        = { item = 98, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 6, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 20, texture = 0},  -- VEST
                    ["torso2"]      = { item = 238, texture = 1},  -- JACKET
                    ["shoes"]       = { item = 52, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = -1, texture = -0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- MASK
				},
            },
            [5] = {
                outfitLabel = "Placeholder",
                outfitLabel = "short sleeve blue button up",
                outfitData = {
                    ["pants"]       = { item = 34, texture = 0},  -- PANTS
                    ["arms"]        = { item = 98, texture = 0},  -- ArmS
                    ["t-shirt"]     = { item = 6, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 20, texture = 0},  -- VEST
                    ["torso2"]      = { item = 238, texture = 0},  -- JACKET
                    ["shoes"]       = { item = 52, texture = 0},  -- SHOES
                    -- ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 96, texture = 0},  -- Neck
                    ["bag"]         = { item = 0, texture = 0},  -- BAG
                    ["hat"]         = { item = -1, texture = -0},  -- HAT
            --      ["glass"]       = { item = 5, texture = 0},  -- GLASSES
            --      ["ear"]         = { item = -1, texture = 0},  -- EAR accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- MASK
				},
            },
        },
    },
}