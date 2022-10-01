/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES (1,'Agumon','2020-02-03',0,TRUE,10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES (2,'Gabumon','2018-11-15',2,TRUE,8.00);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES (3,'Pikachu','2021-01-07',1,FALSE,15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES (4,'Devimon','2017-05-12',5,TRUE,11.00);

 /*Insert the following data: */
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (5,'Charmander','2020-02-08',0,FALSE,-11.00);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (6,'Plantmon','2021-11-15',2,TRUE,-5.70);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (7,'Squirtle','1993-04-02',3,FALSE,-12.13);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (8,'Angemon','2005-06-12',1,TRUE,-45.00);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (9,'Boarmon','2005-06-07',7,TRUE,24.40);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (10,'Blossom','1998-10-13',3,TRUE,17.00);

 INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
values (11,'Ditto','2022-05-14',4,TRUE,17.00);



--  INSERTING data into the owners table: 

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),  ('Jennifer Orwell', 19), ('Bob ', 45),
 ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

 --  INSERTING data into the species table: 
 INSERT INTO species (name)
 VALUES ('Pokemon'), ('Digimon');

--  Updating the animals table so if the name of the animal ends with 'mon' the species_id it is 2 (value of Digimon in species table)
--  or otherwise it is 2;
UPDATE animals SET species_id = 2 WHERE name like '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT like '%mon';

-- Modify your inserted animals to include owner information (owner_id): 
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' or name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' or name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' or name = 'Boarmon';

/*Inserting data in vets table*/

INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties
INSERT INTO specializations VALUES (
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher')
);

INSERT INTO specializations VALUES (
  (SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);
INSERT INTO specializations VALUES (
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);

INSERT INTO specializations VALUES (
  (SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness')
);

-- Insert the following data for visits: 
    -- Agumon visited William Tatcher on May 24th, 2020.
    INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (3, 2, '2020-03-08'),
    (3, 2, '2020-05-14'),
    (4, 3, '2021-05-04'),
    (5, 4, '2021-02-24'),
    (6, 2, '2019-12-21'),
    (6, 1, '2021-08-10'),
    (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'),
    (8, 4, '2020-10-03'),
    (8, 4, '2020-11-04'),
    (9, 2, '2019-01-24'),
    (9, 2, '2019-05-15'),
    (9, 2, '2020-02-27'),
    (9, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 2, '2021-01-11');
