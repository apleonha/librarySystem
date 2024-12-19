//THIS IS NOT THE MOST RECENT VERSION

package librarySystem;

import java.sql.*; 
import java.util.Scanner;

public class RunSystem {

	   static final String DB_URL = "jdbc:mysql://localhost:8889/al_library_db"; 
	   static final String USER = "root";
	   static final String PASS = "root";

 
 public static void main(String[] args) {
	menu();
  }
 
 public static void menu() {
	 Scanner in = new Scanner(System.in);
	 int choice; 
	 int inventoryID;
	 int cardNo;
	 
	 System.out.println("1: Check out an Item");
	 System.out.println("2: Return an Item");
	 System.out.println("3: Check Availability");
	 System.out.println("4: Place hold.");
	 System.out.println("5: Inventory Search.");
	 System.out.println("0: Exit.");
	System.out.println("\nInput a number to make a choice:");
	choice = in.nextInt();
	
	do {
	switch(choice) {
	case 1:
		System.out.print("Enter inventoryID: ");
		inventoryID = in.nextInt();
		System.out.println("Enter user's card number: ");
		cardNo = in.nextInt();
		checkOut(inventoryID, cardNo);
		menu();
		break;
	case 2:	
		System.out.print("Enter inventoryID: ");
		inventoryID = in.nextInt();
		System.out.println("Enter user's card number: ");
		cardNo = in.nextInt();
		returnItem(inventoryID, cardNo);
		menu();
		break;
	case 3:
		System.out.print("Enter inventoryID: ");
		inventoryID = in.nextInt();
		checkAvail(inventoryID);
		menu();
		break;
	case 4:
		System.out.print("Enter inventoryID: ");
		inventoryID = in.nextInt();
		System.out.println("Enter user's card number: ");
		cardNo = in.nextInt();
		placeHold(inventoryID, cardNo);
		menu();
		break;
	case 5:
		System.out.print("Enter inventoryID: ");
		inventoryID = in.nextInt();
		inventorySearch(inventoryID);
		menu();
		break;
	default:
		menu();
		break;
	}
	}while (choice != 0);
 }
 
 public static void checkOut(int inventoryID, int cardNo) {
	 boolean yourTurn = false;
	 
	 if(checkHold(inventoryID, cardNo) == true) {
		int pos = removeHold(inventoryID, cardNo);
     	if(pos == -1) {
     		System.out.print("Could not remove hold.");
     		return;
     	} else if (pos != 1) {
     		System.out.println("User is not next in line for this item! Unable to check out.");
     		return;
     	} else
     		yourTurn = true;
     } 
	 
	 if(checkAvail(inventoryID) == true || yourTurn == true) {
		 
	 
	 
	 String q1 = "INSERT INTO `checkOutHistory`(`inventoryID`, `cardNo`) VALUES (" + inventoryID + ", " + cardNo + ")";
	 String q0 = "UPDATE `inventory` SET `statusID` = 1 WHERE `inventoryID` = " + inventoryID + ";";
     try{Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(q0);
        Statement stmt1 = conn.createStatement();
        stmt1.executeUpdate(q1);
        System.out.print("Checkout successful.");
     } catch (SQLException e) {
        e.printStackTrace();
     } 
     System.out.println();
	 } else {
		 System.out.println("Unable to checkout item.");
	 }
 }
 
 public static void returnItem(int inventoryID, int cardNo) {
	 String q1 = "UPDATE `checkOutHistory` SET returnDate = CURRENT_TIMESTAMP WHERE `inventoryID` = " + inventoryID + " AND `cardNo` = " + cardNo + ";";
	 
	 
     try{Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(q1);
        
        System.out.print("Return successful.");
      System.out.println();
     } catch (SQLException e) {
        e.printStackTrace();
     } 
 }
 
