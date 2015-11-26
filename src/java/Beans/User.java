/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Toshiba
 */
public class User {

    private String userID = "";
    private String username = "";
    private String password = "";
    private String email = "";
    private String signUpDate = "";
    private String bday = "";
    private String validId = "";
    private String fName = "";
    private String lName = "";
    private String gender = "";
    private String address1 = "";
    private String address2 = "";
    private String address3 = "";
    private String contactNo = "";
    private String typeId = "";
    private String patientId = "";
    private String doctorId = "";
    private String nic = "";
    
    
    private String success = "";
    private String error = "";
    private String found = "";
    
    //foreign keys
    private UserType uType = null;
    private User patient = null;
    private User doctor = null;
    
    //for additional requirement
    private List<UserType> usertype = new ArrayList();
    private List<Contact> contacts = new ArrayList();
    private String doctorNote = "";
    private String specialization = "";
    private String specialDesc = "";

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }
   
    public String getFound() {
        return found;
    }

    public void setFound(String found) {
        this.found = found;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public List<UserType> getUsertype() {
        return usertype;
    }

    public void setUsertype(List<UserType> usertype) {
        this.usertype = usertype;
    }

    public String getSignUpDate() {
        return signUpDate;
    }

    public void setSignUpDate(String signUpDate) {
        this.signUpDate = signUpDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public User getPatient() {
        return patient;
    }

    public void setPatient(User patient) {
        this.patient = patient;
    }

    public User getDoctor() {
        return doctor;
    }

    public void setDoctor(User doctor) {
        this.doctor = doctor;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }

    public UserType getuType() {
        return uType;
    }

    public void setuType(UserType uType) {
        this.uType = uType;
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

    public String getValidId() {
        return validId;
    }

    public void setValidId(String validId) {
        this.validId = validId;
    }

    public String getBday() {
        return bday;
    }

    public void setBday(String bday) {
        this.bday = bday;
    }

    public String getNic() {
        return nic;
    }

    public String getDoctorNote() {
        return doctorNote;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setDoctorNote(String doctorNote) {
        this.doctorNote = doctorNote;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public void setSpecialDesc(String specialDesc) {
        this.specialDesc = specialDesc;
    }

    public String getSpecialDesc() {
        return specialDesc;
    }
    
}
