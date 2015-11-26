/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Toshiba
 */
public class TakeTest {
    private String takeTestId = "";
    private Timestamp dateGiven;
    private String status = "";
    private String testId = "";
    private String patientId = "";
    private String doctorId = "";
    private String message = "";
    
    private Test test;
    private Patient patient;
    private Doctor doctor;

    public String getTakeTestId() {
        return takeTestId;
    }

    public void setTakeTestId(String takeTestId) {
        this.takeTestId = takeTestId;
    }

    public Timestamp getDateGiven() {
        return dateGiven;
    }

    public void setDateGiven(Timestamp dateGiven) {
        this.dateGiven = dateGiven;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }   
}
