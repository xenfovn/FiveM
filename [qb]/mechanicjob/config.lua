Config = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    "PAD82880",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Động cơ",
    ["body"] = "Thân hình",
    ["radiator"] = "Tỏa nhiệt",
    ["axle"] = "Trục Bánh",
    ["brakes"] = "Phanh",
    ["clutch"] = "Chân Côn",
    ["fuel"] = "Nhiên Liệu",
}

Config.RepairCost = {
    ["body"] = "nhựa",
    ["radiator"] = "nhựa",
    ["axle"] = "Thép",
    ["brakes"] = "Sắt",
    ["clutch"] = "nhôm",
    ["fuel"] = "nhựa",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 3,
    },
    ["radiator"] = {
        item = "steel",
        costs = 5,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 7,
    },
    ["brakes"] = {
        item = "copper",
        costs = 5,
    },
    ["clutch"] = {
        item = "copper",
        costs = 6,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 4,
    },
}

Config.Businesses = {
    "Sữa chữa ô tô",
}

Config.Plates = {
    [1] = {
        coords = {x = -327.03, y = -144.25, z = 39.02, h = 77.64, r = 1.0},
        AttachedVehicle = nil,
    },
    [2] = {
        coords = {x = -324.92, y = -139.17, z = 39.02, h = 66.43, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [3] = {
        coords = {x = -323.0, y = -133.97, z = 39.02, h = 64.46, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [4] = {
        coords = {x = -321.26, y = -128.75, z = 39.02, h = 75.17, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [5] = {
        coords = {x = -319.42, y = -123.36, z = 39.02, h = 72.7, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [6] = {
        coords = {x = -339.25, y = -94.8, z = 39.02, h = 251.23, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [7] = {
        coords = {x = -352.88, y = -90.24, z = 39.02, h = 260.14, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [8] = {
        coords = {x = -366.04, y = -85.35, z = 39.02, h = 251.19, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [9] = {
        coords = {x = -317.65, y = -118.42, z = 39.02, h = 71.54, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [10] = {
        coords = {x = -317.65, y = -118.42, z = 39.02, h = 71.54, r = 1.0}, 
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = {x = -379.4, y = -121.52, z = 38.69, h = 284.83, r = 1.0},
    ["stash"] = {x = -315.21, y = -124.68, z = 39.02, h = 258.32, r = 1.0},
    ["duty"] = {x = -339.03, y = -155.69, z = 44.59, h = 170.48, r = 1.0},
    ["vehicle"] = {x = -375.18, y = -112.6, z = 38.7, h = 115.7, r = 1.0}, 
}

Config.Vehicles = {
    ["towtruck"] = "Xe Kéo Lớn",
    ["towtruck2"] = "Xe Kéo Nhỏ",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Tỏa nhiệt",
    ["axle"] = "Ổ trục",
    ["brakes"] = "Phanh",
    ["clutch"] = "Chân Côn",
    ["fuel"] = "Bình xăng",
}