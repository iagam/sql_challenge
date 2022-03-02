-- Creating initial database
CREATE DATABASE braintree;

USE database braintree;

-- Creating continents table
CREATE TABLE IF NOT EXISTS public.continents
(
    continent_code varchar(2) UNIQUE NOT NULL,
    continent_name text NOT NULL
);

-- Inserting Data into continents table
INSERT INTO continents values
('AF','Africa'),
('AS','Asia'),
('EU','Europe'),
('NA','North America'),
('SA','South America'),
('OC','Oceania'),
('AN','Antarctica')
;

-- Creating continents table
CREATE TABLE IF NOT EXISTS public.countries
(
    country_code varchar(3) UNIQUE NOT NULL,
    country_name text NOT NULL
);

