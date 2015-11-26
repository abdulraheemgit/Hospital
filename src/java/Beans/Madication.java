
package Beans;

public class Madication {
    private String madicationId="";
    private String patientId="";
    private String doctorId="";
    private String dateGiven;
    private String issuedDate;
    private String status;
    private String error = "";

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

    public String getDateGiven() {
        return dateGiven;
    }

    public String getIssuedDate() {
        return issuedDate;
    }

    public String getStatus() {
        return status;
    }

    public String getError() {
        return error;
    }

    public void setDateGiven(String dateGiven) {
        this.dateGiven = dateGiven;
    }

    public void setIssuedDate(String issuedDate) {
        this.issuedDate = issuedDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setError(String error) {
        this.error = error;
    }
}
