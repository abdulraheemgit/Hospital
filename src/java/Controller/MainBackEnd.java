/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Comment;
import Beans.Contact;
import Beans.InPatient;
import Beans.Madication;
import Beans.Medicine;
import Beans.TakeTest;
import Beans.Test;
import Beans.User;
import Beans.Ward;
import Model.Admit;
import Model.DoctorFunctions;
import Model.Medicines;
import Model.NurseFunction;
import Model.PharmacistFunctions;
import Model.Tests;
import Model.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import static java.util.Collections.list;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Toshiba
 */
@WebServlet(name = "MainBackEnd", urlPatterns = {"/MainBackEnd"})
public class MainBackEnd extends HttpServlet {

    HttpSession session;
    HttpSession patient_session;
    User user = null;
    Users users = null;
    Medicine medicine = null;
    Medicines medicines = null;
    List<Medicine> listMedicines = null;
    List<Madication> listMedications = null;
    Test test = null;
    Tests tests = null;
    List<Test> listTests = null;
    String patient_fk = "";
    List<Contact> contacts=null;
    List<User> listUser=null;
    List<Ward> wardlist=null;
    List<InPatient> listInPatients=null;
    Admit admit=null;
    Ward ward=null;
    InPatient inpatient=null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        String action = request.getParameter("action");
        String page = null;

