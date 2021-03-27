function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Database", "", "App Settings", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS app_settings (data_text, data_value)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("Database", "",
                                               "App Settings", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbSet(data_text, data_value){
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO app_settings VALUES(?, ?)',
                      [data_text, data_value])
    })
}
function dbGet(data_text){
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        var result = tx.executeSql('SELECT data_value FROM app_settings WHERE data_text="'+data_text+'"')
        rowid = result.rows.item(0).data_value
    })
    return rowid;
}
function dbUpdate(data_text, data_value)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql(
                    'update app_settings set data_text=?, data_value=?', [data_text, data_value])
    })
}

