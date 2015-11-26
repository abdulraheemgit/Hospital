
package Beans;

public class Ward {
    private String wardId="";
    private String wardName="";
    private String floor = "";
    private String wardstatus="";
    private String patientid="";
    private String error = "";
    
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

    public String getWardstatus() {
        return wardstatus;
    }

    public String getPatientid() {
        return patientid;
    }

    public void setWardstatus(String wardstatus) {
        this.wardstatus = wardstatus;
    }

    public void setPatientid(String patientid) {
        this.patientid = patientid;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
