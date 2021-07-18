
package modal;

import DbConnector.DbConnector;
import been.StudentBeen;
import been.TeacherBeen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LogIn {
    
//    public static void main(String[] args) {
//
//            Connection conn = DbConnector.getConnection();
//    }
//    public static void check(){
//        conn = DbConnector.getConnection();
//    }
    static Connection conn = DbConnector.getConnection();
    
    public static boolean logStudent(StudentBeen stu) {
        
        boolean bstate = false;
            try {
                System.out.println(stu.getPassword()+"------------------------------------------------------");
                PreparedStatement stmt = conn.prepareStatement("select * from student where regNo=? and password =?");
                stmt.setString(1, stu.getRegNo());
                stmt.setString(2, stu.getPassword());
                ResultSet rs = stmt.executeQuery();
                bstate = rs.next();
                System.out.println("logStudent...........................");
            } catch (SQLException e) {
                System.out.println(e);
            }
        return bstate;
    }
    
    
     public static boolean logTeacher(TeacherBeen stu) {

        boolean bstate = false;
        if(conn  != null){
            try {
                PreparedStatement stmt = conn.prepareStatement("select * from teacher where regNo=? and password = ?");
                stmt.setString(1, stu.getRegNo());
                stmt.setString(2, stu.getPassword());
                ResultSet rs = stmt.executeQuery();
                bstate = rs.next();
                System.out.println("logStudent...........................");
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return bstate;
    }


}
