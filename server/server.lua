function cleanUpDatabase()
    local days = Config.Days
    exports.oxmysql:fetch('SELECT identifier, charidentifier FROM characters WHERE LastLogin < DATE_SUB(NOW(), INTERVAL ? DAY)', {days}, function(characters)
        if characters then
            for _, character in ipairs(characters) do
                for _, tableConfig in ipairs(Config.DatabaseTables) do
                    local identifierColumn = tableConfig.userCharID and 'charidentifier' or 'identifier'
                    local identifierValue = tableConfig.userCharID and character.charidentifier or character.identifier
                    identifierValue = tostring(identifierValue)

                    local checkSQL = string.format('SELECT EXISTS(SELECT 1 FROM `%s` WHERE `%s` = ? LIMIT 1) AS exist', tableConfig.table, tableConfig.columnName)
                    exports.oxmysql:fetch(checkSQL, {identifierValue}, function(exists)
                        if exists and exists[1] and exists[1].exist > 0 then
                            local deleteSQL = string.format('DELETE FROM `%s` WHERE `%s` = ?', tableConfig.table, tableConfig.columnName)
                            exports.oxmysql:execute(deleteSQL, {identifierValue}, function(affectedRows)
                                print(string.format('Deleted %s rows from %s for %s', tostring(affectedRows), tableConfig.table, identifierValue))
                            end)
                        else

                            print(string.format('No records to delete from %s for %s', tableConfig.table, identifierValue))
                        end
                    end)
                end
            end
        else
            print('No characters found or error fetching characters.')
        end
    end)
end

cleanUpDatabase()
