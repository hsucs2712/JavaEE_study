--
-- This is the Database Schema for the Sport League system.
-- JDBC URL: jdbc:derby://localhost:1527/leagueDB
-- User: SPUB
-- Password: SPUB
--

-- Clear out the old table, if they existed at all.
DROP TABLE Registration;
DROP TABLE Player;
DROP TABLE League;
DROP TABLE ObjectIDs;


--
-- This table represents the "next" object_ID for a given table.
--
CREATE TABLE ObjectIDs (
-- PRIMARY KEY --
   table_name      VARCHAR(30)    PRIMARY KEY,
-- DATA FIELDS --
   ID_number       INTEGER        NOT NULL
);


--
-- This table represents the League objects
--
CREATE TABLE League (
-- PRIMARY KEY --
   LID             INTEGER        PRIMARY KEY,
-- DATA FIELDS --
   yearno          INTEGER        NOT NULL,
   season          VARCHAR(10)    NOT NULL,
   title           VARCHAR(30)    NOT NULL 
);


--
-- This table represents the Player objects
--
CREATE TABLE Player (
-- PRIMARY KEY --
   PID             INTEGER        PRIMARY KEY,
-- DATA FIELDS --
   name            VARCHAR(30)    NOT NULL,
   address         VARCHAR(30)    NOT NULL,
   city            VARCHAR(20)    NOT NULL,
   province        VARCHAR(10)    NOT NULL,
   postal_code     VARCHAR(10)    NOT NULL
);


--
-- This table represents the relationship between leagues and players.
--
CREATE TABLE Registration (
-- PRIMARY KEY --
   LID             INTEGER        NOT NULL,
   PID             INTEGER        NOT NULL
);
