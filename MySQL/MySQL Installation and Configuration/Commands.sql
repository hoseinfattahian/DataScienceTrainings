CREATE ROLE 'ROLE1',  'ROLE2',  'ROLE3',  'ROLE4';					-- CREATES ROLE NAMES 'ROLE1',  'ROLE2',  'ROLE3',  'ROLE4'

GRANT ALL ON dbName TO 'ROLE1';										-- Grants all privillages to ROLE1
GRANT SELECT,INSERT ON dbName TO 'ROLE1';							-- Grants SELECT,INSERT privillages to ROLE1

CREATE USER 'username'@'host' IDENTIFIED BY 'password';				-- Creates user. The ' must be present in the query
SET DEFAULT ROLE 'ROLE1' TO 'username'@'host';						-- Sets default role to the user IN THE NEXT USER SESSION
GRANT 'ROLE1' TO 'username'@'host';

DROP USER 'username'@'host';
DROP ROLE 'ROLE1',  'ROLE2',  'ROLE3',  'ROLE4';


ALTER USER 'username'@'host' PASSWORD EXPIRE;						-- Expires the password of the user immidiately
ALTER USER 'username'@'host' PASSWORD EXPIRE INTERVAL 90 DAY;		-- Sets the password expiration period
ALTER USER 'username'@'host' PASSWORD EXPIRE INTERVAL NEVER;		
ALTER USER 'username'@'host' PASSWORD EXPIRE DEFAULT;



SHOW ENGINES;														-- Shows all storage engines. Default storage engine is InnoDB. Best choice
																	-- MyISAM is for previous version of MySQL used for legacy applications
																	-- MEMORY is fast but not persistant. It daes not support Blob and is not used for high volume tables.
																	-- CSV is camma seperated value file as database
																	-- BLACKHOLE. Everything that you write will disappear
																	-- ARCHIVE is Used for archive. Data is without index and is not suitable for transactions.
																	-- MERGE_MYISAM. For Data warehausing and for high volume and high availibility.
																	-- FEDERATED. Data is not saved locally and sends to a remote schema
																	
CREATE TABLE IF NOT EXISTS tableName(
	col1 TYPE1,
	col2 TYPE2.
	.
	.
	.
	) ENGINE = MEMORY
	
	
																	-- InnoDB is fully ACID compliant: Atomicity, Consistency, Isolation and Durability
																	-- It means that if transaction fails or succeeds, the database remains in coherent and usable state.
																	-- low-level-locking: multiple concurrent read and write on multiple rows in single table without effecting on database integrity
																	-- MVCC: Multi-Version Concurrency Control keeps old and new changes in the transactions during concurrent transaction without effecting on consistency
																	