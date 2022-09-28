/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int PRIMARY KEY   NOT NULL,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

/*Add a column species of type string to your animals table. Modify your schema.sql file*/
ALTER TABLE animals ADD species varchar(100);
