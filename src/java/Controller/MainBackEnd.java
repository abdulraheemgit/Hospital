/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Doctor;
import Beans.Medicine;
import Beans.Specialization;
import Beans.User;
import Beans.UserType;
import Model.EChannelings;
import Model.Medicines;
import Model.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
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
    User user = null;
    Users users = null;
    Medicine medicine = null;
    Medicines medicines = null;
    List<Medicine> listMedicines = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        session.setMaxInactiveInterval(20*60);
        String action = request.getParameter("action");
        String page = null;
        //AR
        if (action == null || session.getAttribute("user") == null) {
            request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
        } else {
            System.out.println("not empty"+session.getMaxInactiveInterval());
            user = (User) session.getAttribute("user");
            if (action.equals("users")) {
                List<UserType> typeCount = new ArrayList();
                List<Specialization> s = new ArrayList();
                EChannelings ec = new EChannelings();
                Users u = new Users();
                typeCount = u.UserTypeCount();
                s = ec.getSpecialization();
                int lastID = u.GetLastUserId();
                
                request.setAttribute("specializations", s);
                request.setAttribute("lastid", lastID);
                request.setAttribute("types", typeCount);
                System.out.println("users");
                page = "AdminPanel/User.jsp";

            } else if (action.equals("medicine")) {
                page = "AdminPanel/Medicines.jsp";
                medicines = new Medicines();
                listMedicines = new ArrayList<>();
                listMedicines = medicines.GetMedicines();
                request.setAttribute("medicines", listMedicines);
            } else if (action.equals("addreport")) {
                page = "AdminPanel/Reports.jsp";
                
//                medicines = new Medicines();
//                listMedicines = new ArrayList<>();
//                listMedicines = medicines.GetMedicines();
//                request.setAttribute("medicines", listMedicines);
            }if(action.equals("logout")){
                session.invalidate();
                page = "AdminPanel/Index.jsp";
//                response.sendRedirect("Index.jsp");
            }
            //end AR
            request.setAttribute("user", (User)session.getAttribute("user"));
            request.getRequestDispatcher(page).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        session.setMaxInactiveInterval(20*60);
        String action = request.getParameter("action");
        String page = "AdminPanel/Index.jsp";
        PrintWriter out = response.getWriter();
        //AR
        if (action == null) {
            request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
        }
        else {
            if (action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                users = new Users();
                user = new User();
                user = users.checkLogin(username, password);
                if (!"1".equals(user.getFound())) {
                    page = "AdminPanel/Index.jsp";
                    System.out.println("Invalid username or password");
                    request.setAttribute("error", "Invalid username or password");
                    request.getRequestDispatcher(page).forward(request, response);
                }
                
                session.setAttribute("user", user);
                request.setAttribute("user", user);
                if (user.getTypeId().equals("1") || user.getTypeId().equals("2") || user.getTypeId().equals("5")) {
                    System.out.println(user.getTypeId());
                    page = "AdminPanel/Staff.jsp";
                } else {
                    page = "AdminPanel/Index.jsp";
                    request.setAttribute("error", "Incorect User Type");
                    System.out.println("user type not found");
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
                return;
//                request.setAttribute("addedmedicine", listMedicines);
//                request.getRequestDispatcher("AdminPanel/Medicines.jsp").forward(request, response);
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
                return;
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
                return;
            }else if (action.equals("signup")) {
                String json = null;
                List<String> signUp = new ArrayList();
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");

                System.out.println(username);
                System.out.println(password);
                Users users = new Users();
                User user1 = new User();
                User user2 = new User();
                user1.setfName(request.getParameter("fname"));
                user1.setlName(request.getParameter("lname"));
                user1.setBday(request.getParameter("dob"));
                user1.setEmail(request.getParameter("email"));
                user1.setNic(request.getParameter("nic"));
                user1.setGender(request.getParameter("gender"));
                user1.setAddress1(request.getParameter("addr1"));
                user1.setAddress2(request.getParameter("addr2"));
                user1.setAddress3(request.getParameter("addr3"));
                user1.setContact(request.getParameterValues("contact"));
                user1.setUsername(request.getParameter("username"));
                user1.setPassword(request.getParameter("password"));
                user1.setTypeId(request.getParameter("usertype"));
                User u = new User();
                u = (User)session.getAttribute("user");
                
                user1.setCreatedBy(u.getUserID());
                
                if(user1.getTypeId().equals("2")){
                    Doctor d = new Doctor();
                    d.setSpecializationId(request.getParameter("specialization"));
                    d.setType(request.getParameter("doctortype"));
                    d.setQualification(request.getParameterValues("qualification"));
                    user1.setDoctor1(d);
                }
                user2 = users.signup(user1);
                if (user2.getSuccess().equals("1")) {
                    signUp.add(user2.getSuccess());
                    request.setAttribute("addsuccess", "1");
                }else{
                    request.setAttribute("addsuccess", "0");
                }
                
                List<UserType> typeCount = new ArrayList();
                EChannelings ec = new EChannelings();
                Users u1 = new Users();
                typeCount = u1.UserTypeCount();
                request.setAttribute("types", typeCount);
                
                page = "AdminPanel/User.jsp";
//                json = new Gson().toJson(signUp);
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write(json);
//                response.sendRedirect("AdminPanel/User.jsp");
//                return;
            }
            //AR end
            
            
            
            
            else if(action.equals("viewUser")){// view User 
               // request.setAttribute("errorRegi", "");
             /*mekai1111111111   String userId = request.getParameter("userId");
                User user =new User();
                User userDetails=new User();
                Users viewUser=new Users();*/
                page = "AdminPanel/Users.jsp";
                User user =new User();
                String json = null;
                List<User> listUser = new ArrayList<>();
                User user1=new User();
                Users users = new Users();
                
                //listUser = users.viewUsers();
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
            }else if(action.equals("removeUser")){
                user = new User();
                String json = null;
                String deluserId = "";
                List<User> listUser = new ArrayList<>();
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
                
            }
            
            
            
            
            request.setAttribute("user", (User)session.getAttribute("user"));
            request.getRequestDispatcher(page).forward(request, response);
        } 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
