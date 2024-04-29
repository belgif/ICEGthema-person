CREATE TABLE IF NOT EXISTS "registry" (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT
        );

CREATE TABLE IF NOT EXISTS "transaction" (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT,
                "registry_id" INTEGER,
                "timestamp" DATETIME,
                FOREIGN KEY ("registry_id") REFERENCES "registry"("id")
        );

CREATE TABLE IF NOT EXISTS "record" (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT,
                "registry_id" INTEGER,
                "identifier" TEXT,
                FOREIGN KEY ("registry_id") REFERENCES "registry"("id")
        );

CREATE TABLE IF NOT EXISTS "property" (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT,
                "type_name" TEXT,
                "property_name" TEXT,
                "multi" INTEGER DEFAULT 'FALSE'
        );

CREATE TABLE IF NOT EXISTS "statement" (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT,
                "record_id" INTEGER,
                "property_id" INTEGER,
                "transaction_id" INTEGER,
                "effective_from" DATETIME,
                FOREIGN KEY ("record_id") REFERENCES "record"("id"),
                FOREIGN KEY ("property_id") REFERENCES "property"("id"),
                FOREIGN KEY ("transaction_id") REFERENCES "transaction"("id")
        );

CREATE TABLE IF NOT EXISTS "assertion" (
                "statement_id" INTEGER PRIMARY KEY,
                "value" TEXT,
                FOREIGN KEY ("statement_id") REFERENCES "statement"("id")
        );
        
CREATE TABLE IF NOT EXISTS "retraction" (
                "statement_id" INTEGER PRIMARY KEY,
                "assertion_id" INTEGER,
                FOREIGN KEY ("statement_id") REFERENCES "statement"("id"),
                FOREIGN KEY ("assertion_id") REFERENCES "assertion"("id")
        );