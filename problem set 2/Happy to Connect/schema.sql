--Problem to Solve
--LinkedIn is “the world’s largest professional network” with a mission to “connect the world’s professionals to make them more productive and successful.” Perhaps you have an account? On the platform, users can post their professional experience (i.e., past jobs, education, etc.) and make connections with other people they’ve met, in-person or online.
--In a file called schema.sql in a folder called connect, write a set of SQL statements to design a database LinkedIn could use.

--Specification
--Your task at hand is to create a SQLite database for LinkedIn from scratch, as by writing a set of CREATE TABLE statements in a schema.sql file. The implementation details are up to you, though you should minimally ensure that your database meets the platform’s specification and that it can represent the given sample data.

--Platform

--Users
--The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:
   -- Their first and last name
   -- Their username
   --Their password
--Keep in mind that, if a company is following best practices, application passwords are “hashed.” No need to worry about hashing passwords here, though.

-- Table Users
CREATE TABLE users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL,
    passwd TEXT NOT NULL,
    PRIMARY KEY (id)
);

--Schools and Universities
--LinkedIn also allows for official school or university accounts, such as that for Harvard, so alumni (i.e., those who’ve attended) can identify their affiliation. Ensure that LinkedIn’s database can store the following information about each school:
    --The name of the school
    --The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower       School”, “Upper School”, “College”, “University”, etc.)
    --The school’s location
    --The year in which the school was founded

--Table Schools and Universities
CREATE TABLE schools (
    id INTEGER,
    sch_name TEXT NOT NULL,
    sch_type TEXT NOT NULL,
    sch_loc TEXT NOT NULL,
    year_founded INTEGER NOT NULL,
    PRIMARY KEY (id)
);

--Companies
--LinkedIn allows companies to create their own pages, like the one for LinkedIn itself, so employees can identify their past or current employment with the company. Ensure that LinkedIn’s database can store the following information for each company:

    --The name of the company
    --The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
    --The company’s location

--Table Companies
CREATE TABLE companies (
    id INTEGER,
    company_name TEXT NOT NULL,
    industry TEXT NOT NULL,
    company_loc TEXT NOT NULL,
    PRIMARY KEY (id)
);

----Connections
--And finally, the essence of LinkedIn is its ability to facilitate connections between people. Ensure LinkedIn’s database can support each of the following connections.


--Connections with People
--LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between users. No need to worry about one-way connections, such as user A “following” user B without user B “following” user A.
  
-- Table user connections
CREATE TABLE user_connections (
    id INTEGER,
    user_id INTEGER UNIQUE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);


--Connections with Schools
--A user should be able to create an affiliation with a given school. And similarly, that school should be able to find its alumni. Additionally, allow a user to define:
    --The start date of their affiliation (i.e., when they started to attend the school)
    --The end date of their affiliation (i.e., when they graduated), if applicable
    --The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)

--- Table school connections
CREATE TABLE school_connections (
    id INTEGER,
    user_id INTEGER NOT NULL,
    school_id INTEGER NOT NULL,
    startdate NUMERIC NOT NULL,
    enddate NUMERIC NOT NULL,
    degree TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
    FOREIGN KEY (school_id) REFERENCES schools (id)
);

--Connections with Companies
--A user should be able to create an affiliation with a given company. And similarly, a company should be able to find its current and past employees. Additionally, allow a user to define:

    --The start date of their affiliation (i.e., the date they began work with the company)
    --The end date of their affiliation (i.e., when left the company), if applicable
    --The title they held while affiliated with the company

--Table company connections
CREATE TABLE company_connections (
    id INTEGER,
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    startdate NUMERIC NOT NULL,
    end_date NUMERIC NOT NULL,
    title TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
    FOREIGN KEY (company_id) REFERENCES companies (id)
);
