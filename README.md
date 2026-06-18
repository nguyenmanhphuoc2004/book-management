# Online Bookstore Management System

## Overview

Online Bookstore Management System is a Java web application developed using the MVC architecture. The system allows customers to browse books, search by category, manage shopping carts, place orders, and track purchase history. Administrators can manage books, categories, and customer orders through a dedicated administration panel.

This project was developed as an academic project to practice Java Web Development, MVC design pattern, JDBC database connectivity, and e-commerce system implementation.

---

## Features

### Customer Features

* Browse available books
* Search books by category
* View book details
* User registration
* User login and logout
* Add books to shopping cart
* Update cart quantities
* Place orders
* Online checkout process
* View purchase history

### Administrator Features

* Admin authentication
* Manage book catalog

  * Add books
  * Edit books
  * Delete books
* Manage book categories
* View customer orders
* Confirm customer orders
* View completed payments
* Review invoice details

---

## System Architecture

The application follows the MVC (Model – View – Controller) architecture:

### Model Layer

Responsible for business logic and database operations.

Main components:

* SachDAO
* LoaiDAO
* KhachHangDAO
* HoaDonDAO
* ChiTietDAO
* GioHangBO
* LichSuMuaSachBO

### Controller Layer

Handles user requests and navigation.

Examples:

* dangnhapController
* dangkiController
* giohangController
* thanhtoanController
* adminController
* sachAdminController

### View Layer

Built using JSP pages.

Examples:

* dangnhap.jsp
* dangki.jsp
* htgio.jsp
* thanhtoan.jsp
* adminIndex.jsp
* quanlysach.jsp
* quanlyloai.jsp

---

## Technologies Used

### Backend

* Java
* Java Servlet
* JSP (JavaServer Pages)
* JDBC

### Frontend

* HTML
* CSS
* JavaScript
* JSP

### Database

* Microsoft SQL Server

### Server

* Apache Tomcat

### Libraries

* JSTL
* Commons FileUpload
* Commons IO
* SQL Server JDBC Driver

### Development Tools

* Eclipse IDE
* SQL Server Management Studio
* Git
* GitHub

---

## Project Structure

```text
src/main/java
├── Model
├── controller
└── tam

src/main/webapp
├── Admin
├── Session
├── image_sach
└── WEB-INF
```

---

## Main Modules

### Book Management

Manage book information, categories, and inventory.

### Customer Management

Handle registration, authentication, and customer profiles.

### Shopping Cart

Allow customers to add, remove, and update books before checkout.

### Order Management

Create invoices, process orders, and maintain transaction records.

### Purchase History

Provide customers with access to previous purchases.

### Administration

Allow administrators to manage books, categories, and customer orders.

---

## Learning Outcomes

Through this project, I gained practical experience in:

* Object-Oriented Programming (OOP)
* MVC Architecture
* Java Web Development
* JDBC Database Connectivity
* SQL Server Database Design
* Session Management
* Authentication and Authorization
* Shopping Cart Implementation
* E-commerce Workflow Design

---

## Future Improvements

* RESTful API integration
* Spring Boot migration
* JWT authentication
* Product reviews and ratings
* Payment gateway integration
* Responsive UI design
* Pagination and advanced filtering
* Docker deployment

---

## Author

Nguyen Manh Phuoc

Information Technology Student

Hue University of Sciences
