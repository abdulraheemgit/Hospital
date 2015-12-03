
package Beans;

public class Madication {
    private String madicationId="";
    private String patientId="";
    private String doctorId="";
    
    private String patientName="";    
    private String dateGiven = "";
    private String issuedDate = "";
    private String status = "";
    private String error = "";

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getDateGiven() {
        return dateGiven;
    }

    public void setDateGiven(String dateGiven) {
        this.dateGiven = dateGiven;
    }

    public String getIssuedDate() {
        return issuedDate;
    }

    public void setIssuedDate(String issuedDate) {
        this.issuedDate = issuedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    public String getMadicationId() {
        return madicationId;
    }

    public void setMadicationId(String madicationId) {
        this.madicationId = madicationId;
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
    
    
    
}
