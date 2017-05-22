CREATE FUNCTION phash_hamming (signature1 varchar, signature2 varchar) RETURNS int AS '$libdir/pg_phash' LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;
