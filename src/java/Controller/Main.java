/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.DoctorTime;
import Beans.EChanneling;
import Beans.Specialization;
import Beans.Time;
import Beans.User;
import Model.EChannelings;
import Model.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Main", urlPatterns = {"/Main"})
public class Main extends HttpServlet {

    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        session.setMaxInactiveInterval(20*60);
        String action = request.getParameter("action");
        String page = null;
        User user = null;

        request.setAttribute("user", user);
        if (action == null || action.isEmpty()) {
            request.getRequestDispatcher("Index.jsp").forward(request, response);
            return;
        } else {
            if (action.equals("logout")) {
                session.invalidate();
                page = "Index.jsp";
            } else if (action.equals("echannel")) {
                EChannelings ec = new EChannelings();
                List<Specialization> s = new ArrayList();
                List<Time> t = new ArrayList();
                s = ec.getSpecialization();
                t = ec.getTimes();
                request.setAttribute("specializations", s);
                request.setAttribute("times", t);
                page = "SearchDoctor.jsp";
            } else if (action.equals("viewdoctor")) {
                page = "Doctor.jsp";
                System.out.println("view doctor");
                User u1 = new User();
                u1 = (User) session.getAttribute("user");
                String doctorId = request.getParameter("doctorid");
                User u = new User();
                List<DoctorTime> dt = new ArrayList();
                u.setDoctorId(doctorId);
                EChannelings ec = new EChannelings();
                u = ec.viewDoctor(u);
                dt = ec.doctorSessions(u);
                System.out.println(doctorId);
                request.setAttribute("doctor", u);
                request.setAttribute("user", u1);
                request.setAttribute("sessions", dt);
            } else if (action.equals("appointment")) {
                String doctorId = request.getParameter("doctorid");
                String date = request.getParameter("date");
                page = "EChannel.jsp";
                
                User u = new User();
                DoctorTime doctorTime = new DoctorTime();
                List<DoctorTime> dts = new ArrayList();
                u.setDoctorId(doctorId);
                EChannelings ec = new EChannelings();
                u = ec.viewDoctor(u);
                dts = ec.doctorSessions(u);
                for (DoctorTime dt : dts) {
                    if (dt.getDate().equals(date)) {
                        doctorTime.setDoctorId(doctorId);
                        doctorTime.setDate(date);
                        doctorTime.setDayId(dt.getDayId());
                        doctorTime.setDay(dt.getDay());
                        doctorTime.setNextSession(dt.getNextSession());
                        int i = Integer.parseInt(dt.getAppointments()) + 1;
                        doctorTime.setAppointments(String.valueOf(String.valueOf(i)));
                        
                        request.setAttribute("channeldetails", doctorTime);
                        request.setAttribute("doctor", u);
                    }
                }
            }else if (action.equals("aboutus")) {
                page = "AboutUs.jsp";
            }else if (action.equals("profile")) {
                page = "Profile.jsp";
                User u = new User();
                u = (User)session.getAttribute("user");
                
//                System.out.println(u.getContacts());
                request.setAttribute("user", u);
            }else if (action.equals("settings")) {
                page = "Settings.jsp";
                User u = new User();
                u = (User)session.getAttribute("user");
                
//                System.out.println(u.getContacts());
                request.setAttribute("user", u);
            }
            

            System.out.println("dddiss");
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
        PrintWriter out = response.getWriter();
        String page = "Index.jsp";
        User user = new User();
        if (action == null || action.isEmpty()) {
            request.getRequestDispatcher(page).forward(request, response);
        } else {
            if (action.equals("login")) {
                System.out.println("login");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                System.out.println(username + "  uname");
                System.out.println(password + "  pass");
                Users users = new Users();
                user = users.checkLogin(username, password);
                if (!"1".equals(user.getFound()) || !user.getTypeId().equals("4") && !user.getTypeId().equals("3")) {
                    request.setAttribute("error", "Invalid username or password");
                    page = "Index.jsp";
                } else {
                    page = "Index.jsp";
                    session.setAttribute("user", user);
                    request.setAttribute("user", user);
                }
            } else if (action.equals("checkusername")) {
                Users users = new Users();
                String username = request.getParameter("username");
                System.out.println(username);
                int available = users.checkUsername(username);
                String y = "";
                if (available == 1) {
                    y = "<font style='font-size:80%;' color = '#008080'>Available</font>";
                } else {
                    y = "<font style='font-size:80%;' color = '#FF2F00'>Already Exist</font>";
                }

                System.out.println(y);
                response.getWriter().write(y);
                return;
            } else if (action.equals("signup")) {
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
                user1.setUsername(username);
                user1.setPassword(password);
                user1.setEmail(email);
                user1.setTypeId("4");
                user2 = users.signup(user1);
                if (user2.getSuccess().equals("1")) {
                    signUp.add(user2.getSuccess());
                    System.out.println("success");
                    user1 = users.checkLogin(username, password);
                    signUp.add(user1.getUserID());
                    signUp.add(user1.getUsername());
                    session.setAttribute("user", user1);
                }

                json = new Gson().toJson(signUp);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                return;
//                response.getWriter().write(user1.getSuccess());
            } else if (action.equals("searchdoctors")) {
                page = "SearchDoctor.jsp";
                EChannelings ec = new EChannelings();
                List<Specialization> s = new ArrayList();
                List<Time> t = new ArrayList();
                s = ec.getSpecialization();
                t = ec.getTimes();
                request.setAttribute("specializations", s);
                request.setAttribute("times", t);

                String[] searchInputs = new String[4];
                searchInputs[0] = request.getParameter("doctor");
                searchInputs[1] = request.getParameter("specialty");
                searchInputs[2] = request.getParameter("daydate");
                searchInputs[3] = request.getParameter("time");
                if (searchInputs[3].isEmpty()) {
                    searchInputs[3] = null;
                }
                System.out.println(searchInputs[0]);
                System.out.println(searchInputs[1]);
                System.out.println(searchInputs[2]);
                System.out.println(searchInputs[3]);

                List<User> doctors = new ArrayList();
                doctors = ec.searchDoctor(searchInputs);
                if (doctors.isEmpty()) {
                    request.setAttribute("norecords", "No Records Found");
                }
                request.setAttribute("results", "Search Results");
                request.setAttribute("doctors", doctors);
                request.setAttribute("doctor", searchInputs[0]);
                request.setAttribute("specialty", searchInputs[1]);
                request.setAttribute("daydate", searchInputs[2]);
                request.setAttribute("time", searchInputs[3]);

                System.out.println("echannel");
            } else if (action.equals("elogin")) {
                System.out.println("login");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String doctorId = request.getParameter("doctorid");
                String date = request.getParameter("date");

                Users users = new Users();
                user = users.checkLogin(username, password);
                if (!"1".equals(user.getFound()) || !user.getTypeId().equals("4") && !user.getTypeId().equals("3")) {
                    page = "Doctor.jsp";
                } else {
                    page = "EChannel.jsp";
                    User u = new User();
                    DoctorTime doctorTime = new DoctorTime();
                    List<DoctorTime> dts = new ArrayList();
                    u.setDoctorId(doctorId);
                    EChannelings ec = new EChannelings();
                    u = ec.viewDoctor(u);
                    dts = ec.doctorSessions(u);
                    for (DoctorTime dt : dts) {
                        if (dt.getDate().equals(date)) {
                            doctorTime.setDoctorId(doctorId);
                            doctorTime.setDate(date);
                            doctorTime.setDayId(dt.getDayId());
                            doctorTime.setDay(dt.getDay());
                            doctorTime.setNextSession(dt.getNextSession());
                            int i = Integer.parseInt(dt.getAppointments()) + 1;
                            doctorTime.setAppointments(String.valueOf(String.valueOf(i)));
                        }
                    }

                    session.setAttribute("user", user);
                    request.setAttribute("channeldetails", doctorTime);
                    request.setAttribute("doctor", u);
                    request.setAttribute("user", user);
                }
            }else if (action.equals("channel")) {
                page = "EChannel.jsp";
                String doctorid,date,time,fName,lName,nic,contact,email,notes;
                doctorid = request.getParameter("doctorid");
                date = request.getParameter("date");
                System.out.println(date);
                time = request.getParameter("time");
                fName = request.getParameter("fname");
                lName = request.getParameter("lname");
                nic = request.getParameter("nic");
                contact = request.getParameter("contact");
                email = request.getParameter("email");
                notes = request.getParameter("notes");
                EChannelings ec = new EChannelings();
                EChanneling channeling = new EChanneling();
                channeling.setDoctorId(doctorid);
                channeling.setDate(date);
                channeling.setTime(time);
                channeling.setPatientFName(fName);
                channeling.setPatientLName(lName);
                channeling.setNic(nic);
                channeling.setNotes(notes);
                channeling = ec.makeAppointment(channeling);
                
                response.getWriter().write(channeling.getSuccess());
                return;
                
            }
            
            request.setAttribute("user", (User)session.getAttribute("user"));
            request.getRequestDispatcher(page).forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
