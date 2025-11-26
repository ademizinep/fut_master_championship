#!/bin/sh

set -e

PORT=4000 \
DATABASE_URL=postgresql://username:password@postgres:5432/fut_master_championship_development \
  mix phx.server
