
-- Drop tables if they exist (to avoid errors when re-running the script)
DROP TABLE IF EXISTS Booking, Flight, Passenger, Admin, Airline, Payment;

-- Create Airline table
CREATE TABLE Airline (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(20),
    email VARCHAR(100)
);

-- Create Admin table
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

-- Create Flight table
CREATE TABLE Flight (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_id INT,
    source VARCHAR(100),
    destination VARCHAR(100),
    departure_time DATETIME,
    arrival_time DATETIME,
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
);

-- Create Passenger table
CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Create Booking table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_no VARCHAR(10),
    status VARCHAR(20),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

-- Create Payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Insert sample data into Airline
INSERT INTO Airline (name, contact, email) VALUES
('IndiGo', '9999911111', 'support@indigo.in'),
('Air India', '8888822222', 'help@airindia.com'),
('SpiceJet', '7777733333', 'info@spicejet.com'),
('GoAir', '6666644444', 'service@goair.in'),
('Vistara', '5555555555', 'support@vistara.com');

-- Insert sample data into Admin
INSERT INTO Admin (name, email, password) VALUES
('Ravi Kumar', 'ravi@airline.com', 'admin123'),
('Sneha Patel', 'sneha@airline.com', 'admin456'),
('Arjun Singh', 'arjun@airline.com', 'admin789'),
('Neha Sharma', 'neha@airline.com', 'admin321'),
('Karan Joshi', 'karan@airline.com', 'admin654');

-- Insert sample data into Flight
INSERT INTO Flight (airline_id, source, destination, departure_time, arrival_time) VALUES
(1, 'Delhi', 'Mumbai', '2025-07-10 10:00:00', '2025-07-10 12:00:00'),
(2, 'Mumbai', 'Bangalore', '2025-07-11 14:00:00', '2025-07-11 16:30:00'),
(3, 'Bangalore', 'Chennai', '2025-07-12 09:00:00', '2025-07-12 10:15:00'),
(4, 'Delhi', 'Kolkata', '2025-07-13 13:30:00', '2025-07-13 16:00:00'),
(5, 'Hyderabad', 'Delhi', '2025-07-14 07:45:00', '2025-07-14 10:00:00');

-- Insert sample data into Passenger
INSERT INTO Passenger (name, age, gender, email, phone) VALUES
('Amit Verma', 30, 'Male', 'amit@gmail.com', '9876543210'),
('Priya Singh', 25, 'Female', 'priya@gmail.com', '8765432109'),
('Rahul Mehta', 40, 'Male', 'rahul@gmail.com', '7654321098'),
('Sneha Roy', 29, 'Female', 'sneha@gmail.com', '6543210987'),
('Ankit Sharma', 35, 'Male', 'ankit@gmail.com', '5432109876');

-- Insert sample data into Booking
INSERT INTO Booking (passenger_id, flight_id, booking_date, seat_no, status) VALUES
(1, 1, '2025-07-01', 'A1', 'Confirmed'),
(2, 2, '2025-07-02', 'B2', 'Confirmed'),
(3, 3, '2025-07-03', 'C3', 'Cancelled'),
(4, 4, '2025-07-04', 'D4', 'Confirmed'),
(5, 5, '2025-07-05', 'E5', 'Pending');

-- Insert sample data into Payment
INSERT INTO Payment (booking_id, amount, payment_date, payment_mode) VALUES
(1, 4500.00, '2025-07-01', 'Credit Card'),
(2, 3800.00, '2025-07-02', 'UPI'),
(3, 3000.00, '2025-07-03', 'Net Banking'),
(4, 4700.00, '2025-07-04', 'Debit Card'),
(5, 2500.00, '2025-07-05', 'Cash');

-- DML OPERATIONS

-- SELECT: View all confirmed bookings
SELECT * FROM Booking WHERE status = 'Confirmed';

-- INSERT: Add a new passenger
INSERT INTO Passenger (name, age, gender, email, phone)
VALUES ('Kriti Sen', 28, 'Female', 'kriti@gmail.com', '9123456789');

-- UPDATE: Update flight status
UPDATE Booking
SET status = 'Confirmed'
WHERE booking_id = 5;

-- DELETE: Remove a cancelled booking
DELETE FROM Booking
WHERE status = 'Cancelled';
