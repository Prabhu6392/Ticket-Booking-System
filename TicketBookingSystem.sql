CREATE DATABASE TicketBookingSystem;
USE TicketBookingSystem;

CREATE TABLE Venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE,
    event_time TIME,
    venue_id INT,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type ENUM('Movie', 'Sports', 'Concert'),
    booking_id INT,
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    booking_id INT
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    event_id INT,
    num_tickets INT,
    total_cost DECIMAL(10, 2),
    booking_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

ALTER TABLE Customer ADD CONSTRAINT fk_Booking FOREIGN KEY (booking_id) references Booking(booking_id);
desc Customer;
ALTER TABLE Event ADD CONSTRAINT fk_Booking_new FOREIGN KEY (booking_id) references Booking(booking_id);

show tables;
select * from booking;
select * from event;
select * from customer;
select * from venue;


-- TASK 2
-- 1. Write a SQL query to insert at least 10 sample records into each table
-- Inserting into Venue table

INSERT INTO venue (venue_name, address) VALUES 
('Grand Theater', 'Mall Road'),
('City Concert Hall', 'Gt road'),
('Sports Arena', 'Greenpark Stadium'),
('Open Air Theater', 'DLF mall'),
('Downtown Venue', 'Downtown Market'),
('Hot Sports Feild', 'Birana Road'),
('Status Club', 'Bada Chauraha'),
('NY Cinemas', 'Sagar Market'),
('Cricket Acadmey', 'Barra 7'),
('Moti Jheel Venue', 'Motijheel');

-- Inserting into Event table
INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
VALUES 
('Rock Concert', '2024-10-01', '19:30:00', 2, 5000, 4500, 1500.00, 'Concert'),
('Football Match', '2024-10-15', '18:00:00', 3, 20000, 19500, 1000.00, 'Sports'),
('Movie Premiere', '2024-10-20', '20:00:00', 1, 300, 250, 500.00, 'Movie'),
('Classical Concert', '2024-11-05', '19:00:00', 6, 1500, 1200, 2000.00, 'Concert'),
('Basketball Game', '2024-11-10', '17:00:00', 5, 15000, 14500, 1200.00, 'Sports'),
('Theater Act', '2024-11-12', '19:15:00', 4, 1200, 600, 300.00, 'Movie'),
('Elite Concert', '2024-11-25', '18:00:00', 10 , 7000, 13200, 3000.00, 'Concert'),
('Cricket Match', '2024-12-02', '14:30:00', 9, 25000, 19000, 6000.00, 'Sports'),
('Cinematic Universe', '2024-12-25', '10:00:00', 8, 3500, 2500, 1000.00, 'Movie'),
('Final Concert', '2024-12-31', '22:00:00', 1, 9000, 3000, 4000.00, 'Concert');

-- Inserting into Customer table
INSERT INTO Customer (customer_name, email, phone_number)
VALUES 
('Siddharth Srivastava', 'srivastavasiddharth71@gmail.com', '1234567890'),
('Mahi Srivastava', 'mahidlw@gmail.com', '9876548500'),
('Charlie Brown', 'charlie@outlook.com', '543210000'),
('David Williams', 'david@hotmail.com', '123490000'),
('Eve Davis', 'eve@yahoo.com', '678950000'),
('Damon Salvator', 'damon@gmail.com', '6789554030'),
('Klaus Mikaelson', 'mikaelson@outlook.com', '4829563802'),
('Professor Heist', 'heist@hotmail.com', '5935829407'),
('Thomas Shellby', 'tom@yahoo.com', '57395920572'),
('Lucifer Morningstar', 'devil@hotmail.com', '2942058395');

-- Inserting into Booking table
INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date)
VALUES 
(1, 1, 2, 3000.00, '2024-09-01 14:30:00'),
(2, 2, 4, 4000.00, '2024-09-02 16:00:00'),
(3, 3, 1, 500.00, '2024-09-05 12:00:00'),
(4, 4, 3, 6000.00, '2024-09-07 18:00:00'),
(5, 5, 5, 9000.00, '2024-09-10 20:00:00'),
(6, 6, 3, 4000.00, '2024-09-17 10:00:00'),
(7, 7, 9, 15000.00, '2024-09-22 15:00:00'),
(8, 8, 2, 2000.00, '2024-10-02 22:00:00'),
(9, 9, 1, 900.00, '2024-10-05 11:00:00'),
(10, 10, 5, 7000.00, '2024-10-06 23:00:00');

-- 2. Write a SQL query to list all Events.
select * from event;

-- 3. Write a SQL query to select events with available tickets.

SELECT * FROM Event WHERE available_seats>10000 ;

-- 4. Write a SQL query to select events name partial match with ‘cup’.

SELECT * FROM Event WHERE event_name LIKE '%cup%';

-- 5. Write a SQL query to select events with ticket price range is between 1000 to 2500.

SELECT * FROM Event WHERE ticket_price BETWEEN 1000 AND 2500;


-- 6. Write a SQL query to retrieve events with dates falling within a specific range.

SELECT * FROM Event WHERE event_date BETWEEN '2024-10-01' AND '2024-11-01';

-- 7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.

SELECT * FROM Event WHERE available_seats > 0 AND event_name LIKE '%Concert%';

-- 8. Write a SQL query to retrieve users in batches of 5, starting from the 6th user.

SELECT * FROM Customer ORDER BY customer_id LIMIT 5 OFFSET 5;

-- 9. Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.

SELECT * FROM Booking WHERE num_tickets > 4;

-- 10. Write a SQL query to retrieve customer information whose phone number end with ‘000’

SELECT * FROM Customer WHERE phone_number LIKE '%000';

-- 11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000.

SELECT * FROM Event WHERE total_seats > 15000 ORDER BY total_seats ASC;

-- 12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’

SELECT * FROM Event WHERE event_name NOT LIKE 'x%' AND event_name NOT LIKE 'y%' AND event_name NOT LIKE 'z%';
