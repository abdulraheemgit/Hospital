
package Beans;

public class DoctorTime {
    private String doctorId;
    private String timeFrom;
    private String timeTo;
    private String day;
    private String dayId;
    private String date;
    private String status;
    private String appointments;
    private User doctor;
    private String nextSession;

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(String timeFrom) {
        this.timeFrom = timeFrom;
    }

    public String getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(String timeTo) {
        this.timeTo = timeTo;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public User getDoctor() {
        return doctor;
    }

    public void setDoctor(User doctor) {
        this.doctor = doctor;
    }

    public String getDayId() {
        return dayId;
    }

    public String getDate() {
        return date;
    }

    public String getStatus() {
        return status;
    }

    public String getAppointments() {
        return appointments;
    }

    public void setDayId(String dayId) {
        this.dayId = dayId;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAppointments(String appointments) {
        this.appointments = appointments;
    }

    public String getNextSession() {
        return nextSession;
    }

    public void setNextSession(String nextSession) {
        this.nextSession = nextSession;
    }
    
    
    
}
