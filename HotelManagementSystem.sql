-- Create and select database
DROP DATABASE IF EXISTS `HotelManagementSystem`;
CREATE DATABASE IF NOT EXISTS `HotelManagementSystem`;
USE `HotelManagementSystem`;

-- Hotel master
DROP TABLE IF EXISTS `Hotel`;
CREATE TABLE `Hotel` (
  `Id_Hotel` CHAR(6) NOT NULL,
  `Hotel_Name` VARCHAR(30) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  `Country` VARCHAR(15) NOT NULL,
  `Address` VARCHAR(60) NULL,
  `Phone` VARCHAR(15) NULL,
  `Email` VARCHAR(40) NULL,
  `Star_Rating` TINYINT UNSIGNED NULL,
  `Opening_Date` DATE NULL,
  PRIMARY KEY (`Id_Hotel`)
) ENGINE = InnoDB;

-- Services master
DROP TABLE IF EXISTS `Services`;
CREATE TABLE `Services` (
  `idServices` CHAR(6) NOT NULL,
  `Service_Name` VARCHAR(20) NOT NULL,
  `Description` VARCHAR(80) NULL,
  `Default_Price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`idServices`)
) ENGINE = InnoDB;

-- Guest master
DROP TABLE IF EXISTS `Guests`;
CREATE TABLE `Guests` (
  `idGuests` CHAR(6) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Gender` CHAR(1) NULL,
  `Phone_Number` VARCHAR(15) NULL,
  `Email` VARCHAR(40) NULL,
  `Address` VARCHAR(60) NULL,
  `City` VARCHAR(20) NULL,
  `State` VARCHAR(20) NULL,
  `Country` VARCHAR(15) NULL,
  `Document_Id_Number` VARCHAR(16) NULL,
  `Document_Id` VARCHAR(16) NULL,
  PRIMARY KEY (`idGuests`)
) ENGINE = InnoDB;

