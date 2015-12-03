
package Beans;

public class Ward {
    private String wardId="";
    private String wardName="";
    private String floor = "";
    private String wardStatus = "";
    private String patientId="";
    private String error = "";

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    public String getWardStatus() {
        return wardStatus;
    }

    public void setWardStatus(String wardStatus) {
        this.wardStatus = wardStatus;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }
        
    public String getWardId() {
        return wardId;
    }

    public void setWardId(String wardId) {
        this.wardId = wardId;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }
    
    
    
}
