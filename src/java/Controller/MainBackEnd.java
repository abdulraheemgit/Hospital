/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Medicine;
import Beans.User;
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
        String action = request.getParameter("action");
        String page = null;

        if (action == null || session.equals(null)) {
            request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
            return;
        } else {
            System.out.println("not empty");
            user = (User) session.getAttribute("user");
            if (action.equals("users")) {
                System.out.println("users");
                page = "AdminPanel/Users.jsp";

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
                if (user.getTypeId().equals("1") || user.getTypeId().equals("2") || user.getTypeId().equals("3")) {
                    request.getRequestDispatcher("AdminPanel/Staff.jsp").forward(request, response);
                } else {
                    System.out.println("user type not found");
                    request.setAttribute("error", "Incorect User Type");
                    request.getRequestDispatcher("AdminPanel/Staff.jsp").forward(request, response);
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
            }
        } else {
            request.getRequestDispatcher("AdminPanel/Index.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
