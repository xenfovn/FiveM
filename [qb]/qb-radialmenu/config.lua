Config = {}

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Công dân',
        icon = '#citizen',
        items = {
            {
                id    = 'givenum',
                title = 'Chia Sẻ Danh Bạ',
                icon = '#nummer',
                type = 'client',
                event = 'qb-phone:client:GiveContactDetails',
                shouldClose = true,
            },
            {
                id    = 'getintrunk',
                title = 'Mở Cốp Xe',
                icon = '#vehiclekey',
                type = 'client',
                event = 'qb-trunk:client:GetIn',
                shouldClose = true,
            },
            {
                id    = 'cornerselling',
                title = 'Bán Hàng',
                icon = '#cornerselling',
                type = 'client',
                event = 'qb-drugs:client:cornerselling',
                shouldClose = true,
            },
            {
                id    = 'togglehotdogsell',
                title = 'Bán hotdog.',
                icon = '#cornerselling',
                type = 'client',
                event = 'qb-hotdogjob:client:ToggleSell',
                shouldClose = true,
            },
            --[[ {
                id = 'interactions',
                title = 'Tương Tác',
                icon = '#illegal',
                items = {
                    {
                        id    = 'handcuff',
                        title = 'Dây Đeo Tay',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:CuffPlayerSoft',
                        shouldClose = true,
                    },
                    {
                        id    = 'playerinvehicle',
                        title = 'Đưa vào xe',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true,
                    },
                    {
                        id    = 'playeroutvehicle',
                        title = 'Lấy ra khỏi xe',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true,
                    },
                    {
                        id    = 'stealplayer',
                        title = 'Cướp bóc',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true,
                    },
                    {
                        id    = 'escort',
                        title = 'Bắt cóc',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:KidnapPlayer',
                        shouldClose = true,
                    },
                    {
                        id    = 'escort2',
                        title = 'Hộ Tống',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:EscortPlayer',
                        shouldClose = true,
                    },
                    {
                        id    = 'escort554',
                        title = 'Con tin',
                        icon = '#general',
                        type = 'client',
                        event = 'A5:Client:TakeHostage',
                        shouldClose = true,
                    },
                }
            }, ]]
        }
    },
    [2] = {
        id = 'general',
        title = 'Chung',
        icon = '#general',
        items = {
            {
                id = 'house',
                title = 'Tương tác nhà',
                icon = '#house',
                items = {
                    {
                        id    = 'givehousekey',
                        title = 'Cung cấp chìa khóa nhà',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:giveHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'removehousekey',
                        title = 'Xóa chìa khóa của ngôi nhà',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:removeHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'togglelock',
                        title = 'Chuyển đổi khóa cửa.',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:toggleDoorlock',
                        shouldClose = true,
                    },
                    {
                        id    = 'decoratehouse',
                        title = 'Trang trí nhà',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:decorate',
                        shouldClose = true,
                    },            
                    {
                        id = 'houseLocations',
                        title = 'Địa điểm tương tác',
                        icon = '#house',
                        items = {
                            {
                                id    = 'setstash',
                                title = 'Đặt Tủ đồ',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setoutift',
                                title = 'Đặt tủ quần áo',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setlogout',
                                title = 'Đặt vị trí Thoát',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
            {
                id    = 'clothesmenu',
                title = 'Quần áo',
                icon = '#tshirt',
                items = {
                    {
                        id    = 'Hair',
                        title = 'Tóc',
                        icon = '#haar',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true,
                    },
                    {
                        id    = 'Ear',
                        title = 'Tai',
                        icon = '#oor',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleProps',
                        shouldClose = true,
                    },
                    {
                        id    = 'Neck',
                        title = 'Cổ áo',
                        icon = '#nek',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true,
                    },
                    {
                        id    = 'Top',
                        title = 'áo phần trên',
                        icon = '#jas',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true,
                    },
                    {
                        id    = 'Shirt',
                        title = 'Áo Trong',
                        icon = '#tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true,
                    },
                    {
                        id    = 'Pants',
                        title = 'Quần',
                        icon = '#broek',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true,
                    },
                    {
                        id    = 'Shoes',
                        title = 'Giày',
                        icon = '#schoen',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true,
                    },
                    {
                        id    = 'meer',
                        title = 'Bổ Sung',
                        icon = '#meer',
                        items = {
                            {
                                id    = 'Hat',
                                title = 'Mũ',
                                icon = '#hoed',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true,
                            },
                            {
                                id    = 'Glasses',
                                title = 'Kính',
                                icon = '#bril',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true,
                            },
                            {
                                id    = 'Visor',
                                title = 'Tấm Che',
                                icon = '#visor',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true,
                            },
                            {
                                id    = 'Mask',
                                title = 'Mặt Nạ',
                                icon = '#masker',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true,
                            },
                            {
                                id    = 'Vest',
                                title = 'Áo Giáp',
                                icon = '#vest',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true,
                            },
                            {
                                id    = 'Bag',
                                title = 'Túi',
                                icon = '#tas',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true,
                            },
                            {
                                id    = 'Bracelet',
                                title = 'Vòng đeo tay',
                                icon = '#armband',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true,
                            },
                            {
                                id    = 'Watch',
                                title = 'Đồng hồ đeo tay',
                                icon = '#horloge',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true,
                            },
                            {
                                id    = 'Gloves',
                                title = 'Găng tay',
                                icon = '#handschoenen',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
        }
    },
    [3] = {
        id = 'vehicle',
        title = 'Phương Tiện',
        icon = '#vehicle',
        items = {
            {
                id    = 'vehicledoors',
                title = 'Cửa xe',
                icon = '#vehicledoors',
                items = {
                    {
                        id    = 'door0',
                        title = 'Cửa lái xe',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door4',
                        title = 'mui xe',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door1',
                        title = 'Hành khách cửa.',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door3',
                        title = 'Phía sau phải',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door5',
                        title = 'Cốp Xe',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door2',
                        title = 'Phía sau bên trái',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                }
            },
            {
                id    = 'vehicleextras',
                title = 'Vehicle Extras',
                icon = '#plus',
                items = {
                    {
                        id    = 'extra1',
                        title = 'Extra 1',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra2',
                        title = 'Extra 2',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra3',
                        title = 'Extra 3',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra4',
                        title = 'Extra 4',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra5',
                        title = 'Extra 5',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra6',
                        title = 'Extra 6',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra7',
                        title = 'Extra 7',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra8',
                        title = 'Extra 8',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },
                    {
                        id    = 'extra9',
                        title = 'Extra 9',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false,
                    },                                                                                                                  
                }
            },
            {
                id    = 'vehicleseats',
                title = 'Ghế xe',
                icon = '#vehicledoors',
                items = {
                    {
                        id    = 'door0',
                        title = 'Người lái xe',
                        icon = '#plus',
                        type = 'client',
                        event = 'qb-radialmenu:client:ChangeSeat',
                        shouldClose = false,
                    },
                }
            },
        }
    },
    [4] = {
        id = 'jobinteractions',
        title = 'Nghề Nghiệp',
        icon = '#vehicle',
        items = {},
    },
}

Config.JobInteractions = {
    ["doctor"] = {
        {
            id    = 'statuscheck',
            title = 'Kiểm tra người.',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Chữa lành vết thương',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
        {
            id    = 'reviveplayer',
            title = 'Chữa Trị',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true,
        },
        {
            id    = 'emergencybutton2',
            title = 'Nút khẩn cấp',
            icon = '#general',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true,
        },
        {
            id    = 'escort',
            title = 'Hộ tống',
            icon = '#general',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true,
        },
        {
            id = 'brancardoptions',
            title = 'Brancard',
            icon = '#vehicle',
            items = {
                {
                    id    = 'spawnbrancard',
                    title = 'Spawn brancard',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:TakeBrancard',
                    shouldClose = false,
                },
                {
                    id    = 'despawnbrancard',
                    title = 'Remove brancard',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:RemoveBrancard',
                    shouldClose = false,
                },
            },
        },
    },
    ["ambulance"] = {
        {
            id    = 'statuscheck',
            title = 'Tìm kiếm Người',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Chữa Lành Vết Thương',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
        {
            id    = 'emergencybutton2',
            title = 'Nút khẩn cấp',
            icon = '#general',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true,
        },
        {
            id    = 'escort',
            title = 'Hộ tống',
            icon = '#general',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true,
        },
        {
            id = 'brancardoptions',
            title = 'Brancard',
            icon = '#vehicle',
            items = {
                {
                    id    = 'spawnbrancard',
                    title = 'Spawn brancard',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:TakeBrancard',
                    shouldClose = false,
                },
                {
                    id    = 'despawnbrancard',
                    title = 'Remove brancard',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:RemoveBrancard',
                    shouldClose = false,
                },
            },
        },
    },
    ["taxi"] = {
        {
            id    = 'togglemeter',
            title = 'Hiển thị/Ẩn đồng hồ',
            icon = '#general',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = false,
        },
        {
            id    = 'togglemouse',
            title = 'Đồng hồ khởi động/Dừng',
            icon = '#general',
            type = 'client',
            event = 'qb-taxi:client:enableMeter',
            shouldClose = true,
        },
        {
            id    = 'npc_mission',
            title = 'Nhận chuyến Taxi',
            icon = '#general',
            type = 'client',
            event = 'qb-taxi:client:DoTaxiNpc',
            shouldClose = true,
        },
    },
    ["tow"] = {
        {
            id    = 'togglenpc',
            title = 'Cứu hộ xe hỏng',
            icon = '#general',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true,
        },
        {
            id    = 'towvehicle',
            title = 'Nâng/Hạ Xe',
            icon = '#vehicle',
            type = 'client',
            event = 'qb-tow:client:TowVehicle',
            shouldClose = true,
        },
    },
    ["police"] = {
        {
            id    = 'emergencybutton',
            title = 'Khẩn Cấp',
            icon = '#general',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true,
        },
        {
            id    = 'checkvehstatus',
            title = 'Kiểm tra trạng thái điều chỉnh',
            icon = '#vehiclekey',
            type = 'client',
            event = 'qb-tunerchip:server:TuneStatus',
            shouldClose = true,
        },
        {
            id    = 'resethouse',
            title = 'Thiết lập lại khóa nhà.',
            icon = '#vehiclekey',
            type = 'client',
            event = 'qb-houses:client:ResetHouse',
            shouldClose = true,
        },
        {
            id    = 'takedriverlicense',
            title = 'Tịch Thu Bằng Lái Xe',
            icon = '#vehicle',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true,
        },
        {
            id = 'policeinteraction',
            title = 'Tương tác của cảnh sát',
            icon = '#house',
            items = {
                {
                    id    = 'statuscheck',
                    title = 'Người tìm kiếm',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true,
                },
                {
                    id    = 'checkstatus',
                    title = 'Kiểm tra trạng thái',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true,
                },
                {
                    id    = 'escort',
                    title = 'Áp Giải',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true,
                },
                {
                    id    = 'searchplayer',
                    title = 'Tìm Kiếm Người Chơi',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true,
                },
                {
                    id    = 'jailplayer',
                    title = 'Nhà Tù',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true,
                },
            }
        },
        {
            id = 'policeobjects',
            title = 'Vật Cản',
            icon = '#house',
            items = {
                {
                    id    = 'spawnpion',
                    title = 'Chóp cảnh báo',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false,
                },
                {
                    id    = 'spawnhek',
                    title = 'Rào Chắn',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnBarier',
                    shouldClose = false,
                },
                {
                    id    = 'spawnschotten',
                    title = 'Bảng Giới Hạn Tốc Độ',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnSchotten',
                    shouldClose = false,
                },
                {
                    id    = 'spawntent',
                    title = 'Cái lều',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false,
                },
                {
                    id    = 'spawnverlichting',
                    title = 'Đèn',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false,
                },
                {
                    id    = 'spikestrip',
                    title = 'Rải Đinh',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false,
                },
                {
                    id    = 'deleteobject',
                    title = 'Xóa Vật Cản',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false,
                },
            }
        },
    },
    ["hotdog"] = {
        {
            id    = 'togglesell',
            title = 'Bán',
            icon = '#general',
            type = 'client',
            event = 'qb-hotdogjob:client:ToggleSell',
            shouldClose = true,
        },
    },
    -- ["taxi"] = {

    -- },
}

Config.TrunkClasses = {
    [0]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes  
    [1]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sedans  
    [2]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --SUVs  
    [3]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes  
    [4]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Muscle  
    [5]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports Classics  
    [6]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports  
    [7]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Super  
    [8]  = { allowed = false, x = 0.0, y = -1.0, z = 0.25 }, --Motorcycles  
    [9]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Off-road  
    [10] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Industrial  
    [11] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Utility  
    [12] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Vans  
    [13] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Cycles  
    [14] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Boats  
    [15] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Helicopters  
    [16] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Planes  
    [17] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Service  
    [18] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Emergency  
    [19] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Military  
    [20] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Commercial  
    [21] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Trains  
}

Config.ExtrasEnabled = true				

Config.Commands = {
	["top"] = {
		Func = function() ToggleClothing("Top") end,
		Sprite = "top",
		Desc = "Áo Mặc/Cởi",
		Button = 1,
		Name = "Torso"
	},
	["gloves"] = {
		Func = function() ToggleClothing("Gloves") end,
		Sprite = "gloves",
		Desc = "Take your gloves off/on",
		Button = 2,
		Name = "Gloves"
	},
	["visor"] = {
		Func = function() ToggleProps("Visor") end,
		Sprite = "visor",
		Desc = "Toggle hat variation",
		Button = 3,
		Name = "Visor"
	},
	["bag"] = {
		Func = function() ToggleClothing("Bag") end,
		Sprite = "bag",
		Desc = "Opens or closes your bag",
		Button = 8,
		Name = "Bag"
	},
	["shoes"] = {
		Func = function() ToggleClothing("Shoes") end,
		Sprite = "shoes",
		Desc = "Take your shoes off/on",
		Button = 5,
		Name = "Shoes"
	},
	["vest"] = {
		Func = function() ToggleClothing("Vest") end,
		Sprite = "vest",
		Desc = "Take your vest off/on",
		Button = 14,
		Name = "Vest"
	},
	["hair"] = {
		Func = function() ToggleClothing("Hair") end,
		Sprite = "hair",
		Desc = "Put your hair up/down/in a bun/ponytail.",
		Button = 7,
		Name = "Hair"
	},
	["hat"] = {
		Func = function() ToggleProps("Hat") end,
		Sprite = "hat",
		Desc = "Take your hat off/on",
		Button = 4,
		Name = "Hat"
	},
	["glasses"] = {
		Func = function() ToggleProps("Glasses") end,
		Sprite = "glasses",
		Desc = "Take your glasses off/on",
		Button = 9,
		Name = "Glasses"
	},
	["ear"] = {
		Func = function() ToggleProps("Ear") end,
		Sprite = "ear",
		Desc = "Take your ear accessory off/on",
		Button = 10,
		Name = "Ear"
	},
	["neck"] = {
		Func = function() ToggleClothing("Neck") end,
		Sprite = "neck",
		Desc = "Take your neck accessory off/on",
		Button = 11,
		Name = "Neck"
	},
	["watch"] = {
		Func = function() ToggleProps("Watch") end,
		Sprite = "watch",
		Desc = "Take your watch off/on",
		Button = 12,
		Name = "Watch",
		Rotation = 5.0
	},
	["bracelet"] = {
		Func = function() ToggleProps("Bracelet") end,
		Sprite = "bracelet",
		Desc = "Take your bracelet off/on",
		Button = 13,
		Name = "Bracelet"
	},
	["mask"] = {
		Func = function() ToggleClothing("Mask") end,
		Sprite = "mask",
		Desc = "Take your mask off/on",
		Button = 6,
		Name = "Mask"
	}
}

local Bags = {
	[40] = true,
	[41] = true,
	[44] = true,
	[45] = true
}

Config.ExtraCommands = {
	["pants"] = {
		Func = function() ToggleClothing("Pants", true) end,
		Sprite = "pants",
		Desc = "Take your pants off/on",
		Name = "Pants",
		OffsetX = -0.04,
		OffsetY = 0.0,
	},
	["shirt"] = {
		Func = function() ToggleClothing("Shirt", true) end,
		Sprite = "shirt",
		Desc = "Take your shirt off/on",
		Name = "shirt",
		OffsetX = 0.04,
		OffsetY = 0.0,
	},
	["reset"] = {
		Func = function() if not ResetClothing(true) then Notify("Je draagt dit al") end end,
		Sprite = "reset",
		Desc = "Revert everything back to normal",
		Name = "reset",
		OffsetX = 0.12,
		OffsetY = 0.2,
		Rotate = true
	},
	["bagoff"] = {
		Func = function() ToggleClothing("Bagoff", true) end,
		Sprite = "bagoff",
		SpriteFunc = function()
			local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
			local BagOff = LastEquipped["Bagoff"]
			if LastEquipped["Bagoff"] then
				if Bags[BagOff.Drawable] then
					return "bagoff"
				else
					return "paraoff"
				end
			end
			if Bag ~= 0 then
				if Bags[Bag] then
					return "bagoff"
				else
					return "paraoff"
				end
			else
				return false
			end
		end,
		Desc = "Take your bag off/on",
		Name = "bagoff",
		OffsetX = -0.12,
		OffsetY = 0.2,
	},
}
