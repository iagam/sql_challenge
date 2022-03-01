-- Creating initial database
CREATE DATABASE braintree;

USE database braintree;

-- Creating continents table
CREATE TABLE IF NOT EXISTS public.continents
(
    continent_code varchar(2) UNIQUE NOT NULL,
    continent_name text NOT NULL
);

