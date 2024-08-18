--Problem to Solve
--Hartsfield-Jackson International Airport, perhaps better known as “ATL” for its IATA airport code, has been the busiest airport in the world since 1998. Located in Atlanta, Georgia in the United States, ATL served 93.7 million passengers in 2022. Maybe you were one of them!

--Suppose you’ve just been hired to help ATL re-design their database system. In a file called schema.sql in a folder called atl, write a set of SQL statements to design a database with which Hartsfield-Jackson could keep track of its passengers and their flights. 

--Specification
--Your task at hand is to create a SQLite database for ATL from scratch, as by writing a set of CREATE TABLE statements in a schema.sql file. The implementation details are up to you, though you should minimally ensure your database meets the airport’s requirements and that it can represent the given sample data.

--Requirements
--To understand ATL’s requirements for their database, you sat down to have a conversation with the Assistant General Manager for IT --Operations.

--Passengers
   -- When it comes to our passengers, we just need to have the essentials in line: the first name, last name, and age. That’s all we need to know—nothing more.

CREATE TABLE "passengers" (
"id" INTEGER,
"first_name" TEXT NOT NULL,
"last_name" TEXT NOT NULL,
"age" INTEGER NOT NULL,
PRIMARY KEY ("id")
);

--Airlines
-- ATL’s a hub for many domestic and international airlines: names like Delta, British Airways, Air France, Korean Air, and Turkish Airlines. The list goes on. So here’s what we track:
--The name of the airline
-- The “concourse” or, shall I say, the section of our airport where the airline operates. We have 7 concourses: A, B, C, D, E, F, and T.

CREATE TABLE "airlines" (
"id" INTEGER,
"name" TEXT NOT NULL,
"concourses" TEXT NOT NULL CHECK ("concourses" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
PRIMARY KEY ("id")
);

--Flights
--We serve as many as 1,000 flights daily. To ensure that our passengers are never left wondering, we need to give them all the critical details about their flight. Here’s what we’d like to store:

       -- The flight number. For example, “900”. Just know that we sometimes re-use flight numbers.
       -- The airline operating the flight. You can keep it simple and assume one flight is operated by one airline.
       -- The code of the airport they’re departing from. For example, “ATL” or “BOS”.
       -- The code of the airport they’re heading to
       -- The expected departure date and time (to the minute, of course!)
       -- The expected arrival date and time, to the very same accuracy


CREATE TABLE "flights" (
"id" INTEGER,
"airline_id" INTEGER,
"flight_number" INTEGER,
"airport_from" TEXT NOT NULL,
"airport_to" TEXT NOT NULL,
"departure_time" NUMERIC NOT NULL,
"arrival_time" NUMERIC NOT NULL,
PRIMARY KEY ("id"),
FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);


--Check-Ins
--When passengers arrive at ATL, they’ll often “check in” to their flights. That’s them telling us they’re here and all set to board. We’d like to keep a tidy log of such moments. And what would we need to log, you ask? Well, here’s what we need:

        --The exact date and time at which our passenger checked in
        --The flight they are checking in for, of course. Can’t lose track of where they’re headed, now can we?

CREATE TABLE "check_ins" (
"id" INTEGER,
"passenger_id" INTEGER NOT NULL,
"time_check_in" NUMERIC NOT NULL,
"flight_id"  INTEGER NOT NULL,
PRIMARY KEY ("id"),
FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);
