-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Property" | type: TABLE --
-- DROP TABLE IF EXISTS public."Property" CASCADE;
CREATE TABLE public."Property"(
	"Property No" varchar(3) NOT NULL,
	"Street" varchar(30),
	"Post Code" char(7),
	"Number of Bedrooms" Integer,
	"Number of Bathromms" Integer,
	"Daily Rental Rate" decimal,
	"Owner ID_Owner" varchar(5),
	"Property Type ID_Property Type" varchar(5),
	"City ID_City" varchar(5),
	CONSTRAINT "Property_pk" PRIMARY KEY ("Property No")

);
-- ddl-end --
ALTER TABLE public."Property" OWNER TO postgres;
-- ddl-end --

-- object: public."Owner" | type: TABLE --
-- DROP TABLE IF EXISTS public."Owner" CASCADE;
CREATE TABLE public."Owner"(
	"Owner ID"  varchar(3) NOT NULL,
	"Owner Name" varchar(30),
	"Owner Email" varchar(30),
	CONSTRAINT "Owner_pk" PRIMARY KEY ("Owner ID")

);
-- ddl-end --
ALTER TABLE public."Owner" OWNER TO postgres;
-- ddl-end --

-- object: public."Client" | type: TABLE --
-- DROP TABLE IF EXISTS public."Client" CASCADE;
CREATE TABLE public."Client"(
	"Client ID" varchar(3) NOT NULL,
	"Client Name" varchar(30),
	"Client Email" varchar(30),
	CONSTRAINT "Client_pk" PRIMARY KEY ("Client ID")

);
-- ddl-end --
ALTER TABLE public."Client" OWNER TO postgres;
-- ddl-end --

-- object: public."Invoice" | type: TABLE --
-- DROP TABLE IF EXISTS public."Invoice" CASCADE;
CREATE TABLE public."Invoice"(
	"Invoice Number" varchar(5) NOT NULL,
	"Invoice Date" date,
	"Rental Start Date" date,
	"Rental Charge" decimal,
	"Tax Owing" decimal,
	"Number of Days" decimal,
	"Rental Amount Owing" decimal,
	"Property No_Property" varchar(5),
	"Client ID_Client" varchar(5),
	CONSTRAINT "Invoice_pk" PRIMARY KEY ("Invoice Number")

);
-- ddl-end --
ALTER TABLE public."Invoice" OWNER TO postgres;
-- ddl-end --

-- object: public."Calendar Year" | type: TABLE --
-- DROP TABLE IF EXISTS public."Calendar Year" CASCADE;
CREATE TABLE public."Calendar Year"(
	"Calendar Year"  varchar(4) NOT NULL,
	CONSTRAINT "Calendar Year_pk" PRIMARY KEY ("Calendar Year")

);
-- ddl-end --
ALTER TABLE public."Calendar Year" OWNER TO postgres;
-- ddl-end --

-- object: public."Property Expense" | type: TABLE --
-- DROP TABLE IF EXISTS public."Property Expense" CASCADE;
CREATE TABLE public."Property Expense"(
	"Property Expense ID" varchar(3) NOT NULL,
	"Property Tax" decimal,
	"Electricity Cost" decimal,
	"Heating Cost" decimal,
	"Advertising Cost" decimal,
	"Cleaning Cost" decimal,
	"Total Expense" decimal,
	"Property No_Property" varchar(5),
	"Calendar Year_Calendar Year" varchar(4),
	CONSTRAINT "Property Expense_pk" PRIMARY KEY ("Property Expense ID")

);
-- ddl-end --
ALTER TABLE public."Property Expense" OWNER TO postgres;
-- ddl-end --

-- object: public."Property Type" | type: TABLE --
-- DROP TABLE IF EXISTS public."Property Type" CASCADE;
CREATE TABLE public."Property Type"(
	"Property Type ID" varchar(3) NOT NULL,
	"Property Type" varchar(15),
	CONSTRAINT "Property Type_pk" PRIMARY KEY ("Property Type ID")

);
-- ddl-end --
ALTER TABLE public."Property Type" OWNER TO postgres;
-- ddl-end --

