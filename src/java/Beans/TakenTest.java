/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

/**
 *
 * @author Toshiba
 */
public class TakenTest {
    private String takenTestId = "";
    private String dateTaken = "";
//    private File report = "";
    private Test test = new Test();
    private User user = new User();

    public String getTakenTestId() {
        return takenTestId;
    }

    public void setTakenTestId(String takenTestId) {
        this.takenTestId = takenTestId;
    }

    public String getDateTaken() {
        return dateTaken;
    }

    public void setDateTaken(String dateTaken) {
        this.dateTaken = dateTaken;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    
}
