The scripts included create .csv files for data collected from the library system. This data can all be viewed directly in the system as well, but these scripts can be used to obtain the information for easy use elsewhere.
Running the scripts will result in 2 outputs:
  1. checkOutHistory.csv: this file contains all information about all checkouts in the library, including the date of checkout and the date of return if the item has been           returned.
  2. inventory.csv: this file is an amalgamation of 3 table views in the database (bookinfo, cdinfo, dvdinfo). This file simply displays all of the infventory data first with        books and then with CDs and DVDS with all accompanying information for the whole library.
Requirements: python and mysql-connector-python

To run:
  Ensure database is running, and check the credentials included in the python file.
  Run the python file as normal, and the outputs should be available.
