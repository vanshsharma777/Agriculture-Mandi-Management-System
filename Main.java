
import java.sql.SQLException;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.JOptionPane;
import javax.swing.UnsupportedLookAndFeelException;

public class Main {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            try {
                UIManager.setLookAndFeel(
                        UIManager.getSystemLookAndFeelClassName()
                );
                
                Database.initializeDatabase();
                new LoginFrame().setVisible(true);
                
            } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException | UnsupportedLookAndFeelException e) {
                JOptionPane.showMessageDialog(
                        null,
                        "Error: " + e.getMessage(),
                        "Application Error",
                        JOptionPane.ERROR_MESSAGE
                );
            }
        });
    }
}
