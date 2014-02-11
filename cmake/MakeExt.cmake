FILE(READ sql/pgagent.sql PGAGENT_SQL)
STRING(REPLACE "BEGIN TRANSACTION;" "" PGAGENT_SQL "${PGAGENT_SQL}")
STRING(REPLACE "COMMIT TRANSACTION;" "" PGAGENT_SQL "${PGAGENT_SQL}")
STRING(REPLACE "CREATE SCHEMA pgagent;" "" PGAGENT_SQL "${PGAGENT_SQL}")
STRING(REPLACE "-- EXT SELECT" "SELECT" PGAGENT_SQL "${PGAGENT_SQL}")
FILE(WRITE "pgagent--${VERSION}.sql" "${PGAGENT_SQL}")

CONFIGURE_FILE(pgagent.control.in pgagent.control)
