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
public class Test {
    private String testId = "";
    private String testName = "";
    private String success = "";
    private String error = "";
    
    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public String getSuccess() {
        return success;
    }

    public String getError() {
        return error;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
