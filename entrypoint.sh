#!/bin/sh

# Wait until Postgres is ready.
while ! pg_isready -q -d $DATABASE_URL
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

mix ecto.setup || mix ecto.migrate

exec mix phx.server