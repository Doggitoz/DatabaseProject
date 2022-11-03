
import java.sql.*;
import java.io.*;
//test
class jdbcMySQL {
	public static void main(String[] args) {
		Connection conn = null;
		try {
			// db parameters
			String url = "jdbc:mysql://129.244.40.38:3306/userID";
			String user = "user54";
			String password = "TU2021-white-phone";
			// create a connection to the database
			// conn = DriverManager.getConnection(url, user, password);

			// Substitute your userId and your password in the following statement
			conn = DriverManager.getConnection(url, user, password);
			// more processing here
			Statement stmt = conn.createStatement(); // Create a Statement

			// Replace the following query text with the SQL query corresponding to the
			// query in the assignment
			String qry = "select * from comments";

			// All the records after executing "qry" are fetched a ResultSet rset.
			ResultSet rset = stmt.executeQuery(qry);

			ResultSetMetaData metadata = rset.getMetaData(); // get metadata from the ResultSet
			int columnCount = metadata.getColumnCount(); // get the number of columns from metadata
			for (int i = 1; i <= columnCount; i++) { // print out the column headers
				System.out.print(metadata.getColumnName(i) + " ");
			}
			System.out.println();

			int i = 0;
			while (rset.next()) { // Loop over each record
				String row = "";
				// TODO: add loop to collect each column information from the current record,
				// rset, into the variable row
				// rset.getString(i) to get the ith column information
				System.out.println(" " + row); // print out the accumulated current record
				i++;
			}
			System.out.println("\nNumber of records fetched: " + i + "\n");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				// System.out.println("Success");
				if (conn != null)
					conn.close();
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}

	}
}