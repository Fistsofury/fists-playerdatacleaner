Config = {}

Config.Days = 45 -- how many days since last login to delete the data

Config.DatabaseTables = {
    --DONT FORGET TO ADD THE TABLES YOU WANT TO CLEAN UP HERE!!
    {
        table = 'loadout', -- table name as is in the database
        columnName = 'charidentifier', --the exact column name in the table
        userCharID = true, -- do you want to use characterid (charid) set to false to use steamid AKA identifier
    },

    {
        table = 'character_inventories',
        columnName = 'character_id',
        userCharID = true,
    },
    {
        table = 'horses',
        columnName = 'charid',
        userCharID = true,
    },

    {
        table = 'boats',
        columnName = 'charid',
        userCharID = true,
    },


    {
        table = 'herbalists',
        columnName = 'charidentifier',
        userCharID = true,
    },

    {
        table = 'horsestrainers',
        columnName = 'charidentifier',
        userCharID = true,
    },

    {
        table = 'horses_breeding',
        columnName = 'charid',
        userCharID = true,
    },

    {
        table = 'horse_complements',
        columnName = 'charidentifier',
        userCharID = true,
    },


--[[
    I leave the characters table to last because of Foreign Key constraints, if you dont know what those are i advise googling Foreign Key constraints in SQL.
    You are more then welcome to move it to the first position in the table if you know what you are doing.
]]

    {
        table = 'characters',
        columnName = 'charidentifier',
        userCharID = true,
    },


}



