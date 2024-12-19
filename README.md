AL Local Library Management System:

System Summary:
This project intends to create a simple system for inventory and user management for a local library. The goal is to provide basic data management and library features that work to create an easier and convenient experience for both library staff and library guests, which means the system aims to provide real time and secure access to data as well as be scalable to smaller or larger library catalogues.

Components:
The system consists of a mySQL relational database to store and manage data, a Java application for staff to use for check outs, returns, and other in-library functions, and a website for use by library guests to view the catalogue and their account information online. A relational database model was created using mySQL to best represent the relationship between library data. The java application was chosen for this system due to ease of development, compatibility with the database using JDBC, and because the application can be run locally from library computers so hardware or software constraints don't need to be considered as much, as well as being more secure than software available over the web. The web application was developed to allow users, regardless of software or hardware, to access some information from their own devices.

How to Run:
The database is stored as a .sql file, which can be uploaded to a server. In my case, I used my localhost MAMP server and edited using phpMyAdmin. The java file should be able to access the database through JDBC as long as it can access the server, and the web files should be ready to be uploaded to a domain to be hosted online but of course can also be tested locally, but the connection to the database will have to be edited to include the appropriate server information. 


