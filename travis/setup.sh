#!/bin/sh

# set -x
set -e

pg_version=$(ruby -r yaml \
  -e 'print((YAML.load(ARGF.read)["addons"] || {})["postgresql"])' \
  .travis.yml)

if [ -n "${pg_version}" ]; then
  sudo apt-get install -qq -y postgresql-server-dev-${pg_version}

  git clone https://github.com/PixNyanNyan/postgres-phash-hamming.git
  cd postgres-phash-hamming
  make
  sudo make install
  cd ..

  psql -U postgres -d template1 -c 'CREATE EXTENSION pg_phash;'
fi