 public static void placeHold(int inventoryID, int cardNo) {
	 if(checkAvail(inventoryID) == false) {
		 
		 String q1 = "INSERT INTO `holds`(`inventoryID`, `cardNo`, `position`) VALUES(" + inventoryID + ", " + cardNo + ", 1);";
		 
	     try{Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	        Statement stmt = conn.createStatement();
	        stmt.executeUpdate(q1);
	        System.out.print("Hold placed successfully.");
	     } catch (SQLException e) {
	        e.printStackTrace();
	     } 
	    
		 } else {
			 System.out.println("Unable to place hold.");
		 }
	 System.out.println();
 }
 public static boolean checkHold(int inventoryID, int cardNo) {
	 String q = "SELECT * FROM `holds` WHERE `inventoryID` = " + inventoryID + " AND `cardNo` = " + cardNo + ";";
	 
	try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery(q);) {
      // Extract data from result set
     while (rs.next() == false) {
        	return false;
        }
   } catch (SQLException e) {
      e.printStackTrace();
   } return true;
 }
 
 public static int removeHold(int inventoryID, int cardNo) {
	 	int deletedPos;
	 	String q1 = "SELECT * FROM `holds` WHERE `inventoryID` =  " + inventoryID + " AND `cardNo` = " + cardNo + ";";
	     try{Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	        Statement stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery(q1);
	        rs.next();
	        deletedPos = rs.getInt("position");
	        String q2 = "DELETE FROM `holds` WHERE `inventoryID` =  " + inventoryID + " AND `cardNo` = " + cardNo + ";";
	        String q3 = "UPDATE `holds` SET `position` =  position - 1 WHERE `inventoryID` = " + inventoryID + " AND `position` > " + deletedPos + ";";
	        Statement stmt2 = conn.createStatement();
	        stmt2.executeUpdate(q2);
	        Statement stmt3 = conn.createStatement();
	        stmt3.executeUpdate(q3);
	        return deletedPos;
	        
	     } catch (SQLException e) {
	        e.printStackTrace();
	     }
	     return -1;
	 
 }
 
 public static boolean checkAvail(int inventoryID) {
	 String q = "SELECT statusID, waitlist FROM inventory WHERE inventoryID =" + inventoryID;
	 
	try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery(q);) {
      // Extract data from result set
     while (rs.next()) {
         // Retrieve by column name
        int status = rs.getInt("statusID");
        if(status == 2) {
        	int waitlist = rs.getInt("waitlist");
        	System.out.println("Item Unavailable. Waitlist: " + waitlist);
        	return false;
        } else if (status == 1){
        	return true;
        }
      }
   } catch (SQLException e) {
      e.printStackTrace();
   } 
	return false;
 }
 
 public static void inventorySearch(int inventoryID) {
	 String q = "SELECT * FROM inventory WHERE inventoryID = " + inventoryID;
	 String qbook = "SELECT * FROM bookinfo WHERE inventoryID = " + inventoryID;
	 String qCD = "SELECT * FROM cdinfo WHERE inventoryID = " + inventoryID;
	 String qdvd = "SELECT * FROM dvdinfo WHERE inventoryID = " + inventoryID;
	 
	 Statement stmt2;
	 ResultSet rs2;
	 
	 
	 try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		  Statement stmt = conn.createStatement();
		  ResultSet rs = stmt.executeQuery(q);) {
		 	rs.next();
		 	stmt2 = conn.createStatement();
		 	if(rs.getInt("typeNo") == 1) {
				rs2 = stmt2.executeQuery(qbook);
				while (rs2.next()) {
				    // Retrieve by column name
				    System.out.println("Inventory ID: " + rs2.getInt("inventoryID")
				    + "\nISBN: " + rs2.getString("ISBN") + "\nTitle: " + rs2.getString("title")
				    + "\nAuthor: " + rs2.getString("author") + "\nStatus: " + rs2.getString("status"));
				    }
		 	} else if (rs.getInt("typeNo") == 2) {
		 		rs2 = stmt2.executeQuery(qdvd);
		 		while (rs2.next()) {
				    // Retrieve by column name
				    System.out.println("Inventory ID: " + rs2.getInt("inventoryID")
				    + "\nDVD ID: " + rs2.getInt("dvdID") + "\nTitle: " + rs2.getString("dvdTitle")
				    + "\nGenre: " + rs2.getString("genre") + "\nStatus: " + rs2.getString("status"));
				    }
		 	} else {
		 		rs2 = stmt2.executeQuery(qCD);
		 		while (rs2.next()) {
				    // Retrieve by column name
				    System.out.println("Inventory ID: " + rs2.getInt("inventoryID")
				    + "\nCD ID: " + rs2.getInt("cdID") + "\nTitle: " + rs2.getString("cdTitle")
				    + "\nArtist: " + rs2.getString("artistName") + "\nStatus: " + rs2.getString("status"));
				    }
		 	}
		System.out.println();  
	 } catch (SQLException e) {
		e.printStackTrace();
		 } 
 }
 
}

