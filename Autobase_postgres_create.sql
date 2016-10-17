CREATE TABLE "dispatcher" (
	"id" serial NOT NULL,
	"employee_id" bigint(256),
	"category" character varying(128) NOT NULL,
	CONSTRAINT dispatcher_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "application" (
	"id" serial NOT NULL,
	"number_application" bigint UNIQUE,
	"date_application" DATE,
	"client_id" character varying(256),
	"flight_id" bigint,
	"weight_cargo_kg" double NOT NULL,
	"length_cargo_m" double NOT NULL,
	"width_cargo_m" double NOT NULL,
	"heigth_cargo_m" double NOT NULL,
	"driver_id" double NOT NULL,
	"status" character varying,
	"mark_delivery_cargo" BOOLEAN NOT NULL,
	"date_delivery_cargo" DATE NOT NULL,
	"id_dispatcher" bigint NOT NULL,
	CONSTRAINT application_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "flight" (
	"id" serial NOT NULL,
	"point_of_departure" character varying(256),
	"date_of_departure" DATE,
	"destination" character varying(256),
	CONSTRAINT flight_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "driver" (
	"id" serial NOT NULL,
	"employee_id" serial NOT NULL,
	"driver_license_number" character varying,
	"driver_license_category" character varying,
	"car_id" bigint,
	"status" character varying,
	CONSTRAINT driver_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "employee" (
	"id" serial NOT NULL,
	"firstname" character varying(512),
	"lastname" character varying(512),
	"surname" character varying(512),
	"birthday" DATE,
	"position" character varying(512),
	CONSTRAINT employee_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "car" (
	"id" serial NOT NULL,
	"make_model" character varying(256),
	"registration_number" character varying(256),
	"carrying_capacity_kg" double,
	"dimensions_length_m" double,
	"dimensions_width_m" double,
	"dimensions_heigth_m" double,
	"condition_vehical" BOOLEAN,
	"date_inspection" DATE,
	CONSTRAINT car_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "client" (
	"id" serial NOT NULL,
	"client_name" character varying(512) NOT NULL,
	"adres" character varying(512) NOT NULL,
	"number_phone" bigint NOT NULL,
	CONSTRAINT client_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "dispatcher" ADD CONSTRAINT "dispatcher_fk0" FOREIGN KEY ("employee_id") REFERENCES "employee"("id");

ALTER TABLE "application" ADD CONSTRAINT "application_fk0" FOREIGN KEY ("client_id") REFERENCES "client"("id");
ALTER TABLE "application" ADD CONSTRAINT "application_fk1" FOREIGN KEY ("flight_id") REFERENCES "flight"("id");
ALTER TABLE "application" ADD CONSTRAINT "application_fk2" FOREIGN KEY ("driver_id") REFERENCES "driver"("id");
ALTER TABLE "application" ADD CONSTRAINT "application_fk3" FOREIGN KEY ("id_dispatcher") REFERENCES "dispatcher"("id");


ALTER TABLE "driver" ADD CONSTRAINT "driver_fk0" FOREIGN KEY ("employee_id") REFERENCES "employee"("id");
ALTER TABLE "driver" ADD CONSTRAINT "driver_fk1" FOREIGN KEY ("car_id") REFERENCES "car"("id");




