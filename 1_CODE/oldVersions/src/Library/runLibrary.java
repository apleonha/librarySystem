package Library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.Toggle;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class runLibrary extends Application {

	static final String DB_URL = "jdbc:mysql://localhost:8889/al_library_db";
	static final String USER = "root";
	static final String PASS = "root";

	public static void main(String[] args) {
		launch(args);
	}

	@Override
	public void start(Stage primaryStage) {
		try {
			// Create a scene by calling the getPane() method and place it in the stage
			Scene scene = new Scene(home(primaryStage), 600, 450);
			primaryStage.setScene(scene); // Place the scene in the stage
			primaryStage.show(); // Display the stage
		} catch (Exception err) {
			err.printStackTrace();
		}

	}
	
	public BorderPane home(Stage primaryStage) {
		BorderPane logInPane = new BorderPane();

		Label titleLabel = new Label("Library Log In");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		logInPane.setTop(titleLabel);
		logInPane.setStyle("-fx-background-color: white;");
		
		VBox center = new VBox(10);
		center.getChildren().add(logIn(primaryStage));
		logInPane.setCenter(center);
		

		return logInPane;
	}

	public BorderPane logIn(Stage logInStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Log In");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(10);

		// prompt for details
		Label usernameLabel = new Label("Username");
		TextField txt1 = new TextField();

		Label passLabel = new Label("Password");
		PasswordField txt2 = new PasswordField();

		center.getChildren().addAll(usernameLabel, txt1, passLabel, txt2);

		HBox buttons = new HBox(100);
		// Create buttons
		Button enter = new Button("Enter");
		enter.setMinSize(50, 30);
		enter.setOnAction(e -> {
			center.getChildren().removeIf(node -> node instanceof Text);
			String username = txt1.getText();
			String password = txt2.getText();
			
			if(username.isBlank() || password.isBlank()) {
				Text empty = new Text("Please enter a username and password.");
				center.getChildren().add(empty);
			}
			
			if(validateLogin(username, password)) {
				Stage menuStage = new Stage();
			menuStage.setTitle("Library Menu");
			Scene menuScene = new Scene(menu(menuStage, logInStage), 600, 450);
			menuStage.setScene(menuScene);
			menuStage.show();
			} else {
				Text invalid = new Text("Invalid login credentials. Try again or contact support.");
				center.getChildren().add(invalid);
			}
		});
		
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> logInStage.close());
		buttons.getChildren().addAll(enter, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);
		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));
		pane.setCenter(center);
		
		return pane;
	}
	
	private boolean validateLogin(String username, String password) {
        String query = "SELECT * FROM staff WHERE username = ? AND password = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Returns true if a match is found

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
 	public BorderPane menu(Stage menuStage, Stage primaryStage) {
		// creating and labeling the pane
		BorderPane menuPane = new BorderPane();

		Label titleLabel = new Label("Library Menu");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		menuPane.setTop(titleLabel);
		menuPane.setStyle("-fx-background-color: white;");

		// Create buttons
		Button checkOut = new Button("Check Out Item");
		checkOut.setMinSize(50, 30);
		checkOut.setOnAction(e -> {
			Stage coStage = new Stage();
			coStage.setTitle("Check Out Item");
			Scene coScene = new Scene(checkOut(coStage), 600, 450);
			coStage.setScene(coScene);
			coStage.show();
		});

		Button returnItem = new Button("Return Item");
		returnItem.setMinSize(50, 30);
		returnItem.setOnAction(e -> {
			Stage returnStage = new Stage();
			returnStage.setTitle("Return Item");
			Scene returnScene = new Scene(returnItem(returnStage), 600, 450);
			returnStage.setScene(returnScene);
			returnStage.show();
		});

		Button avail = new Button("Check Item Availability");
		avail.setMinSize(50, 30);
		avail.setOnAction(e -> {
			Stage availStage = new Stage();
			availStage.setTitle("Check Item Availability");
			Scene availScene = new Scene(checkAvailDisplay(availStage), 600, 450);
			availStage.setScene(availScene);
			availStage.show();
		});

		Button hold = new Button("Place Hold");
		hold.setMinSize(50, 30);
		hold.setOnAction(e -> {
			Stage holdStage = new Stage();
			holdStage.setTitle("Place Hold");
			Scene holdScene = new Scene(placeHold(holdStage), 600, 450);
			holdStage.setScene(holdScene);
			holdStage.show();
		});

		Button removeHold = new Button("Remove Hold");
		removeHold.setMinSize(50, 30);
		removeHold.setOnAction(e -> {
			Stage removeHoldStage = new Stage();
			removeHoldStage.setTitle("Place Hold");
			Scene removeHoldScene = new Scene(removeHoldDisplay(removeHoldStage), 600, 450);
			removeHoldStage.setScene(removeHoldScene);
			removeHoldStage.show();
		});

		Button search = new Button("Search Inventory");
		search.setMinSize(50, 30);
		search.setOnAction(e -> {
			Stage inventoryStage = new Stage();
			inventoryStage.setTitle("Search Inventory");
			Scene inventoryScene = new Scene(inventorySearch(inventoryStage));
			inventoryStage.setScene(inventoryScene);
			inventoryStage.show();
		});

		Button user = new Button("User LookUp");
		user.setMinSize(50, 30);
		user.setOnAction(e -> {
			Stage userStage = new Stage();
			userStage.setTitle("User Details");
			Scene userScene = new Scene(user(userStage));
			userStage.setScene(userScene);
			userStage.show();
		});

		// Creat button to exit program
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> {
			primaryStage.close();
			menuStage.close();
		});

		// Creating VBox to set and align buttons
		VBox menu = new VBox(20);
		menu.setAlignment(Pos.CENTER);
		menu.getChildren().addAll(checkOut, returnItem, avail, hold, removeHold, user, search, exit);

		menuPane.setCenter(menu);

		return menuPane;
	}

	public static BorderPane checkOut(Stage coStage) {
		BorderPane pane = new BorderPane();
		VBox center = new VBox(10);

		Label titleLabel = new Label("Check Out Item");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		pane.setTop(titleLabel);
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);

		// prompt for details
		Label invLabel = new Label("Enter Inventory ID:");
		TextField txt1 = new TextField();

		Label cardLabel = new Label("Enter Card No:");
		TextField txt2 = new TextField();

		HBox buttons = new HBox(100);

		center.getChildren().addAll(invLabel, txt1, cardLabel, txt2);

		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		submit.setOnAction(event -> {
			int inventoryID = Integer.parseInt(txt1.getText());
			int cardNo = Integer.parseInt(txt2.getText());

			boolean yourTurn = false;

			if (checkHold(inventoryID, cardNo) == true) {
				int pos = removeHold(inventoryID, cardNo);
				if (pos == -1) {
					Text error1 = new Text("Could not remove hold. Item not checked out.");
					center.getChildren().add(error1);
				} else if (pos != 1) {
					Text error2 = new Text("User is not next in line for this item! Unable to check out.");
					center.getChildren().add(error2);
				} else
					yourTurn = true;
			}

			if (checkAvail(inventoryID) == true || yourTurn == true) {
				String q1 = "INSERT INTO `checkOutHistory`(`inventoryID`, `cardNo`) VALUES (" + inventoryID + ", "
						+ cardNo + ")";
				String q0 = "UPDATE `inventory` SET `statusID` = 1 WHERE `inventoryID` = " + inventoryID + ";";
				try {
					Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
					Statement stmt = conn.createStatement();
					stmt.executeUpdate(q0);
					Statement stmt1 = conn.createStatement();
					stmt1.executeUpdate(q1);
					Text success = new Text("Checkout successful.");
					center.getChildren().add(success);
				} catch (SQLException err) {
					err.printStackTrace();
				}
				System.out.println();
			} else {
				Text error3 = new Text("Unable to checkout item.");
				center.getChildren().add(error3);
			}

		});

		// Creat button to exit program
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> coStage.close());

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);

		return pane;
	}

	public static boolean checkHold(int inventoryID, int cardNo) {
		String q = "SELECT * FROM `holds` WHERE `inventoryID` = " + inventoryID + " AND `cardNo` = " + cardNo + ";";

		try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(q);) {
			// Extract data from result set
			while (rs.next() == false) {
				return false;
			}
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return true;
	}

	public static int removeHold(int inventoryID, int cardNo) {
		int deletedPos;
		String q1 = "SELECT * FROM `holds` WHERE `inventoryID` =  " + inventoryID + " AND `cardNo` = " + cardNo + ";";
		try {
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(q1);
			rs.next();
			deletedPos = rs.getInt("position");
			String q2 = "DELETE FROM `holds` WHERE `inventoryID` =  " + inventoryID + " AND `cardNo` = " + cardNo + ";";
			String q3 = "UPDATE `holds` SET `position` =  position - 1 WHERE `inventoryID` = " + inventoryID
					+ " AND `position` > " + deletedPos + ";";
			Statement stmt2 = conn.createStatement();
			stmt2.executeUpdate(q2);
			Statement stmt3 = conn.createStatement();
			stmt3.executeUpdate(q3);
			return deletedPos;

		} catch (SQLException err) {
			err.printStackTrace();
		}
		return -1;

	}

	public static BorderPane removeHoldDisplay(Stage removeHoldStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Remove Hold");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(10);

		// prompt for details
		Label invLabel = new Label("Enter Inventory ID:");
		TextField txt1 = new TextField();

		Label cardLabel = new Label("Enter Card No:");
		TextField txt2 = new TextField();

		center.getChildren().addAll(invLabel, txt1, cardLabel, txt2);

		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		submit.setOnAction(e -> {
			center.getChildren().removeIf(node -> node instanceof Text);
			if (txt1.getText().isEmpty() || txt2.getText().isEmpty()) {
				Text empty = new Text("Enter an inventory ID and card number.");
				center.getChildren().add(empty);
			} else {
				int inventoryID = Integer.parseInt(txt1.getText());
				int cardNo = Integer.parseInt(txt2.getText());

				try {
					if (checkHold(inventoryID, cardNo) == true) {
						removeHold(inventoryID, cardNo);
						Text success = new Text("Hold successfully removed.");
						center.getChildren().add(success);
					} else {
						Text na = new Text("No holds exist for this item and card number.");
						center.getChildren().add(na);
					}

				} catch (Exception err) {
					err.printStackTrace();
				}
			}
		});

		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> removeHoldStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);
		return pane;

	}

	public static BorderPane returnItem(Stage returnStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Return Item");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(10);

		// prompt for details
		Label invLabel = new Label("Enter Inventory ID:");
		TextField txt1 = new TextField();

		Label cardLabel = new Label("Enter Card No:");
		TextField txt2 = new TextField();

		center.getChildren().addAll(invLabel, txt1, cardLabel, txt2);

		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		submit.setOnAction(event -> {
			if (txt1.getText().isEmpty() || txt2.getText().isEmpty()) {
				Text empty = new Text("Enter an inventoryID and card number.");
				center.getChildren().add(empty);
			} else {
				int inventoryID = Integer.parseInt(txt1.getText());
				int cardNo = Integer.parseInt(txt2.getText());

				center.getChildren().removeIf(node -> node instanceof Text || node instanceof Button);

				String q1 = "SELECT * FROM `checkOutHistory` WHERE `inventoryID`=" + inventoryID + "&& `cardNo` = "
						+ cardNo + "&& `returnDate` IS NULL;";
				String q2 = "UPDATE `checkOutHistory` SET returnDate = CURRENT_TIMESTAMP WHERE `inventoryID` = "
						+ inventoryID + " AND `cardNo` = " + cardNo + ";";

				try {
					Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(q1);
					if (!rs.isBeforeFirst()) {
						Text na = new Text("Item is not checked out under specified card.");
						center.getChildren().add(na);
					} else {
						Statement stmt2 = conn.createStatement();
						stmt2.executeUpdate(q2);
						Text success = new Text("Return successful.\n");
						center.getChildren().add(success);
					}
				} catch (SQLException err) {
					Text fail = new Text("Unable to return item.");
					center.getChildren().add(fail);
					err.printStackTrace();
				}

			}

		});

		// Creat button to exit program
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> returnStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);
		return pane;
	}

	public static boolean checkAvail(int inventoryID) {
		String q = "SELECT statusID, waitlist FROM inventory WHERE inventoryID =" + inventoryID;

		try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(q);) {
			// Extract data from result set
			while (rs.next()) {
				// Retrieve by column name
				int status = rs.getInt("statusID");
				if (status == 2) {
					int waitlist = rs.getInt("waitlist");
					System.out.println("Item Unavailable. Waitlist: " + waitlist);
					return false;
				} else if (status == 1) {
					return true;
				}
			}
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return false;
	}

	public static BorderPane checkAvailDisplay(Stage availStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Check Item Availability");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(10);

		// prompt for details
		Label invLabel = new Label("Enter Inventory ID:");
		TextField txt1 = new TextField();

		center.getChildren().addAll(invLabel, txt1);

		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		submit.setOnAction(event -> {
			center.getChildren().removeIf(node -> node instanceof Text || node instanceof Button);
			if (txt1.getText().isEmpty()) {
				Text empty = new Text("Enter an inventory ID.");
				center.getChildren().add(empty);
			}
			int inventoryID = Integer.parseInt(txt1.getText());

			String q = "SELECT statusID, waitlist FROM inventory WHERE inventoryID =" + inventoryID;

			try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(q);) {
				// Extract data from result set
				if (!rs.isBeforeFirst()) {
					Text notFound = new Text("Item not found. Enter a valid inventory ID.");
					center.getChildren().add(notFound);
				}
				while (rs.next()) {
					// Retrieve by column name
					int status = rs.getInt("statusID");
					if (status == 2) {
						int waitlist = rs.getInt("waitlist");
						Text unavail = new Text("Item Unavailable. Waitlist: " + waitlist + "\nAdd to Waitlist?");
						Button hold = new Button("Place Hold");
						hold.setMinSize(50, 30);
						hold.setOnAction(e -> {
							Stage holdStage = new Stage();
							holdStage.setTitle("Place Hold");
							Scene holdScene = new Scene(placeHold(holdStage), 600, 450);
							holdStage.setScene(holdScene);
							holdStage.show();
						});
						center.getChildren().addAll(unavail, hold);
					} else if (status == 1) {
						Text avail = new Text("Item is currently available.");
						center.getChildren().add(avail);
					}
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}

		});

		// Creat button to exit program
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> availStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);
		return pane;
	}

	public static BorderPane placeHold(Stage holdStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Place Item On Hold");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(10);

		// prompt for details
		Label invLabel = new Label("Enter Inventory ID:");
		TextField txt1 = new TextField();

		Label cardLabel = new Label("Enter Card No:");
		TextField txt2 = new TextField();

		center.getChildren().addAll(invLabel, txt1, cardLabel, txt2);

		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		submit.setOnAction(event -> {
			center.getChildren().removeIf(node -> node instanceof Text);
			if (txt1.getText().isEmpty() || txt2.getText().isEmpty()) {
				Text empty = new Text("Enter an inventory ID and card number.");
				center.getChildren().add(empty);
			} else {
				int inventoryID = Integer.parseInt(txt1.getText());
				int cardNo = Integer.parseInt(txt2.getText());

				if (checkAvail(inventoryID) == false) {

					String q1 = "INSERT INTO `holds`(`inventoryID`, `cardNo`, `position`) VALUES(" + inventoryID + ", "
							+ cardNo + ", 1);";

					try {
						Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
						Statement stmt = conn.createStatement();
						stmt.executeUpdate(q1);
						Text success = new Text("Hold placed successfully.");
						center.getChildren().add(success);
					} catch (SQLException e) {
						e.printStackTrace();
					}

				} else {
					Text error = new Text(
							"Unable to place hold. Check input and try again or check item availability or existing holds.");
					Button checkHold = new Button("Check Hold");
					checkHold.setMinSize(50, 30);

					HBox errButtons = new HBox(100);
					checkHold.setOnAction(e -> {
						center.getChildren().removeIf(node -> node instanceof Text);
						errButtons.getChildren().removeIf(node -> node instanceof Button);
						if (checkHold(inventoryID, cardNo) == true) {
							Text tr = new Text("Hold already exists for this item for this card number.");
							center.getChildren().add(tr);
						} else {
							Text fa = new Text("No existing hold for this item for this card number.");
							center.getChildren().add(fa);
						}
					});

					Button checkAvail = new Button("Check Availability");
					checkAvail.setMinSize(50, 30);

					checkAvail.setOnAction(e -> {
						center.getChildren().removeIf(node -> node instanceof Text);
						errButtons.getChildren().removeIf(node -> node instanceof Button);
						if (checkAvail(inventoryID) == true) {
							Text tr = new Text("Item currently available.");
							center.getChildren().add(tr);
						} else {
							Text fa = new Text("Item unavailable. Try placing hold again.");
							center.getChildren().add(fa);
						}
					});
					errButtons.getChildren().addAll(checkHold, checkAvail);
					center.getChildren().addAll(error, errButtons);
				}
			}
		});

		// Creat button to exit program
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> holdStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);
		return pane;
	}

	public static BorderPane inventorySearch(Stage inventoryStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Inventory Search");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(10);
		HBox type = new HBox(100);

		Label typeLabel = new Label("I'm looking for: ");
		ToggleGroup group = new ToggleGroup();
		RadioButton book = new RadioButton("books");
		book.setToggleGroup(group);
		book.setSelected(true);
		RadioButton dvd = new RadioButton("DVDs");
		dvd.setToggleGroup(group);
		RadioButton cd = new RadioButton("CDs");
		cd.setToggleGroup(group);

		type.getChildren().addAll(typeLabel, book, dvd, cd);

		center.getChildren().add(type);
		center.getChildren().add(book(inventoryStage));
		
		group.selectedToggleProperty().addListener(new ChangeListener<Toggle>()  { 
                	public void changed(ObservableValue<? extends Toggle> ov, 
                 final Toggle toggle, final Toggle new_toggle) 
     { 
       center.getChildren().removeIf(node -> node instanceof VBox);
       if(group.getSelectedToggle() == book) {
			center.getChildren().add(book(inventoryStage));
			inventoryStage.sizeToScene();
       } else if (group.getSelectedToggle() == dvd) {
    	   center.getChildren().add(dvd(inventoryStage));
    	   inventoryStage.sizeToScene();
       } else if(group.getSelectedToggle() == cd) {
    	   center.getChildren().add(cd(inventoryStage));
    	   inventoryStage.sizeToScene();
       }
     } 
 }); 
	
		center.setPadding(new Insets(0, 20, 20, 20));

		pane.setCenter(center);
		return pane;

	}
	
	public static BorderPane results(String query, Stage stage, String title, int type) {
		System.out.print(query);
		
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label(title);
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);
		 
		VBox center = new VBox(); 
		TableView<ObservableList<String>> tableView = new TableView<>();
		
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);) {
		
		java.sql.ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        // Dynamically create columns
        for (int i = 1; i <= columnCount; i++) {
            final int columnIndex = i - 1;
            TableColumn<ObservableList<String>, String> column = new TableColumn<>(metaData.getColumnName(i));
            column.setCellValueFactory(param -> 
                new javafx.beans.property.SimpleStringProperty(param.getValue().get(columnIndex))
            );
            tableView.getColumns().add(column);
        }

        // Populate rows
        ObservableList<ObservableList<String>> data = FXCollections.observableArrayList();
        while (rs.next()) {
            ObservableList<String> row = FXCollections.observableArrayList();
            for (int i = 1; i <= columnCount; i++) {
                row.add(rs.getString(i));
            }
            data.add(row);
        }
        tableView.setItems(data);

    } catch (SQLException e) {
        e.printStackTrace();
        // Handle errors (e.g., show an alert)
    }
		
		center.getChildren().add(tableView);
		
		if(type == 1) {
	   // Creat button to exit program
		Button exit = new Button("Exit");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> stage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		}
		
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);
		return pane;
	      
		
	}
	
	public static VBox book(Stage inventoryStage) {
		VBox input = new VBox(10);
		
		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		
		 	Label title = new Label("Title");
			Label author = new Label("Author");
			Label genre = new Label("Genre");
			
			TextField txt1 = new TextField();
			TextField txt2 = new TextField();
			TextField txt3 = new TextField();
			
			submit.setOnAction(ev -> {
				input.getChildren().removeIf(node -> node instanceof Text);
				String titleInput = txt1.getText();
				String authorInput = txt2.getText();
				String genreInput = txt3.getText();
					
				String qbook = "SELECT bookinfo.ISBN, bookinfo.title, bookinfo.author, genre.genre, bookinfo.status, inventory.waitlist, bookinfo.inventoryID FROM bookinfo"
							+ " JOIN book ON bookinfo.ISBN = book.ISBN JOIN genre ON book.genreID = genre.genreID JOIN inventory ON bookinfo.inventoryID = inventory.inventoryID";
					
				List<String> conditions = new ArrayList<>();
					
				if(!titleInput.isEmpty()) {
					conditions.add("bookinfo.title LIKE '%" + titleInput + "%'");
				} 
				if (!authorInput.isEmpty()) {
					conditions.add("bookinfo.author LIKE '%" + authorInput + "%'");
				} 
				if (!genreInput.isEmpty()) {
					conditions.add("bookinfo.genre LIKE '%" + genreInput + "%'");
				} 
				
				if(!conditions.isEmpty()) {
					qbook += " WHERE ";
					for(int i = 0; i < conditions.size(); i++) {
						qbook += conditions.get(i);
						if(i < conditions.size() - 1) {
							qbook += " AND ";
						}
					}
					qbook += ";";
					
					Stage resultStage = new Stage();
					resultStage.setTitle("Search Results");
					Scene resultScene = new Scene(results(qbook, resultStage, "Search Results", 1), 900, 500);
					resultStage.setScene(resultScene);
					resultStage.show();
				}
			});
		
		
		input.getChildren().addAll(title, txt1, author, txt2, genre, txt3);
		
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> inventoryStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		input.getChildren().add(buttons);
		input.setPadding(new Insets(0, 20, 20, 20));
		
		return input;
	}

	public static VBox dvd(Stage inventoryStage) {
		VBox input = new VBox(10);
		
		Label DVDtitle = new Label("Title");
		Label director = new Label("Director");
		Label studio = new Label("Studio");
		Label DVDgenre = new Label("Genre");
		
		TextField txt4 = new TextField();
		TextField txt5 = new TextField();
		TextField txt6 = new TextField();
		TextField txt7 = new TextField();
		
		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		
		submit.setOnAction(ev -> {
			input.getChildren().removeIf(node -> node instanceof Text);
			String titleInput = txt4.getText();
			String directorInput = txt5.getText();
			String studioInput = txt6.getText();
			String genreInput = txt7.getText();
		
				
			String qdvd = "SELECT dvdinfo.dvdTitle, director.director, studio.studio, genre.genre, dvdinfo.status, inventory.waitlist, dvdinfo.inventoryID"
					+ "	FROM dvdinfo JOIN dvd ON dvdinfo.dvdID = dvd.dvdID JOIN dvdDirector ON dvd.dvdID = dvdDirector.dvdID JOIN director"
					+ " ON dvdDirector.directorID = director.directorID JOIN studio ON dvd.studioID = studio.studioID JOIN genre ON "
					+ "dvd.genreID = genre.genreID JOIN inventory ON dvdinfo.inventoryID = inventory.inventoryID";
				
			List<String> conditions = new ArrayList<>();
				
			if(!titleInput.isEmpty()) {
				conditions.add("dvdinfo.dvdTitle LIKE '%" + titleInput + "%'");
			}
			if (!directorInput.isEmpty()) {
				conditions.add("director LIKE '%" + directorInput + "%'");
			}
			if (!studioInput.isEmpty()) {
				conditions.add("studio LIKE '%" + studioInput + "%'");
			}
			if (!genreInput.isEmpty()) {
				conditions.add("genre LIKE '%" + genreInput + "%'");
			}
			
			if(!conditions.isEmpty()) {
				qdvd += " WHERE ";
				for(int i = 0; i < conditions.size(); i++) {
					qdvd += conditions.get(i);
					if(i < conditions.size() - 1) {
						qdvd += " AND ";
					}
				}
				qdvd += ";";
			
				Stage resultStage = new Stage();
				resultStage.setTitle("Search Results");
				Scene resultScene = new Scene(results(qdvd, resultStage, "Search Results", 1), 900, 500);
				resultStage.setScene(resultScene);
				resultStage.show();
			}	
		});
	   input.getChildren().addAll(DVDtitle, txt4, director, txt5, studio, txt6, DVDgenre, txt7);
	   Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> inventoryStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		input.getChildren().add(buttons);
		input.setPadding(new Insets(0, 20, 20, 20));
	   
	   return input;
	}
	
	public static VBox cd(Stage inventoryStage) {
		VBox input = new VBox(10);
		
		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		
		Label CDtitle = new Label("Title");
		Label artist = new Label("Artist");
		Label CDgenre = new Label("Genre");
		
		TextField txt8 = new TextField();
		TextField txt9 = new TextField();
		TextField txt10 = new TextField();
			
			submit.setOnAction(ev -> {
				input.getChildren().removeIf(node -> node instanceof Text);
				String titleInput = txt8.getText();
				String artistInput = txt9.getText();
				String genreInput = txt10.getText();
					
				String qcd = "SELECT cdinfo.cdTitle, cdinfo.artistName, audioGenre.audioGenre, cdinfo.status, inventory.waitlist, cdinfo.inventoryID FROM cdinfo"
						+ "	JOIN cd ON cdinfo.cdID = cd.cdID JOIN audioGenre ON cd.audioGenreID = audioGenre.audioGenreID JOIN inventory ON "
						+ "cdinfo.inventoryID = inventory.inventoryID";
					
				List<String> conditions = new ArrayList<>();
					
				if(!titleInput.isEmpty()) {
					conditions.add("cdinfo.cdTitle LIKE '%" + titleInput + "%'");
				}
				if (!artistInput.isEmpty()) {
					conditions.add("cdinfo.artistName LIKE '%" + artistInput + "%'");
				}
				if (!genreInput.isEmpty()) {
					conditions.add("audioGenre LIKE '%" + genreInput + "%'");
				}
				
				if(!conditions.isEmpty()) {
					qcd += " WHERE ";
					for(int i = 0; i < conditions.size(); i++) {
						qcd+= conditions.get(i);
						if(i < conditions.size() - 1) {
							qcd += " AND ";
						}
					}
					qcd += ";";
				
					Stage resultStage = new Stage();
					resultStage.setTitle("Search Results");
					Scene resultScene = new Scene(results(qcd, resultStage, "Search Results", 1), 900, 500);
					resultStage.setScene(resultScene);
					resultStage.show();
				}
			});
		
		
		input.getChildren().addAll(CDtitle, txt8, artist, txt9, CDgenre, txt10);
		
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> inventoryStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		input.getChildren().add(buttons);
		input.setPadding(new Insets(0, 20, 20, 20));
		
		return input;
	}
	
	public static BorderPane user(Stage userStage) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("Find User");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(20);

		// prompt for details
		Label cardLabel = new Label("Enter Card No:");
		TextField txt1 = new TextField();

		center.getChildren().addAll(cardLabel, txt1);

		Button submit = new Button("Submit");
		submit.setMinSize(70, 30);
		submit.setOnAction(event -> {
			
			int cardNo = Integer.parseInt(txt1.getText());
			if (txt1.getText().isEmpty()){
				Text empty = new Text("Enter a valid card number.");
				center.getChildren().add(empty);
			} else {
				Stage detailStage = new Stage();
				detailStage.setTitle("User Details");
				Scene coScene = new Scene(userDetails(detailStage, cardNo), 600, 450);
				detailStage.setScene(coScene);
				detailStage.show();
				userStage.sizeToScene();
				
			}
		});
		
		// Creat button to exit program
		Button exit = new Button("Exit\n");
		exit.setMinSize(50, 30);
		exit.setOnAction(e -> userStage.close());

		HBox buttons = new HBox(100);

		buttons.getChildren().addAll(submit, exit);
		buttons.setAlignment(javafx.geometry.Pos.CENTER);

		center.getChildren().add(buttons);
		center.setPadding(new Insets(0, 20, 0, 20));

		pane.setCenter(center);
		return pane;
		
		
	}

	public static BorderPane userDetails(Stage detailStage, int cardNo) {
		BorderPane pane = new BorderPane();
		Label titleLabel = new Label("User Details");
		titleLabel.setStyle("-fx-font-size: 20; -fx-weight: bold;");

		// Center the label
		BorderPane.setAlignment(titleLabel, javafx.geometry.Pos.CENTER);
		pane.setTop(titleLabel);

		VBox center = new VBox(20);
		
		String q1 = "SELECT firstName, lastName, balance FROM user WHERE cardNo = " + cardNo;
		
		HBox userbox = new HBox(50);
		HBox cardnobox = new HBox(50);
		HBox finesbox = new HBox(50);
		
		Label userlbl = new Label("User");
		Label cardNolbl = new Label("Card No");
		Label fineslbl = new Label("Fines Due");
		
		try {
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(q1);
			
			while(rs.next()) {
			Text names = new Text(rs.getString("firstName") + " " + rs.getString("lastName"));
			Text cardNoVal = new Text(String.valueOf(cardNo));
			Text balance = new Text(String.valueOf(rs.getDouble("balance")));
			
			userbox.getChildren().addAll(userlbl, names);
			cardnobox.getChildren().addAll(cardNolbl, cardNoVal);
			finesbox.getChildren().addAll(fineslbl, balance);
			
			center.getChildren().addAll(userbox, cardnobox, finesbox);
			
			}
			Button history = new Button("Check Out History");
			history.setMinSize(50, 30);
			history.setOnAction(e -> {
				String hquery = "SELECT inventorytitles.title, checkOutHistory.checkOutDate, checkOutHistory.dateDue, checkOutHistory.returnDate FROM checkOutHistory JOIN inventorytitles ON checkOutHistory.inventoryID = inventorytitles.inventoryID WHERE cardNo = " + cardNo;
				
				Stage historyStage = new Stage();
				historyStage.setTitle("User History");
				Scene historyScene = new Scene(results(hquery, historyStage, "Check Out History", 1), 600, 450);
				historyStage.setScene(historyScene);
				historyStage.show();
			});
			
			Button current = new Button("Curent Holds and Check Outs");
			current.setMinSize(50, 30);
			current.setOnAction(e -> {
				String cquery1 = "";
				String cquery2 = "";
				
				Stage currentStage = new Stage();
				currentStage.setTitle("User History");
				BorderPane holds = results(cquery1, currentStage, "Holds", 2);
				BorderPane checkOuts = results(cquery2, currentStage, "Check Outs", 1);
				VBox cbox = new VBox(20);
				cbox.getChildren().addAll(holds, checkOuts);
				Scene currentScene = new Scene(cbox, 600, 450);
				currentStage.setScene(currentScene);
				currentStage.show();
			});

			HBox userbuttons = new HBox(100);

			userbuttons.getChildren().addAll(current, history);
			userbuttons.setAlignment(javafx.geometry.Pos.CENTER);
			center.getChildren().add(userbuttons);
			
			detailStage.sizeToScene();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		// Creat button to exit program
				Button exit = new Button("Exit\n");
				exit.setMinSize(50, 30);
				exit.setOnAction(e -> detailStage.close());

				HBox buttons = new HBox(100);

				buttons.getChildren().add(exit);
				buttons.setAlignment(javafx.geometry.Pos.CENTER);

				center.getChildren().add(buttons);
				center.setPadding(new Insets(0, 20, 0, 20));

				pane.setCenter(center);
				return pane;
	}
}
