
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

public class Database {

    private static final String URL =
        "jdbc:mysql://localhost:3306/mandi_management?useSSL=false&serverTimezone=UTC";

    private static final String USER = "root";

    // Yahan apna MySQL password likho
    private static final String PASSWORD = "Root@123";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void initializeDatabase() throws SQLException {

        try (Connection con = getConnection();
             Statement st = con.createStatement()) {

            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS farmers (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "farmer_name VARCHAR(100) NOT NULL, " +
                "phone VARCHAR(20), " +
                "address VARCHAR(200))"
            );

            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS traders (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "trader_name VARCHAR(100) NOT NULL, " +
                "phone VARCHAR(20), " +
                "address VARCHAR(200))"
            );

            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS commodities (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "commodity_name VARCHAR(100) NOT NULL, " +
                "unit VARCHAR(30) NOT NULL, " +
                "description VARCHAR(200))"
            );

            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS daily_prices (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "commodity_id INT NOT NULL, " +
                "price_date DATE NOT NULL, " +
                "min_price DOUBLE NOT NULL, " +
                "max_price DOUBLE NOT NULL, " +
                "modal_price DOUBLE NOT NULL, " +
                "FOREIGN KEY (commodity_id) " +
                "REFERENCES commodities(id))"
            );

            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS transactions (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "farmer_id INT NOT NULL, " +
                "trader_id INT NOT NULL, " +
                "commodity_id INT NOT NULL, " +
                "quantity DOUBLE NOT NULL, " +
                "price DOUBLE NOT NULL, " +
                "transaction_date DATE NOT NULL, " +
                "FOREIGN KEY (farmer_id) REFERENCES farmers(id), " +
                "FOREIGN KEY (trader_id) REFERENCES traders(id), " +
                "FOREIGN KEY (commodity_id) REFERENCES commodities(id))"
            );
        }
    }
}
