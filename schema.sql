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

/*create owners table*/
CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age int,
    PRIMARY KEY(id)
);


/*create species table*/
CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY,
    name text,
    PRIMARY KEY(id)
);

-- Remove the species column from the table animals
ALTER TABLE animals DROP COLUMN species;

-- Add species_id from the table animals
ALTER TABLE animals ADD species_id INT;

--  Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
 ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id)
  ON DELETE SET NULL;

  -- Add owner_id from the table animals
ALTER TABLE animals ADD owner_id INT;

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
 ADD CONSTRAINT fk_owners
  FOREIGN KEY (owner_id)
  REFERENCES owners (id)
  ON DELETE SET NULL;

  /*vet table created*/
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    age INT,
    date_of_graduation  DATE,
    PRIMARY KEY(id)
  );

 /*many to many table to handle the relationship between vets and species*/ 

CREATE TABLE specializations (
species_id int,
vets_id int
);

ALTER TABLE specializations ADD PRIMARY KEY (species_id, vets_id);
ALTER TABLE specializations ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE specializations ADD CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets (id);

 /*many to many table to handle the relationship between animals and vets*/ 
 CREATE TABLE visits (
    animals_id int,
    vets_id int,
    date_of_visit DATE
 );


ALTER TABLE visits ADD PRIMARY KEY (animals_id, vets_id, date_of_visit);
ALTER TABLE visits ADD CONSTRAINT fk_animals FOREIGN KEY (animals_id) REFERENCES animals (id);
ALTER TABLE visits ADD CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets (id);