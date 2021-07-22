
package modal;

import DbConnector.DbConnector;
import been.QuizBeen;
import been.QuizMainBeen;
import been.StudentBeen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static modal.Quiz.conn;

public class Student {
    
    static Connection conn = DbConnector.getConnection();
    
    public static List getQuestion(String quizNo) {

        ArrayList list = new ArrayList();
        System.out.println(quizNo);
        String qTable = "Question_" + quizNo;
        
        try {
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM  "+ qTable );
            
            while (rs.next()) {
                QuizBeen qb = new QuizBeen();

                qb.setQuestion(rs.getString("question"));
                qb.setAnswer1(rs.getString("answer1"));
                qb.setAnswer2(rs.getString("answer2"));
                qb.setAnswer3(rs.getString("answer3"));
                qb.setAnswer4(rs.getString("answer4"));
                
                list.add(qb);
            }

        } catch (SQLException ex) {

        }

        return list;
    }
    
     public static StudentBeen getStudentDetails(String stuRegNo) {

        StudentBeen stu = new StudentBeen(); 
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from student where RegNo=?");
            stmt.setString(1, stuRegNo);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
                stu.setFirstName(rs.getString("firstName"));
                stu.setLastName(rs.getString("lastName"));
                stu.setDepartment(rs.getString("department"));
                stu.setLeval(rs.getInt("leval"));
            }
        } catch (SQLException ex) {
        }

        return stu;
    }
    
     public static List getAllQuiz(int leval) {

        ArrayList list = new ArrayList();
        System.out.println(leval);
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from quiz where leval=?");
            stmt.setInt(1, leval);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                QuizMainBeen qmb = new QuizMainBeen();

                qmb.setQuizNo(rs.getInt("quizNo"));
                qmb.setTeaRegNo(rs.getString("teaRegNo"));
                qmb.setSubject(rs.getString("subject"));
                qmb.setLeval(rs.getInt("leval"));
                qmb.setTimeMin(rs.getString("timeMin"));
                list.add(qmb);
            }

        } catch (SQLException ex) {
        }

        return list;
    }
     
     public static String getTeacher(String teaRegNo) {

         String teacherName = null;
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from teacher where regNo=?");
            stmt.setString(1, teaRegNo);
            ResultSet rs = stmt.executeQuery();

            if(rs.next()){
               teacherName = rs.getString("firstname") + " " + rs.getString("lastName");
            }
        } catch (SQLException ex) {
        }

        return teacherName;
    }
     
     public static List getAnswer(String quizNo) {

        ArrayList list = new ArrayList();
        String qTable = "Question_" + quizNo;
        
        try {
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM  "+ qTable );
            
            while (rs.next()) {
                QuizBeen qb = new QuizBeen();
                
                qb.setQuestion(rs.getString("question"));
                qb.setAnswer1(rs.getString("answer1"));
                qb.setAnswer2(rs.getString("answer2"));
                qb.setAnswer3(rs.getString("answer3"));
                qb.setAnswer4(rs.getString("answer4"));
                qb.setCheck1(rs.getBoolean("check1"));
                qb.setCheck2(rs.getBoolean("check2"));
                qb.setCheck3(rs.getBoolean("check3"));
                qb.setCheck4(rs.getBoolean("check4"));

                list.add(qb);
            }

        } catch (SQLException ex) {

        }

        return list;
    }
     
      public static void saveMarks(String quizNo, String stuRegNo, int marks ) {

          
          try {
              System.out.println(quizNo+",,,,,,,,,,,,,,,,,,,,,,,,,,,,");
              String aTable = "Answer_" + quizNo;
            Statement stmt = conn.createStatement();
                int saved = stmt.executeUpdate("INSERT INTO " + aTable + " values('"+stuRegNo + "'," + marks + ")");
                System.out.println(saved);
                System.out.println(quizNo+",,,,,,,,,,,,,,,,,,,,,,,,,,,,");
          } catch (SQLException e) {
          }  
    }
      
      public static String getQuizmark(String sRegNo, int qnumber) {

        String marks = null;

        try {
            String qTable = "Answer_" + qnumber;

            System.out.println(qTable);
            System.out.println(sRegNo);

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM " + qTable);

            while (rs.next()) {

                if (rs.getString("sturegno").equals(sRegNo)) {
                    marks = rs.getInt("marks") + "";

                }

            }
        } catch (SQLException ex) {
        }

        return marks;
    }
     
}