        if (action == null || session.equals(null)) {
            request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
            return;
        } else if (action.equals("fpassword")) {
            request.getRequestDispatcher("AdminPanel/forgotpassword.jsp").forward(request, response);
            return;
        } else {
            System.out.println("not empty");
            user = (User) session.getAttribute("user");
            if (action.equals("users")) {
                System.out.println("users");
                page = "AdminPanel/Users.jsp";

            }else if (action.equals("pharmacistsprofile")) {
                System.out.println("users");
                PharmacistFunctions pharmacists = new PharmacistFunctions();
                User pharmacist = new User();
                pharmacist = pharmacists.getUserByname(user);
                request.setAttribute("pharmacist", pharmacist);
                page = "AdminPanel/PharmacistsProfile.jsp";

            } else if (action.equals("doctorProfile")) {
                System.out.println("users");
                DoctorFunctions Doctor = new DoctorFunctions();
                User doctor = new User();
                doctor = Doctor.getUserByname(user);
                request.setAttribute("doctor", doctor);
                page = "Doctor/DoctorProfile.jsp";

            } else if (action.equals("phardash")) {
                page = "AdminPanel/Pharmacists.jsp";
            } else if (action.equals("admindash")) {
                page = "AdminPanel/Index.jsp";
            } else if (action.equals("Doctordash")) {
                page = "Doctor/Doctor.jsp";
            } else if (action.equals("pharmacistssettings")) {
                page = "AdminPanel/Pharmacistsetting.jsp";
            } else if (action.equals("nursedash")) {
                page = "AdminPanel/Nurse.jsp";
            } else if (action.equals("adminsettings")) {
                page = "AdminPanel/AdminSetting.jsp";
            } else if (action.equals("doctorSettings")) {
                request.setAttribute("doctor", user.getDoctorId());
                page = "Doctor/Doctorsetting.jsp";
            } else if (action.equals("requestReport")) {
                List<TakeTest> listtest = new ArrayList<>();
                DoctorFunctions df = new DoctorFunctions();
                listtest = df.getAllReport((String) patient_session.getAttribute("patientid"));
                Collections.reverse(listtest);
                request.setAttribute("listtest", listtest);
                page = "Doctor/RequestReport.jsp";
            }
            else if (action.equals("savemedications")) {
                DoctorFunctions df = new DoctorFunctions();
                medicines = new Medicines();
                listMedicines = new ArrayList<>();
                listMedicines = medicines.GetMedicines();
                if (!(listMedicines.isEmpty())) {
                    Madication medication = new Madication();
                    medication.setPatientId((String) patient_session.getAttribute("patientid"));
                    medication.setDoctorId(user.getDoctorId());
                    medicines.setMedicationId(medication);
                    int medicationId = medicines.getMedicationId();
                    System.out.println(medicationId);
                    for (Medicine medicine1 : listMedicines) {
                        String s = medicine1.getMedicine();
                        String s1 = medicine1.getDosage();
                        medicines.AddMedicineToMedication(medicationId, s, s1);
                    }
                    medicines.DeleteAllMedicine();
                }
                medicines = new Medicines();
                listMedicines = new ArrayList<>();
                List<Integer> medicationIds = new ArrayList<>();
                medicationIds = df.getMedicationId((String) patient_session.getAttribute("patientid"));
                for (Integer mediId : medicationIds) {
                    List<Medicine> listMedicines1 = new ArrayList<>();
                    listMedicines1 = df.GetMedicines(mediId);
                    listMedicines.addAll(listMedicines1);
                }
                Collections.reverse(listMedicines);
                request.setAttribute("medicines", listMedicines);
                page = "Doctor/Patientpage.jsp";
                
            } else if (action.equals("addcomment")) {
                String patientid = (String) patient_session.getAttribute("patientid");
                List<Comment> commentlist = new ArrayList<>();
                DoctorFunctions df = new DoctorFunctions();
                commentlist = df.getAllSentMessage(patientid);
                Collections.reverse(commentlist);
                request.setAttribute("commentlist", commentlist);
                page = "Doctor/Comments.jsp";
                
            } else if (action.equals("addmedications")) {
                page = "Doctor/Medicines.jsp";
                medicines = new Medicines();
                listMedicines = new ArrayList<>();
                listMedicines = medicines.GetMedicines();
                Collections.reverse(listMedicines);
                request.setAttribute("medicines", listMedicines);
            } else if (action.equals("mdeilist")) {
                PharmacistFunctions pf = new PharmacistFunctions();
                listMedications = new ArrayList<Madication>();
                listMedications = pf.getAllMedications();
                request.setAttribute("listMedications", listMedications);
                RequestDispatcher view = request.getRequestDispatcher("AdminPanel/PatientList.jsp");
                view.forward(request, response);
            } else if (action.equals("medicine")) {
                page = "AdminPanel/Medicines.jsp";
                medicines = new Medicines();
;                listMedicines = new ArrayList<>();
                listMedicines = medicines.GetMedicines();
                request.setAttribute("medicines", listMedicines);
            } else if (action.equals("test")) {
                page = "AdminPanel/Tests.jsp";
                tests = new Tests();
                listTests = new ArrayList<>();
                listTests = tests.GetTests();
                request.setAttribute("tests", listTests);
            } else if (action.equals("addreport")) {
                page = "AdminPanel/Reports.jsp";
            }if(action.equals("addreportdataa")){
                page = "AdminPanel/ChemicalPathology.jsp";
            }if(action.equals("addreportdata")){
                page = "AdminPanel/FullBloodCount.jsp";
            }else if (action.equals("admit")) {
                page = "AdminPanel/Nurseaddpatient.jsp";
                admit = new Admit();
                listInPatients = new ArrayList<>();
                listInPatients = admit.GetMedicines1();
                request.setAttribute("admit", listInPatients);
            }else if(action.equals("wardlist")){
                   NurseFunction pf = new NurseFunction();
                wardlist = new ArrayList<Ward>();
                wardlist = pf.getwardlist();
                request.setAttribute("wardlist", wardlist);
                RequestDispatcher view = request.getRequestDispatcher("AdminPanel/Nursewardlist.jsp");
                view.forward(request, response);
                }if(action.equals("logout")){
                session.invalidate();
                page = "AdminPanel/Index.jsp";
            }
            request.getRequestDispatcher(page).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();

        if (action != null) {
            if (action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                users = new Users();
                user = new User();
                user = users.checkLogin(username, password);
                if (!"1".equals(user.getFound())) {
                    System.out.println("Invalid username or password");
                    request.setAttribute("error", "Invalid username or password");
                    request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
                    return;
                }

                session.setAttribute("user", user);
                request.setAttribute("user", user);
                if (user.getTypeId().equals("1")) {
                    request.getRequestDispatcher("AdminPanel/Staff.jsp").forward(request, response);
                } else if (user.getTypeId().equals("2")) {
                    request.getRequestDispatcher("Doctor/Doctor.jsp").forward(request, response);
                } else if(user.getTypeId().equals("3")){
                    request.getRequestDispatcher("AdminPanel/Pharmacists.jsp").forward(request, response);
                }else if (user.getTypeId().equals("4")) {
                    request.getRequestDispatcher("AdminPanel/Patient.jsp").forward(request, response);
                }else if(user.getTypeId().equals("6")){
                    request.getRequestDispatcher("AdminPanel/Nurse.jsp").forward(request, response);
                } else {
                    System.out.println("user type not found");
                    request.setAttribute("error", "Incorect User Type");
                    request.getRequestDispatcher("AdminPanel/Staff.jsp").forward(request, response);
                }
            } else if(action.equals("forgot")){
                request.setAttribute("error", "There is a network error");
                request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
                return;
            } else if (action.equals("searchpatientbyDoctor")) {
                String patientId = request.getParameter("patientId");
                patient_session = request.getSession();
                DoctorFunctions df = new DoctorFunctions();
                listMedications = new ArrayList<Madication>();
                List<Madication> listMedications1 = new ArrayList<Madication>();
                if (df.checkPatientId(patientId) == true) {
                    patient_session.setAttribute("patientid", patientId);
                    medicines = new Medicines();
                    listMedicines = new ArrayList<>();
                    List<Integer> medicationIds = new ArrayList<>();
                    medicationIds = df.getMedicationId(patientId);
                    for (Integer mediId : medicationIds) {
                        List<Medicine> listMedicines1 = new ArrayList<>();
                        listMedicines1 = df.GetMedicines(mediId);
                        listMedicines.addAll(listMedicines1);
                    }
                    Collections.reverse(listMedicines);
                    request.setAttribute("medicines", listMedicines);
                    RequestDispatcher view = request.getRequestDispatcher("Doctor/Patientpage.jsp");
                    view.forward(request, response);
                    return;

                } else {
                    request.setAttribute("errorMessage", "Patient Does Not Exihists");
                    request.getRequestDispatcher("Doctor/Doctor.jsp").forward(request, response);
                    return;
                }

            }else if (action.equals("searchpatient")) {
                String patientId = request.getParameter("patientId");
                PharmacistFunctions pf = new PharmacistFunctions();
                listMedications = new ArrayList<Madication>();
                List<Madication> listMedications1 = new ArrayList<Madication>();
                if (pf.checkPatientId(patientId) == true) {

                    listMedications = pf.getUserMedications(patientId);
                    listMedications1 = pf.getMedicationsHistory(patientId);
                    if (listMedications.isEmpty()) {
                        System.out.println("Empty");
                    } else {
                        System.out.println("Not Empty");
                        System.out.println(listMedications.size());
                    }
                    request.setAttribute("listMedications", listMedications);
                    request.setAttribute("listMedications1", listMedications1);
                    RequestDispatcher view = request.getRequestDispatcher("AdminPanel/Medications.jsp");
                    view.forward(request, response);
                    return;
                } else {
                    request.setAttribute("errorMessage", "Patient Does Not Exists");
                    request.getRequestDispatcher("AdminPanel/Pharmacists.jsp").forward(request, response);
                    return;
                }

            } else if (action.equals("updatePharmacists")) {
                String email = request.getParameter("patientemail");
                String contactNo = request.getParameter("contactNo");
                String password = request.getParameter("password");
                String conformpassword = request.getParameter("conformpassword");

                PharmacistFunctions pf = new PharmacistFunctions();
                if (pf.emailValidation(email) == true) {

                    if (pf.passwordValidation(password, conformpassword) == true) {
                        System.out.println(user.getUsername());
                        if (pf.EditPharmacists(email, password, user.getUsername()) == true) {
                            request.setAttribute("updateSuccessMessage", "Succesfully Updated");
                            request.getRequestDispatcher("AdminPanel/Pharmacistsetting.jsp").forward(request, response);
                            return;
                        } else {
                            request.setAttribute("updateErrorMessage", "Can't Update Details. Try again");
                            request.getRequestDispatcher("AdminPanel/Pharmacistsetting.jsp").forward(request, response);
                            return;
                        }
                    } else {
                        request.setAttribute("passworderrorMessage", "Password Does Not Match");
                        request.getRequestDispatcher("AdminPanel/Pharmacistsetting.jsp").forward(request, response);
                        return;
                    }

                } else {
                    request.setAttribute("emailerrorMessage", "Incorrect Email Address");
                    request.getRequestDispatcher("AdminPanel/Pharmacistsetting.jsp").forward(request, response);
                    return;
                }
            } else if (action.equals("addmedicine")) {
                medicine = new Medicine();
                String json = null;
                listMedicines = new ArrayList<>();
                Medicine medicine1 = new Medicine();
                String name = request.getParameter("medicine");
                String dosage = request.getParameter("dosage");
                if (name.isEmpty() || dosage.isEmpty()) {
                    medicine.setError("Fields cannot be empty");
                } else {
                    medicine.setMedicine(name);
                    medicine.setDosage(dosage);
                    medicines = new Medicines();
                    medicine1 = medicines.AddMedicine(medicine);
                    if (medicine1.getSuccess().equals("1")) {
                        listMedicines = medicines.GetMedicines();
                    }
                    json = new Gson().toJson(listMedicines);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else if (action.equals("editmedicine")) {
                medicine = new Medicine();
                String json = null;
                listMedicines = new ArrayList<>();
                Medicine medicine1 = new Medicine();
                String medicineid = request.getParameter("medicineid");
                String name = request.getParameter("medicine");
                String dosage = request.getParameter("dosage");
                System.out.println(medicineid);
                System.out.println(name);
                System.out.println(dosage);
                if (name.isEmpty() || dosage.isEmpty()) {
                    medicine.setError("Fields cannot be empty");
                } else {
                    medicine.setMedicineId(medicineid);
                    medicine.setMedicine(name);
                    medicine.setDosage(dosage);
                    medicines = new Medicines();
                    medicine1 = medicines.EditMedicine(medicine);
                    if (medicine1.getSuccess().equals("1")) {
                        listMedicines = medicines.GetMedicines();
                    }
                    json = new Gson().toJson(listMedicines);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }else if (action.equals("deletemedicine")) {
                medicine = new Medicine();
                String json = null;
                String medicineid = "";
                listMedicines = new ArrayList<>();
                Medicine medicine1 = new Medicine();
                medicineid = request.getParameter("medicineid");
                System.out.println(medicineid);
                if (medicineid.isEmpty()) {
                    medicine.setError("invalid medicine ID");
                } else {
                    medicine.setMedicineId(medicineid);
                    medicines = new Medicines();
                    medicine1 = medicines.DeleteMedicine(medicine);
                    if (medicine1.getSuccess().equals("1")) {
                        listMedicines = medicines.GetMedicines();
                    }
                    json = new Gson().toJson(listMedicines);
                }
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }else if (action.equals("issuemedicine")) {
                Madication medication = new Madication();
                String json = null;
                int medicationid;
                String patientid = "";
                listMedications = new ArrayList<>();
                PharmacistFunctions pf = new PharmacistFunctions();
                medicationid = Integer.parseInt(request.getParameter("medicineid"));
                patientid = request.getParameter("patientid");
                pf.EditMedication(medicationid);
                listMedications = pf.getUserMedications(patientid);
                json = new Gson().toJson(listMedications);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else if (action.equals("history")) {
                List<Madication> listMedications1 = new ArrayList<>();
                Madication medication = new Madication();
                String json = null;
                String patientid = "";
                PharmacistFunctions pf = new PharmacistFunctions();
                patientid = request.getParameter("patientid");
                listMedications1 = pf.getMedicationsHistory(patientid);
                json = new Gson().toJson(listMedications1);
                response.setContentType("application1/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }else if (action.equals("addtest")) {
                test = new Test();
                String json = null;
                listTests = new ArrayList<>();
                Test test1 = new Test();
                String name = request.getParameter("test");
                if (name.isEmpty()) {
                    test.setError("Fields cannot be empty");
                } else {
                    test.setTestName(name);
                    tests = new Tests();
                    test1 = tests.AddTest(test);
                    if (test1.getSuccess().equals("1")) {
                        listTests = tests.GetTests();
                    }
                    json = new Gson().toJson(listTests);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
//                
            } else if (action.equals("edittest")) {
                test = new Test();
                String json = null;
                listTests = new ArrayList<>();
                Test test1 = new Test();
                String testid = request.getParameter("testid");
                String name = request.getParameter("test");
                System.out.println(testid);
                System.out.println(name);
                if (name.isEmpty()) {
                    test.setError("Fields cannot be empty");
                } else {
                    test.setTestId(testid);
                    test.setTestName(name);
                    tests = new Tests();
                    test1 = tests.EditTest(test);
                    if (test1.getSuccess().equals("1")) {
                        listTests = tests.GetTests();
                    }
                    json = new Gson().toJson(listTests);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }else if (action.equals("sendMessage")) {
                Comment comment = new Comment();
                String json = null;
                List<Comment> commentlist = new ArrayList<>();
                DoctorFunctions df = new DoctorFunctions();
                String subject = request.getParameter("subject");
                String message = request.getParameter("message");
                String patientid = (String) patient_session.getAttribute("patientid");
                System.out.println(patientid);
                String doctorid = user.getDoctorId();
                System.out.println(doctorid);
                comment.setPatientid_fk(patientid);
                comment.setDoctorid_fk(doctorid);
                comment.setSubject(subject);
                comment.setMessage(message);
                if(df.sendMessage(comment)){
                    System.out.println("Correct");
                }
                else{
                    System.out.println("Wrong");
                }
                commentlist = df.getAllSentMessage(patientid);
                Collections.reverse(commentlist);
                json = new Gson().toJson(commentlist);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                request.setAttribute("successMessage", "Send Comment Succesfully");
                request.setAttribute("commentlist", commentlist);
                request.getRequestDispatcher("Doctor/Comments.jsp").forward(request, response);
            }
            else if (action.equals("requestTestReport")) {
                List<TakeTest> listtest = new ArrayList<>();
                TakeTest takeTest = new TakeTest();
                
                String json = null;
                String patientid = (String) patient_session.getAttribute("patientid");
                String doctorid = user.getDoctorId();
                String reportType = request.getParameter("ReportType");
                String reportStatus = request.getParameter("Reportstatus");
                String message = request.getParameter("message");
                takeTest.setDoctorId(doctorid);
                takeTest.setPatientId(patientid);
                takeTest.setStatus(reportStatus);
                takeTest.setMessage(message);
                takeTest.setTestId(reportType);
                DoctorFunctions df = new DoctorFunctions();
                df.requestReport(takeTest);
                
                listtest = df.getAllReport(patientid);
                Collections.reverse(listtest);
                request.setAttribute("listtest", listtest);
                request.getRequestDispatcher("Doctor/RequestReport.jsp").forward(request, response);
            }
            else if (action.equals("deletetest")) {
                test = new Test();
                String json = null;
                String testid = "";
                listTests = new ArrayList<>();
                Test test1 = new Test();
                testid = request.getParameter("testid");
                System.out.println(testid);
                if (testid.isEmpty()) {
                    test.setError("invalid test ID");
                } else {
                    test.setTestId(testid);
                    tests = new Tests();
                    test1 = tests.DeleteTest(test);
                    if (test1.getSuccess().equals("1")) {
                        listTests = tests.GetTests();
                    }
                    json = new Gson().toJson(listTests);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
            else if(action.equals("registerUser")){
                int valid=0;
                    User newUser =new User();
                    Users addUser=new Users();
                   List<Contact> contacts = new ArrayList<>();
                   Contact phoneNo1 =new Contact();
                   Contact phoneNo2=new Contact();
                  //  contacts= new ArrayList<>();  get parameter from form
                        String fname = request.getParameter("fname");
                        String lname = request.getParameter("lname");
			//String userId = request.getParameter("userId");
                        String userName = request.getParameter("userName");
                        String validId = request.getParameter("validId");
			String usertype = request.getParameter("usertype");
                        String bday = request.getParameter("bday");
			String gender = request.getParameter("gender");
			String addr1 = request.getParameter("addr1");
                        String addr2 = request.getParameter("addr2");
                        String addr3 = request.getParameter("addr3");
			String email = request.getParameter("email");
			String phone1 = request.getParameter("phone1");
                        String phone2 = request.getParameter("phone2");
                        
             //   if (fname.isEmpty()|| lname.isEmpty() || userName.isEmpty()|| validId.isEmpty()|| usertype.isEmpty()||bday.isEmpty()||gender.isEmpty()||addr1.isEmpty()||phone1.isEmpty()) {
                    //newUser.setError("Fields cannot be empty");
                    if(fname.isEmpty()){
                        valid++;
                        request.setAttribute("errorfname", "First name can not be empty ");
                         request.setAttribute("errorRegi", "Try Again ");
                    }else if(addUser.isNumeric(fname)){
                        valid++;
                        request.setAttribute("errorfname", "First name can not be Number ");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(lname.isEmpty()){
                        valid++;
                        request.setAttribute("errorlname", "Last name can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    else if(addUser.isNumeric(lname)){
                        valid++;
                        request.setAttribute("errorlname", "Last name can not be Number ");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(userName.isEmpty()){
                        valid++;
                        request.setAttribute("errorUserName", "User name can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(validId.isEmpty()){
                        valid++;
                        request.setAttribute("errorNIC", "NIC can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }else if(!validId.endsWith("V")&&validId.length()==10){
                        valid++;
                         request.setAttribute("errorNIC", "Incorrect NIC Number");
                          request.setAttribute("errorRegi", "Try Again ");
                        
                    }
                    if(usertype.isEmpty()){
                        valid++;
                        request.setAttribute("errorUType", "User Type can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(bday.isEmpty()){
                        valid++;
                        request.setAttribute("errorBirthday", "Birthday can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(gender.isEmpty()){
                        valid++;
                        request.setAttribute("errorGender", "Gender can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(addr1.isEmpty()){
                        valid++;
                        request.setAttribute("errorAddress", "Address can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                    if(phone1.isEmpty()){
                        valid++;
                        request.setAttribute("errorContactNo", "Phone Number can not be empty");
                         request.setAttribute("errorRegi", "Try Again ");
                    }else if(!addUser.isNumeric(phone1)&&phone1.length()<10){
                        valid++;
                        request.setAttribute("errorContactNo", "Incorrect Phone Number ");
                         request.setAttribute("errorRegi", "Try Again ");
                    }else if(!addUser.isNumeric(phone2)&&!phone2.isEmpty()&&phone2.length()<10){
                         valid++;
                        request.setAttribute("errorContactNo", "Incorrect Phone Number  ");
                         request.setAttribute("errorRegi", "Try Again ");
                    }
                     
                    
              //  } else
           if(valid==0) {
                         newUser.setfName(fname);//set user details to user bean
                         newUser.setlName(lname);
                         newUser.setUsername(userName);
                         newUser.setValidId(validId);
                         newUser.setTypeId(usertype);//wait 
                         newUser.setBday(bday);
                         newUser.setGender(gender);
                         newUser.setAddress1(addr1);
                         newUser.setAddress2(addr2);
                         newUser.setAddress3(addr3);
                         newUser.setEmail(email);
                         
                         phoneNo1.setContactNo(phone1);
                         phoneNo2.setContactNo(phone2);
                       
                         //contacts.add(phoneNo1);
                         contacts.add(phoneNo1);
                         contacts.add(phoneNo2);
                         //contacts.add(1, phoneNo2);
                         
                                 //contacts=phoneNo.setContactNo(phone1);
                    /*     if(!phone1.isEmpty()&&!phone2.isEmpty()){//for insert contact details
                             phoneNo1.setContactNo(phone1);
                             phoneNo2.setContactNo(phone2);
                         }else if(!phone1.isEmpty()){
                             phoneNo1.setContactNo(phone1);
                         }else if(!phone2.isEmpty()){
                             phoneNo2.setContactNo(phone2);
                         }*/
                         try{
                         newUser.setContacts(contacts);
                          request.setAttribute("errorRegi", "Sucessfuly Inserted");
                         }catch(Exception e){
                          request.setAttribute("errorRegi", "Try Again ");
                         
                         
                         }
                         
                          addUser.registerUser(newUser);
                           request.getRequestDispatcher("AdminPanel/Users.jsp").forward(request, response);
                         
                         }
           request.getRequestDispatcher("AdminPanel/Users.jsp").forward(request, response);//remove this
			//String password = request.getParameter("password");
                        
		
                        //User user = new User(userName,email,fname,lname,validId,gender,bday,addr1,addr2,addr3,usertype,phone1);//userType not a String and phone are not a String
              
            }
        }else if(action.equals("viewUser")){// view User 
               // request.setAttribute("errorRegi", "");
             /*mekai1111111111   String userId = request.getParameter("userId");
                User user =new User();
                User userDetails=new User();
                Users viewUser=new Users();*/
                User user =new User();
                String json = null;
                listUser = new ArrayList<>();
                User user1=new User();
                Users users=new Users();
                
              //  listUser=users.viewUser();
                json = new Gson().toJson(listUser);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);             
             /*mekai22222222222   user.setUserID(userId);
                userDetails=viewUser.viewUser(user);
                request.setAttribute("fname", userDetails.getfName());
                //request.setAttribute("example", "example wada");
                request.setAttribute("lname", userDetails.getlName());
                request.setAttribute("email", userDetails.getEmail());
                request.setAttribute("gender", userDetails.getGender());
                request.setAttribute("add1", userDetails.getAddress1());
                request.setAttribute("add2", userDetails.getAddress2());
                request.setAttribute("add3", userDetails.getAddress3());
                request.setAttribute("userid", userDetails.getUserID());
                request.setAttribute("validId", userDetails.getValidId());
                request.setAttribute("username", userDetails.getUsername());
                request.setAttribute("gender", userDetails.getGender());
                request.setAttribute("signupdate", userDetails.getSignUpDate());
                request.setAttribute("bday", userDetails.getBday());*/
                request.getRequestDispatcher("AdminPanel/Users.jsp").forward(request, response);
            }else if(action.equals("removeUser")){
                user = new User();
                String json = null;
                String deluserId = "";
                listUser = new ArrayList<>();
                User delUser = new User();
                deluserId = request.getParameter("deluserId");
                
                if (deluserId.isEmpty()) {
                    user.setError("invalid User ID");
                } else {
                    user.setUserID(deluserId);
                    users = new Users();
                    delUser = users.removeUser(user);
                    if (delUser.getSuccess().equals("1")) {
                       // listUser = users.viewUser();//view 1k karanna thiyanawa
                    }
                    json = new Gson().toJson(listUser);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            
            }else if (action.equals("updateNurse")) {
                String email = request.getParameter("patientemail");
                String contactNo = request.getParameter("contactNo");
                String password = request.getParameter("password");
                String conformpassword = request.getParameter("conformpassword");

                NurseFunction pf = new NurseFunction();
                if (pf.emailValidation(email) == true) {

                    if (pf.passwordValidation(password, conformpassword) == true) {
                        System.out.println(user.getUsername());
                        if (pf.EditNurse(email, password, user.getUsername()) == true) {
                            request.setAttribute("updateSuccessMessage", "Succesfully Updated");
                            request.getRequestDispatcher("AdminPanel/Nursesetting.jsp").forward(request, response);
                            return;
                        } else {
                            request.setAttribute("updateErrorMessage", "Can't Update Details. Try again");
                            request.getRequestDispatcher("AdminPanel/Nursesetting.jsp").forward(request, response);
                            return;
                        }
                    } else {
                        request.setAttribute("passworderrorMessage", "Password Does Not Match");
                        request.getRequestDispatcher("AdminPanel/Nursesetting.jsp").forward(request, response);
                        return;
                    }

                } else {
                    request.setAttribute("emailerrorMessage", "Incorrect Email Address");
                    request.getRequestDispatcher("AdminPanel/Nursesetting.jsp").forward(request, response);
                    return;
                }
            } else if (action.equals("nursesearchpatient")) {
                String patientId = request.getParameter("patientId");
                NurseFunction pf = new NurseFunction();
                listMedications = new ArrayList<Madication>();
                List<Madication> listMedications1 = new ArrayList<Madication>();
                if (pf.checkPatientId(patientId) == true) {

                    listMedications = pf.getUserMedications(patientId);
                    listMedications1 = pf.getMedicationsHistory(patientId);
                    if (listMedications.isEmpty()) {
                        System.out.println("Empty");
                    } else {
                        System.out.println("Not Empty");
                        System.out.println(listMedications.size());
                    }
                    request.setAttribute("listMedications", listMedications);
                    request.setAttribute("listMedications1", listMedications1);
                    RequestDispatcher view = request.getRequestDispatcher("AdminPanel/Medications.jsp");
                    view.forward(request, response);
                    return;
                } else {
                    request.setAttribute("errorMessage", "Patient Does Not Exists");
                    request.getRequestDispatcher("AdminPanel/Nurse.jsp").forward(request, response);
                    return;
                }

            }else if (action.equals("addinpatient")) {
                inpatient = new InPatient();
                String json = null;
                listInPatients = new ArrayList<>();
                InPatient medicine1 = new InPatient();
                String name = request.getParameter("patientId");
                String dosage = request.getParameter("dateAdmitted");
                if (name.isEmpty() || dosage.isEmpty()) {
                    inpatient.setError("Fields cannot be empty");
                } else {
                    inpatient.setPatientId(name);
                    inpatient.setDateAdmitted(dosage);
                    admit = new Admit();
                    medicine1 = admit.AddMedicine(inpatient);
                    if (medicine1.getSuccess().equals("1")) {
                        listInPatients = admit.GetMedicines1();
                    }
                    json = new Gson().toJson(listInPatients);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else {
            request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
