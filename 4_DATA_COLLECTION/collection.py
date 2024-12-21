import mysql.connector

# Connecting
db = mysql.connector.connect(
    host="localhost:8889",
    user="root",
    password="root",
    database="al_library_db"
)

# collecting check out data for whole library
cursor = db.cursor()
query = "SELECT * FROM checkOutHistory"
cursor.execute(query)

# Write the data to a file
with open("checkOutHistory.csv", "w") as file:
    for row in cursor.fetchall():
        file.write(",".join(map(str, row)) + "\n")
print("Data collection complete. Output: checkOutHistory.csv")

# collecting inventory data
queryBook = "SELECT * FROM bookinfo"
queryCD = "SELECT * FORM cdinfo"
queryDVD = "SELECT * FROM dvdinfo"


# Write the data to a file
cursor.execute(queryBook)
with open("inventory.csv", "w") as file:
    for row in cursor.fetchall():
        file.write(",".join(map(str, row)) + "\n")
cursor.execute(queryCD)
    for row in cursor.fetchall():
        file.write(",".join(map(str, row)) + "\n")
cursor.execute(queryDVD)
     for row in cursor.fetchall():
        file.write(",".join(map(str, row)) + "\n")
print("Data collection complete. Output: inventory.csv")

db.close()
