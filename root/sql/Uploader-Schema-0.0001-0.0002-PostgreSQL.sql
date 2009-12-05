-- Convert schema '/home/stephan/catalyst/Uploader/bin/../root/sql/Uploader-Schema-0.0001-PostgreSQL.sql' to '/home/stephan/catalyst/Uploader/bin/../root/sql/Uploader-Schema-0.0002-PostgreSQL.sql':;

BEGIN;

ALTER TABLE role ALTER COLUMN id TYPE serial;


COMMIT;

