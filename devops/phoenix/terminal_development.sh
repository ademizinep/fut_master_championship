#!/bin/sh

set -e

DATABASE_URL=postgresql://username:password@postgres:5432/fut_master_championship_development \
  iex -S mix
