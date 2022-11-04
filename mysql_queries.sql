CREATE DATABASE imdb;
USE imdb;
# ========================
SHOW VARIABLES LIKE "secure_file_priv";
# ========================
show global variables like 'local_infile';
set global local_infile=true;

# ==========name_basics==============
DROP TABLE name_basics;
/* CREATE TABLE */
CREATE TABLE name_basics(
`nconst` VARCHAR(100),
`primaryName` VARCHAR(100),
`birthYear` INT,
`deathYear` INT,
`primaryProfession` VARCHAR(100),
`knownForTitles` VARCHAR(100)
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/name.basics.tsv'
INTO TABLE name_basics
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM name_basics LIMIT 10;

select * from name_basics WHERE primaryName LIKE "Fred Astaire%";
# two lines without comments, thus missing comments column
# 12029558 row(s) affected, 2 warning(s): 
# 1265 Data truncated for column 'primaryName' at row 7706341 
# 1265 Data truncated for column 'primaryName' at row 7941053
# Records: 12029558  Deleted: 0  Skipped: 0  Warnings: 2
SELECT * FROM name_basics WHERE nconst = "nm4900920" OR nconst = "nm4635165";



# ========title_akas================
DROP TABLE title_akas;
/* CREATE TABLE */
CREATE TABLE title_akas(
`titleId` VARCHAR(100),
`ordering` INT,
`title` VARCHAR(100),
`region` VARCHAR(10),
`language` VARCHAR(20),
`types` VARCHAR(50),
`attributes` VARCHAR(20),
`isOriginalTitle` INT
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.akas.tsv'
INTO TABLE title_akas
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM title_akas LIMIT 10;

# ========title_basics================
DROP TABLE title_basics;
/* CREATE TABLE */
CREATE TABLE title_basics(
`tconst` VARCHAR(10),
`titleType` VARCHAR(100),
`primaryTitle` VARCHAR(100),
`originalTitle` VARCHAR(100),
`isAdult` INT,
`startYear` INT,
`endYear` INT,
`runtimeMinutes` INT,
`genres` VARCHAR(50)
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.basics.tsv'
INTO TABLE title_basics
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM title_basics LIMIT 10;

# ========title_crew================
DROP TABLE title_crew;
/* CREATE TABLE */
CREATE TABLE title_crew(
`tconst` VARCHAR(10),
`directors` VARCHAR(100),
`writers` VARCHAR(100)
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.crew.tsv'
INTO TABLE title_crew
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM title_crew LIMIT 10;

# ========title_episode================
DROP TABLE title_episode;
/* CREATE TABLE */
CREATE TABLE title_episode(
`tconst` VARCHAR(10),
`parentTconst` VARCHAR(100),
`seasonNumber` INT,
`episodeNumber` INT
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.episode.tsv'
INTO TABLE title_episode
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM title_episode LIMIT 10;

# ========title_principals================
DROP TABLE title_principals;
/* CREATE TABLE */
CREATE TABLE title_principals(
`tconst` VARCHAR(10),
`ordering` INT,
`nconst` VARCHAR(100),
`category` VARCHAR(100),
`job` VARCHAR(100),
`characters` VARCHAR(100)
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.episode.tsv'
INTO TABLE title_principals
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM title_principals LIMIT 10;

# ========title_ratings================
DROP TABLE title_ratings;
/* CREATE TABLE */
CREATE TABLE title_ratings(
`tconst` VARCHAR(10),
`averageRating` DOUBLE,
`numVotes` INT,
PRIMARY KEY (tconst)
);

 LOAD DATA LOCAL INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title.ratings.tsv'
INTO TABLE title_ratings
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM title_ratings LIMIT 10;