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