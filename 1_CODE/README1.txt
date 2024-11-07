How to Run: 
The database is stored as a .sql file, which can be uploaded to a server. In my case, I used my localhost server and edited using phpMyAdmin.
The java file should be able to access the database through JDBC as long as it can access the server, and the web files should be ready to be 
uploaded to a domain to be hosted online but of course can also be tested locally, but the connection to the database will have to be edited 
to include the appropriate server information.

I have been testing everything on my local machine and my local MAMP host, so all of the addresses in the code lead there, but could be changed
to any server address where the database in could be hosted and be run just the same.

The html/php docs should be easily run within any browser. The java app runs in the console for now, but will eventually have a GUI. For now, functions
can be run and tested within the console using the menu created for the console.