-- Room master
DROP TABLE IF EXISTS `Rooms`;
CREATE TABLE `Rooms` (
  `idRooms` CHAR(6) NOT NULL,
  `Hotel_Id_Hotel` CHAR(6) NOT NULL,
  `RoomNumber` VARCHAR(10) NOT NULL,
  `Floor` SMALLINT NULL,
  `Room_Type` VARCHAR(15) NULL,
  `Bed_Type` VARCHAR(10) NULL,
  `Base_Rate` DECIMAL(7,2) NOT NULL,
  `Max_Occupancy` TINYINT UNSIGNED NULL,
  `Status` ENUM('Available','Occupied','Reserved','OutOfService') DEFAULT 'Available',
  PRIMARY KEY (`idRooms`),
  CONSTRAINT `fk_Rooms_Hotel`
    FOREIGN KEY (`Hotel_Id_Hotel`)
    REFERENCES `Hotel` (`Id_Hotel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Employee master
DROP TABLE IF EXISTS `Employees`;
CREATE TABLE `Employees` (
  `idEmployees` CHAR(6) NOT NULL,
  `Hotel_id_Hotel` CHAR(6) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Gender` CHAR(1) NULL,
  `Position` VARCHAR(15) NULL,
  `Phone` VARCHAR(15) NULL,
  `Email` VARCHAR(40) NULL,
  `Hire_Date` DATE NULL,
  `Salary` DECIMAL(7,2) NULL,
  `Status` ENUM('Active','OnLeave','Resigned') DEFAULT 'Active',
  PRIMARY KEY (`idEmployees`),
  CONSTRAINT `fk_Employees_Hotel`
    FOREIGN KEY (`Hotel_id_Hotel`)
    REFERENCES `Hotel` (`Id_Hotel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Reservations
DROP TABLE IF EXISTS `Reservations`;
CREATE TABLE `Reservations` (
  `idReservations` CHAR(6) NOT NULL,
  `Guests_idGuests` CHAR(6) NOT NULL,
  `Hotel_Id_Hotel` CHAR(6) NOT NULL,
  `Rooms_idRooms` CHAR(6) NOT NULL,
  `ReservationDate` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `CheckinDate` DATE NOT NULL,
  `CheckOut_Date` DATE NOT NULL,
  `NumberOfGuests` TINYINT UNSIGNED NULL,
  `Status` ENUM('Pending','Confirmed','CheckedOut','Cancelled') DEFAULT 'Confirmed',
  `Total_Amount` DECIMAL(7,2) NULL,
  `Payment_Status` ENUM('Unpaid','Pending','Partial','Paid') DEFAULT 'Pending',
  PRIMARY KEY (`idReservations`),
  CONSTRAINT `fk_Reservations_Guests`
    FOREIGN KEY (`Guests_idGuests`)
    REFERENCES `Guests` (`idGuests`),
  CONSTRAINT `fk_Reservations_Hotel`
    FOREIGN KEY (`Hotel_Id_Hotel`)
    REFERENCES `Hotel` (`Id_Hotel`),
  CONSTRAINT `fk_Reservations_Rooms`
    FOREIGN KEY (`Rooms_idRooms`)
    REFERENCES `Rooms` (`idRooms`)
) ENGINE = InnoDB;

-- Stays linked to reservations
DROP TABLE IF EXISTS `Stays`;
CREATE TABLE `Stays` (
  `idStays` CHAR(6) NOT NULL,
  `Reservations_idReservations` CHAR(6) NOT NULL,
  `Actual_Checkin` DATETIME NULL,
  `Actual_CheckOut` DATETIME NULL,
  `Room_Rate_per_Night` DECIMAL(7,2) NULL,
  `Extra_Charges` DECIMAL(6,2) NOT NULL DEFAULT 0.00,
  `Discount_Amount` DECIMAL(6,2) NOT NULL DEFAULT 0.00,
  `Final_Amount` DECIMAL(7,2) NULL,
  `Status` ENUM('Active','Scheduled','Completed','Cancelled') DEFAULT 'Active',
  PRIMARY KEY (`idStays`),
  CONSTRAINT `fk_Stays_Reservations`
    FOREIGN KEY (`Reservations_idReservations`)
    REFERENCES `Reservations` (`idReservations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Service usage
DROP TABLE IF EXISTS `ServiceUsage`;
CREATE TABLE `ServiceUsage` (
  `idServiceUsage` CHAR(6) NOT NULL,
  `Services_idServices` CHAR(6) NOT NULL,
  `Service_Name` VARCHAR(20) NULL,
  `UsageDateTime` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `Description` VARCHAR(80) NULL,
  `Quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  `PricePerUnit` DECIMAL(6,2) NULL,
  `Total_Amount` DECIMAL(7,2) NULL,
  PRIMARY KEY (`idServiceUsage`),
  CONSTRAINT `fk_ServiceUsage_Services`
    FOREIGN KEY (`Services_idServices`)
    REFERENCES `Services` (`idServices`)
) ENGINE = InnoDB;

-- Service usage to stays link
DROP TABLE IF EXISTS `ServiceUsage_has_Stays`;
CREATE TABLE `ServiceUsage_has_Stays` (
  `ServiceUsage_idServiceUsage` CHAR(6) NOT NULL,
  `Stays_idStays` CHAR(6) NOT NULL,
  PRIMARY KEY (`ServiceUsage_idServiceUsage`, `Stays_idStays`),
  CONSTRAINT `fk_ServiceUsage_has_Stays_ServiceUsage`
    FOREIGN KEY (`ServiceUsage_idServiceUsage`)
    REFERENCES `ServiceUsage` (`idServiceUsage`),
  CONSTRAINT `fk_ServiceUsage_has_Stays_Stays`
    FOREIGN KEY (`Stays_idStays`)
    REFERENCES `Stays` (`idStays`)
) ENGINE = InnoDB;

-- Payments for stays
DROP TABLE IF EXISTS `Payments`;
CREATE TABLE `Payments` (
  `idPayments` CHAR(6) NOT NULL,
  `Stays_idStays` CHAR(6) NOT NULL,
  `Payment_Date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `Amount` DECIMAL(7,2) NOT NULL,
  `Payment_Method` ENUM('Cash','UPI','Credit Card','NetBanking','Other') NULL,
  `Reference_Id` VARCHAR(16) NULL,
  `Status` ENUM('Advance','Success','Completed','Failed','Pending') DEFAULT 'Completed',
  PRIMARY KEY (`idPayments`),
  CONSTRAINT `fk_Payments_Stays`
    FOREIGN KEY (`Stays_idStays`)
    REFERENCES `Stays` (`idStays`)
) ENGINE = InnoDB;

-- Guest preference aggregation
DROP TABLE IF EXISTS `GuestPreferences`;
CREATE TABLE `GuestPreferences` (
  `idGuestPreference` CHAR(6) NOT NULL,
  `Guest_idGuests` CHAR(6) NOT NULL,
  `Preferred_Room_Type` VARCHAR(15) NULL,
  `Preferred_Bed_Type` VARCHAR(10) NULL,
  `Preferred_Hotel_Id` CHAR(6) NULL,
  `Preferred_Service_Id` CHAR(6) NULL,
  `Additional_Notes` VARCHAR(120) NULL,
  `Last_Updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idGuestPreference`),
  CONSTRAINT `fk_GuestPreferences_Guests`
    FOREIGN KEY (`Guest_idGuests`)
    REFERENCES `Guests` (`idGuests`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_GuestPreferences_Hotel`
    FOREIGN KEY (`Preferred_Hotel_Id`)
    REFERENCES `Hotel` (`Id_Hotel`)
    ON DELETE SET NULL,
  CONSTRAINT `fk_GuestPreferences_Services`
    FOREIGN KEY (`Preferred_Service_Id`)
    REFERENCES `Services` (`idServices`)
    ON DELETE SET NULL
) ENGINE = InnoDB;

-- Indexes
CREATE INDEX idx_rooms_hotel_room
  ON `Rooms` (`Hotel_Id_Hotel`, `RoomNumber`);

CREATE INDEX idx_reservations_guest
  ON `Reservations` (`Guests_idGuests`);

CREATE INDEX idx_reservations_hotel_dates
  ON `Reservations` (`Hotel_Id_Hotel`, `CheckinDate`, `CheckOut_Date`);

CREATE INDEX idx_stays_reservation
  ON `Stays` (`Reservations_idReservations`);

CREATE INDEX idx_payments_stay
  ON `Payments` (`Stays_idStays`);

-- Hotels data
INSERT INTO `Hotel` (`Id_Hotel`, `Hotel_Name`, `City`, `State`, `Country`, `Address`, `Phone`, `Email`, `Star_Rating`, `Opening_Date`) VALUES
('H00001', 'The Royal Palace', 'Jaipur', 'Rajasthan', 'India', '12 Amber Fort Road, Jaipur', '+91-141-2555555', 'contact@royalpalace.com', 5, '2010-05-15'),
('H00002', 'Sea View Residency', 'Mumbai', 'Maharashtra', 'India', '45 Marine Drive, Mumbai', '+91-22-24444444', 'info@seaviewmumbai.com', 4, '2015-08-20'),
('H00003', 'Bangalore Grand', 'Bengaluru', 'Karnataka', 'India', '88 MG Road, Bengaluru', '+91-80-23333333', 'reservations@blrgrand.com', 5, '2018-01-10'),
('H00004', 'Capital Stay', 'New Delhi', 'Delhi', 'India', '101 Connaught Place, New Delhi', '+91-11-23456789', 'delhi@capitalstay.com', 3, '2012-11-05'),
('H00005', 'Chennai Gateway', 'Chennai', 'Tamil Nadu', 'India', '22 OMR Road, Chennai', '+91-44-22222222', 'hello@chennaigateway.com', 4, '2016-03-25');

-- Services data
INSERT INTO `Services` (`idServices`, `Service_Name`, `Description`, `Default_Price`) VALUES
('S00001', 'Room Service', 'Food and Beverage delivery to room', 0.00),
('S00002', 'Laundry', 'Washing and ironing', 500.00),
('S00003', 'Spa', 'Full body massage (60 mins)', 2500.00),
('S00004', 'Airport Pickup', 'Luxury Sedan Pickup', 1500.00),
('S00005', 'Extra Bed', 'Folding bed for extra guest', 1000.00);

-- Guests data
INSERT INTO `Guests` (`idGuests`, `Name`, `Gender`, `Phone_Number`, `Email`, `Address`, `City`, `State`, `Country`, `Document_Id_Number`, `Document_Id`) VALUES
('G00001', 'Amit Sharma', 'M', '9876543210', 'amit.sharma@example.com', '12 Civil Lines', 'Nagpur', 'Maharashtra', 'India', 'ABCD1234F', 'PAN Card'),
('G00002', 'Priya Iyer', 'F', '9988776655', 'priya.iyer@example.com', '56 Mylapore', 'Chennai', 'Tamil Nadu', 'India', '1234-5678-9012', 'Aadhar Card'),
('G00003', 'Rahul Verma', 'M', '9123456789', 'rahul.v@example.com', '78 Sector 18', 'Noida', 'Uttar Pradesh', 'India', 'Z1234567', 'Passport'),
('G00004', 'Sneha Patil', 'F', '9555666777', 'sneha.patil@example.com', '34 Kothrud', 'Pune', 'Maharashtra', 'India', 'DL-MH-12-2020', 'Driving License'),
('G00005', 'Vikram Singh', 'M', '8888899999', 'vikram.singh@example.com', '90 Bani Park', 'Jaipur', 'Rajasthan', 'India', 'X5555555', 'Voter ID');

-- Rooms data
INSERT INTO `Rooms` (`idRooms`, `Hotel_Id_Hotel`, `RoomNumber`, `Floor`, `Room_Type`, `Bed_Type`, `Base_Rate`, `Max_Occupancy`, `Status`) VALUES
('R00001', 'H00001', '101', 1, 'Deluxe', 'King', 5000.00, 2, 'Occupied'),
('R00002', 'H00001', '102', 1, 'Suite', 'King', 12000.00, 4, 'Available'),
('R00003', 'H00002', '205', 2, 'Standard', 'Queen', 3500.00, 2, 'Occupied'),
('R00004', 'H00003', '301', 3, 'Executive', 'King', 7000.00, 2, 'Reserved'),
('R00005', 'H00004', '404', 4, 'Standard', 'Twin', 2500.00, 2, 'Available');

-- Employees data
INSERT INTO `Employees` (`idEmployees`, `Hotel_id_Hotel`, `Name`, `Gender`, `Position`, `Phone`, `Email`, `Hire_Date`, `Salary`, `Status`) VALUES
('E00001', 'H00001', 'Ramesh Gupta', 'M', 'Manager', '9000100001', 'ramesh@royalpalace.com', '2015-06-01', 80000.00, 'Active'),
('E00002', 'H00001', 'Suresh Yadav', 'M', 'Housekeeping', '9000100002', 'suresh@royalpalace.com', '2019-02-15', 20000.00, 'Active'),
('E00003', 'H00002', 'Anita Desai', 'F', 'Receptionist', '9000200001', 'anita@seaview.com', '2018-11-20', 35000.00, 'Active'),
('E00004', 'H00003', 'Arjun Reddy', 'M', 'Chef', '9000300001', 'arjun@blrgrand.com', '2020-01-10', 55000.00, 'Active'),
('E00005', 'H00002', 'Meera Nair', 'F', 'Manager', '9000200002', 'meera@seaview.com', '2016-08-05', 90000.00, 'Active');

-- Reservations data
INSERT INTO `Reservations` (`idReservations`, `Guests_idGuests`, `Hotel_Id_Hotel`, `Rooms_idRooms`, `ReservationDate`, `CheckinDate`, `CheckOut_Date`, `NumberOfGuests`, `Status`, `Total_Amount`, `Payment_Status`) VALUES
('RV0001', 'G00001', 'H00001', 'R00001', '2023-10-01 10:00:00', '2023-10-25', '2023-10-28', 2, 'Confirmed', 15000.00, 'Paid'),
('RV0002', 'G00002', 'H00002', 'R00003', '2023-10-05 14:30:00', '2023-11-01', '2023-11-03', 1, 'Confirmed', 7000.00, 'Pending'),
('RV0003', 'G00003', 'H00003', 'R00004', '2023-10-10 09:15:00', '2023-11-10', '2023-11-15', 2, 'Pending', 35000.00, 'Unpaid'),
('RV0004', 'G00004', 'H00001', 'R00002', '2023-10-12 11:00:00', '2023-12-01', '2023-12-05', 3, 'Confirmed', 48000.00, 'Partial'),
('RV0005', 'G00005', 'H00004', 'R00005', '2023-10-15 16:45:00', '2023-10-20', '2023-10-22', 1, 'CheckedOut', 5000.00, 'Paid');

-- Stays data
INSERT INTO `Stays` (`idStays`, `Reservations_idReservations`, `Actual_Checkin`, `Actual_CheckOut`, `Room_Rate_per_Night`, `Extra_Charges`, `Discount_Amount`, `Final_Amount`, `Status`) VALUES
('ST0001', 'RV0001', '2023-10-25 12:00:00', '2023-10-28 11:00:00', 5000.00, 500.00, 0.00, 15500.00, 'Completed'),
('ST0002', 'RV0005', '2023-10-20 13:00:00', '2023-10-22 10:30:00', 2500.00, 200.00, 0.00, 5200.00, 'Completed'),
('ST0003', 'RV0002', '2023-11-01 14:00:00', NULL, 3500.00, 0.00, 0.00, NULL, 'Active'),
('ST0004', 'RV0004', '2023-12-01 12:30:00', NULL, 12000.00, 1000.00, 500.00, NULL, 'Scheduled'),
('ST0005', 'RV0003', '2023-11-10 12:00:00', NULL, 7000.00, 0.00, 1000.00, NULL, 'Scheduled');

-- Service usage data
INSERT INTO `ServiceUsage` (`idServiceUsage`, `Services_idServices`, `Service_Name`, `UsageDateTime`, `Description`, `Quantity`, `PricePerUnit`, `Total_Amount`) VALUES
('SU0001', 'S00001', 'Room Service', '2023-10-25 20:00:00', 'Dinner', 1, 1200.00, 1200.00),
('SU0002', 'S00002', 'Laundry', '2023-10-26 10:00:00', 'Shirt Ironing', 2, 100.00, 200.00),
('SU0003', 'S00004', 'Airport Pickup', '2023-10-20 13:00:00', 'Pickup from DEL', 1, 1500.00, 1500.00),
('SU0004', 'S00003', 'Spa', '2023-11-02 16:00:00', 'Deep Tissue', 1, 2500.00, 2500.00),
('SU0005', 'S00001', 'Room Service', '2023-10-21 08:00:00', 'Breakfast', 1, 500.00, 500.00);

-- Service usage to stays links
INSERT INTO `ServiceUsage_has_Stays` (`ServiceUsage_idServiceUsage`, `Stays_idStays`) VALUES
('SU0001', 'ST0001'),
('SU0002', 'ST0001'),
('SU0005', 'ST0002'),
('SU0003', 'ST0003'),
('SU0004', 'ST0002');

-- Payments data
INSERT INTO `Payments` (`idPayments`, `Stays_idStays`, `Payment_Date`, `Amount`, `Payment_Method`, `Reference_Id`, `Status`) VALUES
('P00001', 'ST0001', '2023-10-28 11:30:00', 15500.00, 'Credit Card', 'TXN12345678', 'Success'),
('P00002', 'ST0002', '2023-10-22 10:45:00', 5200.00, 'UPI', 'UPI987654321', 'Success'),
('P00003', 'ST0003', '2023-11-01 14:00:00', 3500.00, 'Cash', 'CASH001', 'Advance'),
('P00004', 'ST0001', '2023-10-25 12:00:00', 5000.00, 'Credit Card', 'TXN12345000', 'Advance'),
('P00005', 'ST0005', '2023-11-10 12:00:00', 2000.00, 'UPI', 'UPI11223344', 'Advance');
