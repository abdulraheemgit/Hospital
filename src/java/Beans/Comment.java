package Beans;

import java.sql.Timestamp;


public class Comment {
    private String patientid_fk = "";
    private String doctorid_fk = "";
    private Timestamp dateAndTime;
    private String subject = "";
    private String message = "";

    public String getPatientid_fk() {
        return patientid_fk;
    }

    public void setPatientid_fk(String patientid_fk) {
        this.patientid_fk = patientid_fk;
    }

    public String getDoctorid_fk() {
        return doctorid_fk;
    }

    public void setDoctorid_fk(String doctorid_fk) {
        this.doctorid_fk = doctorid_fk;
    }

    public Timestamp getDateAndTime() {
        return dateAndTime;
    }

    public void setDateAndTime(Timestamp dateAndTime) {
        this.dateAndTime = dateAndTime;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    
}
