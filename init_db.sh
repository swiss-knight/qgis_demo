#!/bin/bash

set -e

echo "Initializing database ${POSTGRES_DB}..."

psql -d "${POSTGRES_DB}" -f "/sql/init_db.sql"

echo "Database Initialized successfully!"
