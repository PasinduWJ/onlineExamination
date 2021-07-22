
package been;

import java.io.Serializable;

public class StudentBeen implements Serializable{
    
    private String regNo;
    private String firstName;
    private String lastName;
    private String password;
    private String department;
    private int leval;

    public StudentBeen() {
    }

    public StudentBeen(String regNo, String firstName, String lastName, String password, String department, int leval) {
        this.regNo = regNo;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.department = department;
        this.leval = leval;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getLeval() {
        return leval;
    }

    public void setLeval(int leval) {
        this.leval = leval;
    }
    
    

}
