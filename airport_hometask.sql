create database airport_database

create table passengers (
	id int,
	first_name varchar(20),
	last_name varchar(20),
	date_of_birth date,
	country_of_citizenship varchar(20),
	country_of_residence varchar(20),
	pasport_number varchar(20),
	created_at date,
	updated_at date,
	constraint PK_id primary key (id)
);

create table security_check (
	id int primary key,
	check_result varchar(20),
	comments varchar(55),
	created_at date,
	updated_at date,
	passenger_id int,
	constraint FK_passengerID foreign key(passenger_id) references passengers(id)
);

create table no_fly_list (
	id int primary key,
	active_from date,
	active_to date,
	no_fly_reason varchar(55),
	created_at date,
	updated_at date,
	psngr_id int,
	constraint FK_psngrID foreign key(psngr_id) references passengers(id)
);

create table airline (
	id int primary key,
	airline_code int,
	aorline_name varchar(20),
	airline_country varchar(50),
	created_at date,
	updated_id date
);

create table airport (
	id int primary key,
	airport_name varchar(20),
	counrty varchar(20),
	state varchar(20),
	city varchar(20),
	created_at date,
	updated_at date
);

create table flights (
	flight_id int primary key,
	departing_gate varchar(20),
	arriving_date varchar(20),
	created_at date,
	updated_at date,
	airline_id int,
	departing_airport_id int,
	arriving_airport_id int,
	constraint FK_airlineID foreign key(airline_id) references airline(id),
	constraint FK_departingAirportID foreign key(departing_airport_id) references airport(id),
	constraint FK_arrivingAirportID foreign key(arriving_airport_id) references airport(id)
);

create table booking (
	booking_id int primary key,
	flight_id int,
	status varchar(20),
	booking_platform varchar(20),
	created_at date,
	updated_at date,
	passenger_id int,
	constraint fk_passenger_ID foreign key(passenger_id) references passengers(id)
);

create table baggage_check (
	id int primary key,
	check_result varchar(20),
	created_at date,
	updated_id date,
	booking_id int,
	passenger_id int,
	constraint FK_bookingID foreign key(booking_id) references booking(booking_id),
	constraint FKey_passengerID foreign key(passenger_id) references passengers(id)
);

create table baggage (
	id int primary key,
	weight_in_kg float,
	created_at date,
	updated_at date,
	booking_id int,
	constraint FKey_bookingID foreign key(booking_id) references booking(booking_id)
);

create table flight_manifest (
	id int primary key,
	created_at date,
	updated_at date,
	booking_id int,
	flight_id int,
	constraint Fkey_Booking_ID foreign key(booking_id) references booking(booking_id),
	constraint FK_flightID foreign key(flight_id) references flights(flight_id)
);

create table boarding_pass (
	id int primary key,
	qr_code varchar(55),
	created_at date,
	updated_at date,
	booking_id int,
	constraint F_KEY_BookingID foreign key(booking_id) references booking(booking_id)
);