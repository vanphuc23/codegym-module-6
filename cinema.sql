create database if not exists cinema;
use cinema;

create table if not exists role (
    role_id int auto_increment not null primary key,
    role_name varchar(250) not null
);
create table if not exists account (
    account_id int auto_increment not null primary key,
    username  varchar(250) not null,
    password  varchar(250) not null,
    email  varchar(250) not null,
    role_id int not null,
    foreign key (role_id) references role(role_id)
);

create table if not exists customer (
    customer_id int auto_increment not null primary key,
    fullname  varchar(250) not null,
    birthday  date not null, 
    gender  varchar(250) not null,
    identity_card  varchar(250) not null,
    email  varchar(250) not null,
    address  varchar(250) not null,
    phone  varchar(250) not null,
    role_id  int not null,
    customer_account_id int not null,
    foreign key (customer_account_id) references account(account_id)
);

create table if not exists employee (
    employee_id int AUTO_INCREMENT PRIMARY KEY,
    image_employee TEXT NOT NULL,
    birth_day DATE NOT NULL,
    sex bit NOT NULL,
    name_employee varchar(28) NOT NULL,
    id_card varchar(28) NOT NULL,
    email varchar(28) NOT NULL,
    numberphone varchar(28) NOT NULL,
    address  varchar(28) NOT NULL,
    employee_account_id int not null,
    foreign key (employee_account_id) references account(account_id)
);

create table show_time(
	show_time_id int auto_increment primary key,
    show_date date not null,
    movie_time varchar(20) not null
);

create table if not exists movie_type (
    movie_type_id int auto_increment not null primary key,
	movie_type_name  varchar(250) not null
);

create table if not exists movie (
    movie_id int auto_increment not null primary key,
    movie_name varchar(250) not null,
    movie_start_day  date not null, 
    movie_end_day  date not null,
    actor  varchar(250) not null,
	movie_manufacturer  varchar(250) not null,
	movie_director  varchar(250) not null,
    movie_duration  int not null,
	movie_trailer  varchar(250) not null,
	movie_image  varchar(250) not null,
    movie_detail  text not null,
    movie_vesion bit not null
);

create table employee_movie (
movie_id int not null,
employee_id int not null,
primary key (movie_id, employee_id),
foreign key(movie_id) references movie (movie_id),
 foreign key(employee_id) references employee (employee_id)
);

create table movie_type_detail(
	movie_type_id int not null,
    movie_id int not null,
    primary key(movie_type_id,movie_id),
    foreign key(movie_type_id) references movie_type (movie_type_id),
    foreign key(movie_id) references movie(movie_id)
    
);
create table if not exists type_seat (
    type_seat_id int auto_increment not null primary key,
    name varchar(250) not null,
    price varchar(250) not null
);
create table if not exists room (
    room_id int auto_increment not null primary key,
    room_name  varchar(250) not null,
    room_payload int not null,
	room_detail varchar(250) not null
);
create table if not exists seat (
    seat_id int auto_increment not null primary key,
    type_seat_id int not null,
    room_id int not null,
    name  varchar(250) not null,
    check_seat bit not null,
    foreign key (type_seat_id) references type_seat(type_seat_id),
    foreign key(room_id) references room(room_id)
);

create table calendar_show(
	calendar_show_id int auto_increment primary key,
    movie_id int not null,
    room_id int not null,
    show_time_id int not null,
    calendar_show_detail varchar(255),
    foreign key (show_time_id) references show_time(show_time_id),
    foreign key (movie_id) references movie(movie_id),
    foreign key (room_id) references room(room_id)
);

create table if not exists invoice (
    invoice_id int auto_increment not null primary key,
    date_payment datetime not null,
    invoice_detail varchar(255) not null,
    customer_id  int not null,
    employee_id int not null,
    qr text not null,
    foreign key (employee_id) references employee(employee_id),
    foreign key (customer_id) references customer(customer_id)
);

create table if not exists ticket (
    ticket_id bigint auto_increment not null primary key,
    calendar_show_id  int not null,
    invoice_id int not null,
    seat_id int not null,
    cost double not null,
    ticket_detail  varchar(250) not null,
    foreign key (calendar_show_id) references calendar_show(calendar_show_id),
    foreign key (seat_id) references seat(seat_id),
    foreign key (invoice_id) references invoice(invoice_id)
);

-- drop database cinema;