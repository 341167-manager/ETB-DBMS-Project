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