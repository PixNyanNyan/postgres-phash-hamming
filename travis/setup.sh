#!/bin/sh

# set -x
set -e

curl --silent --location --fail \
  https://github.com/PixNyanNyan/postgres-phash-hamming/raw/master/travis/setup.sh | \
  sh

pg_version=$(ruby -r yaml \
  -e 'print((YAML.load(ARGF.read)["addons"] || {})["postgresql"])' \
  .travis.yml)

if [ -n "${pg_version}" ]; then
  sudo apt-get install -qq -y postgresql-server-dev-${pg_version}

  git clone --quiet --recursive --depth 1 \
    https://github.com/PixNyanNyan/postgres-phash-hamming.git
  cd postgres-phash-hamming
  make
  sudo make install
  cd ..

  psql -U postgres -d template1 -c 'CREATE EXTENSION pg_phash;'
fi
