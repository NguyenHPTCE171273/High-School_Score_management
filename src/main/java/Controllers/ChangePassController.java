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

/**
 *
 * @author Tran Duy Dat - CE172036
 */
public class ChangePassController extends HttpServlet {

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
            out.println("<title>Servlet ChangePassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassController at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        String path = request.getRequestURI(); // Get the URL

        if (path.endsWith("/ChangpassPage")) {
            request.getRequestDispatcher("/changePass.jsp").forward(request, response);

        }
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
        // processRequest(request, response);

        if (request.getParameter("btn_submit") != null) {

            LoginDAO lDAO = new LoginDAO();
            // String old_password = lDAO.getPwdMd5(request.getParameter("current_password"));
            String role = "";
            // String old_pass = lDAO.getPwdMd5(request.getParameter("old_password"));

            String new_pass = lDAO.getPwdMd5(request.getParameter("new_password"));
            String confirm_password = lDAO.getPwdMd5(request.getParameter("confirm_password"));
            AdministratorDAO ADAO = new AdministratorDAO();
            TeacherDAO TDAO = new TeacherDAO();
            StudentDAO SDAO = new StudentDAO();
            ParentsDAO PDAO = new ParentsDAO();
            if (new_pass.equals(confirm_password)) {
                String username = null;
                Cookie[] cList = request.getCookies();
                if (cList != null) {
                    for (Cookie c : cList) {
                        if (c.getName().equals("Administrator")) {
                            role = "admin";
                            username = c.getValue();
                            break;
                        } else if (c.getName().equals("Teacher")) {
                            role = "teacher";
                            username = c.getValue();
                            break;
                        } else if (c.getName().equals("Parents")) {
                            role = "parents";
                            username = c.getValue();
                            break;
                        } else if (c.getName().equals("Student")) {
                            role = "student";
                            username = c.getValue();
                            break;
                        }
                    }
                    administrator admin = null;
                    student student = null;
                    parents parents = null;
                    teacher teacher = null;
                    if (role.equals("teacher")) {
                        teacher admin1 = TDAO.getInfoteacher(username);
                        String old_pass1 = admin1.getPassword();
                        if (new_pass.equals(old_pass1)) {
                            request.getSession().setAttribute("samepass", "loi roi");
                            response.sendRedirect("/ChangePassController/ChangpassPage");
                        } else {
                            teacher = TDAO.updatePasswordTeacher(username, new_pass);
                        }
                    } else if (role.equals("parents")) {
                        parents = PDAO.updatePasswordParents(username, new_pass);
                    } else if (role.equals("student")) {
                        student = SDAO.updatePasswordStudent(username, new_pass);
                    } else if (role.equals("admin")) {
                        admin = ADAO.updatePasswordAdmin(username, new_pass);
                    }
                    if (teacher != null) {
                        response.sendRedirect("/StudentManagement/TeacherHomePage");
                    } else if (admin != null) {
                        response.sendRedirect("/StudentManagement/AdministratorHomePage");
                    } else if (student != null) {
                        response.sendRedirect("/StudentManagement/StudentHomePage");
                    } else if (parents != null) {
                        response.sendRedirect("/StudentManagement/ParentsHomePage");
                    } else {
                        response.sendRedirect("/ChangePassController/ChangpassPage");
                    }
                }
            } else {
                response.sendRedirect("/ChangePassController/ChangpassPage");

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
