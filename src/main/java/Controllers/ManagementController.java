/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdministratorDAO;
import DAOs.LoginDAO;
import DAOs.ParentsDAO;
import DAOs.StudentDAO;
import DAOs.TeacherDAO;
import Model.administrator;
import Model.parents;
import Model.student;
import Model.teacher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ManagementController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagementController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagementController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI(); // Get the URL
        String username = "";

        String phone_number = "";
        Cookie[] list = request.getCookies();
        if (list != null) {
            for (Cookie c : list) {
                String name = c.getName();
                if (name.equals("Teacher") || c.getName().equals("Administrator") ||
                    c.getName().equals("Parents") || c.getName().equals("Student")) {
                    phone_number = c.getValue();
                    break;
                }else {
                    name = "";
                }
            }
        }
        if (!phone_number.equals("")) {

            if (path.endsWith("/AdministratorHomePage")) { //Login for Customer
                request.getRequestDispatcher("/admin_homePage.jsp").forward(request, response);
            } else if (path.endsWith("/TeacherHomePage")) { //Login for Customer
                request.getRequestDispatcher("/teacher_homePage.jsp").forward(request, response);
            } else if (path.endsWith("/ParentsHomePage")) { //Login for Customer
                request.getRequestDispatcher("/parents_homePage.jsp").forward(request, response);
            } else if (path.endsWith("/StudentHomePage")) { //Login for Customer
                request.getRequestDispatcher("/student_homePage.jsp").forward(request, response);
            } else if (path.endsWith("/ChangpassPage")) {
                request.getRequestDispatcher("/changePass.jsp").forward(request, response);
            } else if (path.endsWith("/AccountPage")) {
                request.getRequestDispatcher("/myaccount.jsp").forward(request, response);
            } else if (path.endsWith("/AccountParentsPage")) {
                request.getRequestDispatcher("/myaccountParents.jsp").forward(request, response);
            } else if (path.endsWith("/AccountStudentPage")) {
                request.getRequestDispatcher("/myaccountStudent.jsp").forward(request, response);
            } else if (path.endsWith("/AccountTeacherPage")) {
                request.getRequestDispatcher("/myaccountTeacher.jsp").forward(request, response);
            } else if (path.endsWith("/AdministratorSignOut")) { //Login for Customer

                Cookie[] cList;
                cList = request.getCookies();
                for (Cookie cList1 : cList) { //Duyet qua het tat ca cookie
                    if (cList1.getName().equals("Administrator")) { //nguoi dung da dang nhap
                        cList1.setValue("");
                        cList1.setPath("/");
                        cList1.setMaxAge(0);
                        response.addCookie(cList1);

                        break; //thoat khoi vong lap
                    }
                }
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else if (path.endsWith("/TeacherSignOut")) { //Login for Customer
                Cookie[] cList;
                cList = request.getCookies();
                for (Cookie cList1 : cList) { //Duyet qua het tat ca cookie
                    if (cList1.getName().equals("Teacher")) { //nguoi dung da dang nhap
                        cList1.setValue("");
                        cList1.setPath("/");
                        cList1.setMaxAge(0);
                        response.addCookie(cList1);
                        break; //thoat khoi vong lap
                    }
                }
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else if (path.endsWith("/ParentsSignOut")) { //Login for Customer
                Cookie[] cList;
                cList = request.getCookies();
                for (Cookie cList1 : cList) { //Duyet qua het tat ca cookie
                    if (cList1.getName().equals("Parents")) { //nguoi dung da dang nhap
                        cList1.setValue("");
                        cList1.setPath("/");
                        cList1.setMaxAge(0);
                        response.addCookie(cList1);
                        break; //thoat khoi vong lap
                    }
                }
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else if (path.endsWith("/StudentSignOut")) { //Login for Customer
                Cookie[] cList;
                cList = request.getCookies();
                for (Cookie cList1 : cList) { //Duyet qua het tat ca cookie
                    if (cList1.getName().equals("Student")) { //nguoi dung da dang nhap
                        cList1.setValue("");
                        cList1.setPath("/");
                        cList1.setMaxAge(0);
                        response.addCookie(cList1);
                        break; //thoat khoi vong lap
                    }
                }
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } else if (path.endsWith("/StudentManagement/LoginPage")) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/StudentManagement/LoginPage").forward(request, response);

        };
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btnLogin") != null) { //Nguoi dung da nhan nut submit
            LoginDAO lDAO = new LoginDAO();
            String role = request.getParameter("role");
            String phone_number = request.getParameter("phone_number");
            String password = lDAO.getPwdMd5(request.getParameter("password"));

            if (role.equals("Administrator")) {
                AdministratorDAO aDAO = new AdministratorDAO();
                if (aDAO.existAccount(phone_number, password)) {
                    Cookie c = new Cookie("Administrator", phone_number);
                    c.setMaxAge(3 * 24 * 60 * 60); //Thiet lap han su dung 3 ngay
                    response.addCookie(c);//Day cookie xuong may duong dung (client)
                    response.sendRedirect("/StudentManagement/AdministratorHomePage");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("loginfail", "1");
                    response.sendRedirect("/StudentManagement/LoginPage");
                }
            } else if (role.equals("Teacher")) {
                TeacherDAO tDAO = new TeacherDAO();
                if (tDAO.existAccount(phone_number, password)) {
                    Cookie c = new Cookie("Teacher", phone_number);
                    c.setMaxAge(3 * 24 * 60 * 60); //Thiet lap han su dung 3 ngay
                    response.addCookie(c);//Day cookie xuong may duong dung (client)
                    response.sendRedirect("/StudentManagement/TeacherHomePage");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("loginfail", "1");
                    response.sendRedirect("/StudentManagement/LoginPage");
                }
            } else if (role.equals("Parents")) {
                ParentsDAO pDAO = new ParentsDAO();
                if (pDAO.existAccount(phone_number, password)) {
                    Cookie c = new Cookie("Parents", phone_number);
                    c.setMaxAge(3 * 24 * 60 * 60); //Thiet lap han su dung 3 ngay
                    response.addCookie(c);//Day cookie xuong may duong dung (client)
                    response.sendRedirect("/StudentManagement/ParentsHomePage");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("loginfail", "1");
                    response.sendRedirect("/StudentManagement/LoginPage");
                }
            } else if (role.equals("Student")) {
                StudentDAO sDAO = new StudentDAO();
                if (sDAO.existAccount(phone_number, password)) {
                    Cookie c = new Cookie("Student", phone_number);
                    c.setMaxAge(3 * 24 * 60 * 60); //Thiet lap han su dung 3 ngay
                    response.addCookie(c);//Day cookie xuong may duong dung (client)
                    response.sendRedirect("/StudentManagement/StudentHomePage");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("loginfail", "1");
                    response.sendRedirect("/StudentManagement/LoginPage");
                }
            }
        } else if (request.getParameter("submit_saveAdmin") != null) {
            String phone = request.getParameter("phone_number");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String gen = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String address = request.getParameter("address");
            administrator adminnew = new administrator(phone, email, "", name, gen, birthday, address);
            AdministratorDAO adao = new AdministratorDAO();
            administrator admin = adao.updateAdmin(phone, adminnew);
            if (admin == null) {
                administrator thongTinCu = adao.getInfo(phone);
                HttpSession sesstion = request.getSession();
                sesstion.setAttribute("order", thongTinCu);
                response.sendRedirect("/StudentManagement/AccountPage");
            } else {
                response.sendRedirect("/StudentManagement/AdministratorHomePage");
            }

        } else if (request.getParameter("submit_saveTeacher") != null) {
            int id = Integer.parseInt(request.getParameter("teacherID"));
            String phone = request.getParameter("phone_number");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String gen = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String address = request.getParameter("address");
            String status = request.getParameter("status");
            teacher teachernew = new teacher(id, email, "", name, gen, birthday, phone, address, status);
            TeacherDAO TDAO = new TeacherDAO();
            teacher admin = TDAO.updateTeacher(id, teachernew);
            if (admin == null) {
                teacher thongTinCu = TDAO.getInfoteacher(phone);
                HttpSession sesstion = request.getSession();
                sesstion.setAttribute("order", thongTinCu);
                response.sendRedirect("/StudentManagement/AccountTeacherPage");
            } else {
                response.sendRedirect("/StudentManagement/TeacherHomePage");
            }

        } else if (request.getParameter("submit_saveParent") != null) {
            int id = Integer.parseInt(request.getParameter("parentID"));
            String phone = request.getParameter("phone_parent");
            String name = request.getParameter("name_parent");
            String role = request.getParameter("role_parent");
            String job = request.getParameter("job_parent");
            parents parentnew = new parents(id, phone, "", name, role, job, 0);
            ParentsDAO PDAO = new ParentsDAO();
            parents admin = PDAO.updateParent(id, parentnew);
            if (admin == null) {
                parents thongTinCu = PDAO.getInfoparent(phone);
                HttpSession sesstion = request.getSession();
                sesstion.setAttribute("order", thongTinCu);
                response.sendRedirect("/StudentManagement/AccountParentsPage");
            } else {
                response.sendRedirect("/StudentManagement/ParentsHomePage");
            }

        } else if (request.getParameter("submit_saveStudent") != null) {
            int id = Integer.parseInt(request.getParameter("teacherID"));
            String phone = request.getParameter("phone_student");
            String name = request.getParameter("name_student");
            String email = request.getParameter("email_student");
            String gen = request.getParameter("gender_student");
            Date birthday = Date.valueOf(request.getParameter("birthday_student"));
            String address = request.getParameter("address_student");
            String status = request.getParameter("status_student");
            student studentnew = new student(id, email, "", name, gen, birthday, phone, address, status);
            StudentDAO SDAO = new StudentDAO();
            student admin = SDAO.updateStudent(id, studentnew);
            if (admin == null) {
                student thongTinCu = SDAO.getInfostudent(phone);
                HttpSession sesstion = request.getSession();
                sesstion.setAttribute("order", thongTinCu);
                response.sendRedirect("/StudentManagement/AccountParentsPage");
            } else {
                response.sendRedirect("/StudentManagement/ParentsHomePage");
            }

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
