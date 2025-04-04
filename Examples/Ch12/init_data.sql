--
-- This script populates the Sport League database.
--

-- Insert the basic ObjectID types.
INSERT INTO ObjectIDs (table_name, ID_number)
  VALUES ('League', 7);
INSERT INTO ObjectIDs (table_name, ID_number)
  VALUES ('Player', 1);

-- Create the initial set of leagues.
INSERT INTO League (LID, yearno, season, title)
  VALUES (1, 2019, 'Spring', 'Soccer League (Spring ''19)');
INSERT INTO League (LID, yearno, season, title)
  VALUES (2, 2019, 'Summer', 'Summer Soccer Fest 2019');
INSERT INTO League (LID, yearno, season, title)
  VALUES (3, 2019, 'Fall', 'Fall Soccer League (2019)');
INSERT INTO League (LID, yearno, season, title)
  VALUES (4, 2020, 'Spring', 'Soccer League (Spring ''20)');
INSERT INTO League (LID, yearno, season, title)
  VALUES (5, 2020, 'Summer', 'The Summer of Soccer Love 2020');
INSERT INTO League (LID, yearno, season, title)
  VALUES (6, 2020, 'Fall', 'Fall Soccer League (2020)');
