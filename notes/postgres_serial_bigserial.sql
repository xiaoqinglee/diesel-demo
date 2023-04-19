-- 笔记
-- https://stackoverflow.com/questions/37970743/postgresql-unique-violation-7-error-duplicate-key-value-violates-unique-const/37972960#37972960
-- https://stackoverflow.com/questions/244243/how-to-reset-postgres-primary-key-sequence-when-it-falls-out-of-sync

SELECT MAX(id) FROM posts;
SELECT nextval('posts_id_seq'); -- 有副作用

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE posts IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval('posts_id_seq', COALESCE((SELECT MAX(id)+1 FROM posts), 1), false);
COMMIT;
