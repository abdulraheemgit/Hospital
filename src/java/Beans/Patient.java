package Beans;

public class Patient {
    private String patientId = "";
    private String inPatientId = "";
    private String outPatientId = "";
    private String proId = "";
    
    private User patient;
    private User pro;

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getInPatientId() {
        return inPatientId;
    }

    public void setInPatientId(String inPatientId) {
        this.inPatientId = inPatientId;
    }

    public String getOutPatientId() {
        return outPatientId;
    }

    public void setOutPatientId(String outPatientId) {
        this.outPatientId = outPatientId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public User getPatient() {
        return patient;
    }

    public void setPatient(User patient) {
        this.patient = patient;
    }

    public User getPro() {
        return pro;
    }

    public void setPro(User pro) {
        this.pro = pro;
    }
    
    
    
}
