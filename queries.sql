/*Queries that provide answers to the questions from all projects.*/

/*Find all animals whose name ends in "mon"*/
SELECT * from animals WHERE name like '%mon';

/*List the name of all animals born between 2016 and 2019*/
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/*List the name of all animals that are neutered and have less than 3 escape attempts*/
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

/*List the date of birth of all animals named either "Agumon" or "Pikachu"*/
SELECT date_of_birth from animals WHERE name = 'Agumon' or name = 'Pikachu';

/*List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

/*Find all animals that are neutered*/
SELECT * from animals WHERE neutered = 'TRUE';

/*Find all animals not named Gabumon*/
SELECT * from animals WHERE name != 'Gabumon';

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT * from animals WHERE weight_kg >= 10.5 AND weight_kg <= 17.3;


/*1*/

/*update the animals table by setting the species column to unspecified
Then roll back the change and verify that the species columns went back to the state before the transaction*/

BEGIN;
UPDATE animals 
SET species = 'unspecified';
ROLLBACK;

/*2*/
/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon*/
BEGIN;
UPDATE animals 
SET species = 'digimon'
WHERE name like '%mon';

/*Update the animals table by setting the species column to pokemon for all animals that don't have species already set*/
UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

/*Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.*/
BEGIN;
DELETE FROM animals;
ROLLBACK;

/*3*/
/*Inside a transaction:*/

/*Delete all animals born after Jan 1st, 2022.*/
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

/*Create a savepoint for the transaction.*/
COMMIT;

/*Update all animals' weight to be their weight multiplied by -1.*/
BEGIN;
UPDATE animals 
SET weight_kg = weight_kg * -1;

/*Rollback to the savepoint*/
ROLLBACK;

/*Update all animals' weights that are negative to be their weight multiplied by -1*/
BEGIN;
UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

/*Commit transaction.*/
COMMIT;


-- Write queries to answer the following questions: 

-- How many animals are there?
SELECT COUNT(id) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escape_attempts > 0 ;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?es;
SELECT name, MAX(escape_attempts), neutered FROM animals GROUP BY name, neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,
 AVG(escape_attempts),
  date_of_birth
   FROM
    animals
    GROUP BY species, date_of_birth
     HAVING 
      date_of_birth 
      BETWEEN  '1990-01-01' AND '2000-12-31';