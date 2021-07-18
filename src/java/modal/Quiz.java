package modal;

import DbConnector.DbConnector;
import been.AnswerBeen;
import been.QuizBeen;
import been.QuizMainBeen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Quiz {

    static Connection conn = DbConnector.getConnection();

    public static boolean saveQuestion(QuizMainBeen qMain, ArrayList arr) {

        boolean isSendDb = false;

        try {
            int quizNo;
            try (PreparedStatement stmt1 = conn.prepareStatement("select quizNo from quiz")) {
               quizNo = 1;
               try {
                   ResultSet rs = stmt1.executeQuery();
                   while(rs.next()){
                       if(quizNo == rs.getInt("quizNo")){
                           quizNo++;
                       }else{
                           break;
                       }
                       System.out.println(quizNo);
                        
                    
                }
               }
               catch(SQLException e){
                   
               }
               System.out.println(quizNo);
                
            }

            try (PreparedStatement stmt2 = conn.prepareStatement("INSERT INTO QUIZ(QUIZNO,TEAREGNO, SUBJECT, LEVAL, TIMEMIN) VALUES (?, ?, ?, ?, ?)")) {
                stmt2.setInt(1, quizNo);
                stmt2.setString(2, qMain.getTeaRegNo());
                stmt2.setString(3, qMain.getSubject());
                stmt2.setInt(4, qMain.getLeval());
                stmt2.setString(5, qMain.getTimeMin());
                int rs2 = stmt2.executeUpdate();
            }

//create Quiz table
            String qTable = "Question_" + quizNo;
            System.out.println(qTable);

            
            
            try (Statement stmt3 = conn.createStatement()) {
                stmt3.execute("CREATE TABLE " + qTable + "(question varchar(255),"
                        + " answer1 varchar(255),answer2 varchar(255),answer3 varchar(255),answer4 varchar(255),"
                        + "check1 boolean,check2 boolean,check3 boolean,check4 boolean)");
            }
            
//create Answer table
            String aTable = "Answer_" + quizNo;
            System.out.println(aTable);

            try (Statement stmt6 = conn.createStatement()) {
                stmt6.execute("CREATE TABLE " + aTable + "(stuRegNo varchar(50), marks Integer)");
            }
            Iterator it = arr.iterator();

            while (it.hasNext()) {

                QuizBeen queBeen = (QuizBeen) it.next();
                try (Statement stmt4 = conn.createStatement()) {

                    int comp = stmt4.executeUpdate("INSERT INTO " + qTable + " VALUES ('" + queBeen.getQuestion()
                            + "','" + queBeen.getAnswer1() + "','" + queBeen.getAnswer2() + "','" + queBeen.getAnswer3()
                            + "','" + queBeen.getAnswer4() + "'," + queBeen.isCheck1() + "," + queBeen.isCheck2() + ""
                            + "," + queBeen.isCheck3() + "," + queBeen.isCheck4() + ")");

                    if (comp > 0) {
                        isSendDb = true;
                    }
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return isSendDb;
    }

    public static List getAllQuiz(String teaRegNo) {

        ArrayList list = new ArrayList();
        System.out.println(teaRegNo);
        try (PreparedStatement stmt5 = conn.prepareStatement("select * from quiz where teaRegNo=?")) {
            stmt5.setString(1, teaRegNo);
            ResultSet rs = stmt5.executeQuery();

            while (rs.next()) {

                QuizMainBeen qmb = new QuizMainBeen();

                qmb.setQuizNo(rs.getInt("quizNo"));
                qmb.setSubject(rs.getString("subject"));
                qmb.setLeval(rs.getInt("leval"));
                qmb.setTimeMin(rs.getString("timeMin"));
                list.add(qmb);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static boolean removeQuiz(int quizNo) {

        boolean allDone = false;
        int rs;
        int rs2;
        int rs3;
        try (PreparedStatement stmt7 = conn.prepareStatement("Delete from quiz where quizNo=?")) {
            stmt7.setInt(1, quizNo);
            rs = stmt7.executeUpdate();

            String qTable = "Question_" + quizNo;
            try (Statement stmt8 = conn.createStatement()) {
                rs2 = stmt8.executeUpdate("DROP TABLE " + qTable);
                System.out.println(rs2);
            }
            String aTable = "ANSWER_" + quizNo;
            try (Statement stmt9 = conn.createStatement()) {
                rs3 = stmt9.executeUpdate("DROP TABLE " + aTable + "");
            }

            if (rs > 0 && rs2 == 0 && rs3 == 0) {
                allDone = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }

        return allDone;
    }
    
    public static List getMarks(String quizNo){
        
        ArrayList list = new ArrayList();
        
        System.out.println(quizNo);
        
        
        try {
            String aTable = "ANSWER_" + quizNo;
           
            Statement stmt12 = conn.createStatement();

            ResultSet rs = stmt12.executeQuery("SELECT * FROM  "+ aTable );
            while (rs.next()) {

                AnswerBeen ans = new AnswerBeen();
                ans.setStuRegNo(rs.getString("stuRegNo"));
                ans.setMarks(rs.getInt("marks"));
                list.add(ans);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    
     public static String getStuName(String stuRegNo) {
          System.out.println("//////////////////");
        String stuName = null;
     
            try {
                
                Statement stmt11 = conn.createStatement();
                ResultSet rs = stmt11.executeQuery("select firstName from student where regNo = '"+ stuRegNo+"'");

                if(rs.next()){
                    stuName = rs.getString("firstName");
                    System.out.println(stuName);
                }
                
            } catch (SQLException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }
            return stuName;
     }
                    
}
