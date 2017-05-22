# postgres-phash-hamming

## What's this?

It's a postgresql extension providing `ph_hamming_distance` function from pHash.org.

## How to install?

1. Clone the repo and make sure you have correct version of postgres-server-dev installed.

2. Verify PG_CONFIG in Makefile has correct path to pg_config, then `make && make install` to install it.

3. Log into the database, run `CREATE EXTENSION pg_phash;` to activate the extension.

## How to use?

The `phash_hamming` function accepts two base-10 number strings as parameters.

Valid return value range is 0~255, and it returns 0x7FFFFFFF(INT_MAX) if null is supplied as input.

For example, if you have two images and their hashes are '13121266429874464083' and '10869537466045227287'.

```
SELECT phash_hamming('13121266429874464083', '10869537466045227287');

 phash_hamming
---------------
            16
(1 row)
```

## License

GPL 3.0 license as restricted by pHash.
