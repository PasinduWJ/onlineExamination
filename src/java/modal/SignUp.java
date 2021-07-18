
package modal;

import DbConnector.DbConnector;
import been.StudentBeen;
import been.TeacherBeen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignUp {

    static Connection conn = DbConnector.getConnection();

    public static boolean signUpStudent(StudentBeen stu) {

        boolean bstate = false;
        if (conn != null) {
            try {
                PreparedStatement stmt = conn.prepareStatement("INSERT INTO "
                        + "student (regNo, firstName, lastName, password, department, leval) "
                        + "VALUES (?, ?, ?, ?,?, ?)");

                stmt.setString(1, stu.getRegNo());
                stmt.setString(2, stu.getFirstName());
                stmt.setString(3, stu.getLastName());
                stmt.setString(4, stu.getPassword());
                stmt.setString(5, stu.getDepartment());
                stmt.setString(6, stu.getLevel());
System.out.println("in........................");
                int result = stmt.executeUpdate();
                
                System.out.println(stu.getRegNo()+"out........................");
                if (result > 0) {
                    bstate = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bstate;
    }
    
    public static boolean signUpTeacher(TeacherBeen tea) {

        boolean bstate = false;
        if (conn != null) {
            try {
               PreparedStatement stmt = conn.prepareStatement("INSERT INTO "
                        + "teacher (regNo, firstName, lastName, password, subject) "
                        + "VALUES (?, ?, ?, ?,?)");

                stmt.setString(1, tea.getRegNo());
                stmt.setString(2, tea.getFirstName());
                stmt.setString(3, tea.getLastName());
                stmt.setString(4, tea.getPassword());
                stmt.setString(5, tea.getSubject());

                int result = stmt.executeUpdate();
                if (result > 0) {
                    bstate = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bstate;
    }
    
    public static boolean signUpValidateStudent(StudentBeen stu) {

        boolean bstate = false;
        if (conn != null) {
            System.out.println("validate enter....................");
            try {
                PreparedStatement stmt = conn.prepareStatement("select regNo from student where regNo=?");
 
                stmt.setString(1, stu.getRegNo());
                ResultSet rs = stmt.executeQuery();
                System.out.println(stu.getRegNo()+"validate out..................");
                bstate = rs.next();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bstate;
    }
    
    public static boolean signUpValidateTeacher(TeacherBeen tea) {

        boolean bstate = false;
        if (conn != null) {
            try {
                PreparedStatement stmt = conn.prepareStatement("select regNo from teacher where regNo=?");

                stmt.setString(1, tea.getRegNo());
                ResultSet rs = stmt.executeQuery();
                bstate = rs.next();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bstate;
    }

}
