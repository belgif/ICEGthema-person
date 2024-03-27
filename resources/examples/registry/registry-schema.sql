CREATE TABLE sqlite_sequence(name,seq);

CREATE TABLE registry_record (
        registry_id INTEGER,
        record_id INTEGER,
        FOREIGN KEY (registry_id) REFERENCES registry(id),
        FOREIGN KEY (record_id) REFERENCES record(id),
        PRIMARY KEY (registry_id, record_id)
    );

CREATE TABLE registry_transaction (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        registry_id INTEGER,
        created DATETIME,
        FOREIGN KEY (registry_id) REFERENCES registry(id)
    );

CREATE TABLE registry (
        id INTEGER PRIMARY KEY AUTOINCREMENT
    );

CREATE TABLE record (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        registry_id INTEGER,
        identifier TEXT,
        FOREIGN KEY (registry_id) REFERENCES registry(id)
    );

CREATE TABLE property (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type_name TEXT,
        property_name TEXT
    );

CREATE TABLE statement (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        record_id INTEGER,
        property_id INTEGER,
        effective_from DATETIME,
        created DATETIME,
        FOREIGN KEY (record_id) REFERENCES record(id),
        FOREIGN KEY (property_id) REFERENCES property(id)
    );
    
CREATE TABLE value (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        statement_id INTEGER,
        value TEXT,
        FOREIGN KEY (statement_id) REFERENCES statement(id)
    );