-- object: public."Country" | type: TABLE --
-- DROP TABLE IF EXISTS public."Country" CASCADE;
CREATE TABLE public."Country"(
	"Country ID" varchar(5) NOT NULL,
	"Country" varchar(20),
	CONSTRAINT "Country_pk" PRIMARY KEY ("Country ID")

);
-- ddl-end --
ALTER TABLE public."Country" OWNER TO postgres;
-- ddl-end --

-- object: public."Province" | type: TABLE --
-- DROP TABLE IF EXISTS public."Province" CASCADE;
CREATE TABLE public."Province"(
	"Province ID" varchar(3) NOT NULL,
	"Province" varchar(20),
	"Country ID_Country" varchar(5),
	CONSTRAINT "Province_pk" PRIMARY KEY ("Province ID")

);
-- ddl-end --
ALTER TABLE public."Province" OWNER TO postgres;
-- ddl-end --

-- object: public."City" | type: TABLE --
-- DROP TABLE IF EXISTS public."City" CASCADE;
CREATE TABLE public."City"(
	"City ID" varchar(3) NOT NULL,
	"City" varchar(20),
	"Province ID_Province" varchar(5),
	CONSTRAINT "City_pk" PRIMARY KEY ("City ID")

);
-- ddl-end --
ALTER TABLE public."City" OWNER TO postgres;
-- ddl-end --

-- object: "Owner_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Property" DROP CONSTRAINT IF EXISTS "Owner_fk" CASCADE;
ALTER TABLE public."Property" ADD CONSTRAINT "Owner_fk" FOREIGN KEY ("Owner ID_Owner")
REFERENCES public."Owner" ("Owner ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Property Type_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Property" DROP CONSTRAINT IF EXISTS "Property Type_fk" CASCADE;
ALTER TABLE public."Property" ADD CONSTRAINT "Property Type_fk" FOREIGN KEY ("Property Type ID_Property Type")
REFERENCES public."Property Type" ("Property Type ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Property_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Property Expense" DROP CONSTRAINT IF EXISTS "Property_fk" CASCADE;
ALTER TABLE public."Property Expense" ADD CONSTRAINT "Property_fk" FOREIGN KEY ("Property No_Property")
REFERENCES public."Property" ("Property No") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Property_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Invoice" DROP CONSTRAINT IF EXISTS "Property_fk" CASCADE;
ALTER TABLE public."Invoice" ADD CONSTRAINT "Property_fk" FOREIGN KEY ("Property No_Property")
REFERENCES public."Property" ("Property No") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Client_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Invoice" DROP CONSTRAINT IF EXISTS "Client_fk" CASCADE;
ALTER TABLE public."Invoice" ADD CONSTRAINT "Client_fk" FOREIGN KEY ("Client ID_Client")
REFERENCES public."Client" ("Client ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Calendar Year_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Property Expense" DROP CONSTRAINT IF EXISTS "Calendar Year_fk" CASCADE;
ALTER TABLE public."Property Expense" ADD CONSTRAINT "Calendar Year_fk" FOREIGN KEY ("Calendar Year_Calendar Year")
REFERENCES public."Calendar Year" ("Calendar Year") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Country_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Province" DROP CONSTRAINT IF EXISTS "Country_fk" CASCADE;
ALTER TABLE public."Province" ADD CONSTRAINT "Country_fk" FOREIGN KEY ("Country ID_Country")
REFERENCES public."Country" ("Country ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Province_fk" | type: CONSTRAINT --
-- ALTER TABLE public."City" DROP CONSTRAINT IF EXISTS "Province_fk" CASCADE;
ALTER TABLE public."City" ADD CONSTRAINT "Province_fk" FOREIGN KEY ("Province ID_Province")
REFERENCES public."Province" ("Province ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "City_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Property" DROP CONSTRAINT IF EXISTS "City_fk" CASCADE;
ALTER TABLE public."Property" ADD CONSTRAINT "City_fk" FOREIGN KEY ("City ID_City")
REFERENCES public."City" ("City ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


