EXTENSION = pg_phash
MODULE_big = pg_phash
OBJS = pg_phash.o
DATA = pg_phash--1.0.sql

PG_CONFIG = pg_config
#PG_CONFIG = /usr/local/Cellar/postgresql/9.6.2/bin/pg_config

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
