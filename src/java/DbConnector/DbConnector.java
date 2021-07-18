
package DbConnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DbConnector {
  
//    public static void main(String args[]){
    public static Connection getConnection(){
       Connection conn=null;
        try {
            //loading driver
            System.out.println("enter............");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            //creating connection string
            System.out.println("start............");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/onlineExam","root","root");
            System.out.println("done..........");
            return conn;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbConnector.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DbConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return conn;
    }
    

          
}
