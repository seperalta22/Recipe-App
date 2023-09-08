#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
rails db:reset
rails db:migrate