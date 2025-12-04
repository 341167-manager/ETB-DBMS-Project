<h1>ETB-Project-DBMS-</h1>

<!-- ER Diagram image rendered inline -->
<p align="center">
  <img width="650" height="782" alt="HotelManagementSystem" src="https://github.com/user-attachments/assets/97b4846e-3bc3-409e-be81-7455eaabcc8c">
</p>

<!-- Optional: direct link to the PDF file -->
<p>
  <a href="./HotelManagementSystem.pdf">Download ER Diagram (PDF)</a>
</p>

<h2>DBMS Project</h2>

<h3>📋 Project Submission Details</h3>
<ul>
  <li><strong>Group Number:</strong> 16</li>
  <li><strong>Submitted To:</strong> Prof. Ashok Harnal</li>
</ul>

<h4>Submitted By:</h4>
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Student ID</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Srishti Kumari</td><td>341176</td></tr>
    <tr><td>Yash Kumar</td><td>341178</td></tr>
    <tr><td>Salim Shah</td><td>341167</td></tr>
  </tbody>
</table>

<h2>🏨 Hotel Management System (DBMS Project)</h2>

<h3>📌 Project Overview</h3>
<p>
  This project is a comprehensive Relational Database Management System (RDBMS) designed to manage daily hotel operations across multiple branches. 
  It handles guest reservations, room inventory, employee management, service usage, guest preference tracking, and the complete billing workflow.
</p>

<h3>🛠️ Tech Stack</h3>
<ul>
  <li><strong>Database Engine:</strong> MySQL / MariaDB</li>
  <li><strong>Language:</strong> SQL (DDL &amp; DML)</li>
  <li><strong>Key Concepts:</strong> Normalization, Joins, Foreign Key Constraints, Indexing</li>
</ul>

<h3>✨ Key Features</h3>
<ul>
  <li><strong>Multi-Branch Support:</strong> Handles hotel chains across cities like Jaipur, Mumbai, Bengaluru, Delhi, and Chennai.</li>
  <li><strong>Reservation Lifecycle:</strong> Tracks bookings from <code>Pending</code> → <code>Confirmed</code> → <code>Stay</code> → <code>Checkout</code>.</li>
  <li><strong>Service Tracking:</strong> Logs all amenities used (Spa, Airport Pickup, Laundry, Room Service).</li>
  <li><strong>Billing &amp; Payments:</strong> Computes final charges and records payments using UPI, Credit Card, Cash, etc.</li>
  <li><strong>Guest Preference Profiling:</strong> Tracks preferred hotels, room types, bed types, and frequently used services.</li>
</ul>

<h3>🗂️ Database Schema</h3>
<p>
  The schema includes all major relational components required for a functional hotel management system.
  The ER diagram above shows entities such as Hotel, Guests, Rooms, Employees, Reservations, Stays, ServiceUsage, Payments, and GuestPreferences.
</p>

<table>
  <thead>
    <tr>
      <th>Table Name</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr><td><code>Hotel</code></td><td>Stores hotel branch details including contact information and ratings.</td></tr>
    <tr><td><code>Services</code></td><td>Catalog of hotel services offered with standard pricing.</td></tr>
    <tr><td><code>Guests</code></td><td>Customer profiles with personal details and identity proofs.</td></tr>
    <tr><td><code>Rooms</code></td><td>Room inventory with type, bed configuration, pricing, and status.</td></tr>
    <tr><td><code>Employees</code></td><td>Hotel staff with job roles, assignments, and salary details.</td></tr>
    <tr><td><code>Reservations</code></td><td>Guest bookings including dates, planned charges, and status.</td></tr>
    <tr><td><code>Stays</code></td><td>Actual stay execution with check-in/out and final computed charges.</td></tr>
    <tr><td><code>ServiceUsage</code></td><td>Logs each service consumed during a guest’s stay.</td></tr>
    <tr><td><code>ServiceUsage_has_Stays</code></td><td>Links service usage entries to the corresponding stay.</td></tr>
    <tr><td><code>Payments</code></td><td>Records financial transactions with method and status.</td></tr>
    <tr><td><code>GuestPreferences</code></td><td>Tracks guest preferences to support personalization.</td></tr>
  </tbody>
</table>

<h3>🚀 How to Run</h3>
<ol>
  <li>Clone the repository.</li>
  <li>Open MySQL Workbench or another SQL client.</li>
  <li>Run the SQL script to create the database, tables, and sample data.</li>
  <li>Query across Reservations, Stays, Payments, and GuestPreferences to explore functionality.</li>
</ol>
