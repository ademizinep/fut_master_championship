#!/bin/sh

set -e

mix ecto.drop && \
  mix ecto.create && \
  mix ecto.migrate && \
  mix run priv/repo/seeds.exs
