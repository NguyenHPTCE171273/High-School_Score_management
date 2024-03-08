/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.TeacherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AddScore extends HttpServlet {

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
            out.println("<title>Servlet AddScore</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddScore at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        
        String phone_number = "";
        Cookie[] list = request.getCookies();
        if (list != null) {
            for (Cookie c : list) {
                if (c.getName().equals("Teacher")) {
                    phone_number = c.getValue();
                    break;
                }
            }
        }
        
        if (!phone_number.equals("")) {
            
            if (path.endsWith("AddScore")) {
                session.setAttribute("isAccess", "true");
                request.getRequestDispatcher("/addScore.jsp").forward(request, response);
            } else if (path.endsWith("/reportScore")) {
//            gia cookie
                Cookie cookie = new Cookie("teacher", "0942368977");
                cookie.setMaxAge(60 * 5);
                response.addCookie(cookie);
//            
                Cookie[] cList = request.getCookies();
                String phoneNumber = "";
                for (Cookie c : cList) {
                    if (c.getName().equals("teacher")) {
                        phoneNumber = c.getValue();
                        break;
                    }
                }
                
                if (!phoneNumber.equals("")) {
                    TeacherDAO tDAO = new TeacherDAO();
                    ResultSet rs = tDAO.getHomeroomByPhoneNumber(phoneNumber);
                    String classes = "";
                    String homeroom = "";
                    
                    try {
                        while (rs.next()) {
                            classes = rs.getString("class_id");
                            homeroom = rs.getString("homeroom");
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(AddScore.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    if (!classes.equals("")) {
                        session.setAttribute("homeroom", classes + " " + homeroom);
                    } else {
                        session.setAttribute("homeroom", "false");
                    }
                } else {
                    session.setAttribute("homeroom", "false");
                }
                request.getRequestDispatcher("/reportScore.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/StudentManagement/LoginPage");
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
        HttpSession session = request.getSession();
        Cookie cookie = new Cookie("teacher", "0942368977");
        cookie.setMaxAge(60 * 5);
        response.addCookie(cookie);
        
        if (request.getParameter("btn-filter") != null) {
            String classes = request.getParameter("class");
            int subject = Integer.parseInt(request.getParameter("subject"));
            String semester = request.getParameter("semester");
            
            TeacherDAO tDAO = new TeacherDAO();
            Cookie[] cList = request.getCookies();
            String phoneNumber = "";
            for (Cookie c : cList) {
                if (c.getName().equals("teacher")) {
                    phoneNumber = c.getValue();
                    break;
                }
            }
            
            List<String> list = new ArrayList<>();
            list.add(classes);
            list.add(subject + "");
            list.add(semester);
            session.setAttribute("list", list);
            
            int id = tDAO.getTeacherByPhoneNumber(phoneNumber);
            if (id > 0) {
                boolean checkTeacher = tDAO.getTeacherByClassAndSubject(classes, subject, id);
                
                if (checkTeacher) {
                    session.setAttribute("isPower", id + "");
                    
                } else {
                    session.setAttribute("isPower", "false");
                }
            } else {
                session.setAttribute("isPower", "false");
            }
            
            response.sendRedirect("/AddScore");
        } else if (request.getParameter("btn-save") != null) {
            String[] txtValues = request.getParameter("txt_values").split(" ");
            String classes = txtValues[0];
            int subject_id = Integer.parseInt(txtValues[1]);
            int semester_id = Integer.parseInt(txtValues[2]);
            
            TeacherDAO tDAO = new TeacherDAO();
            ResultSet rs = tDAO.getStudent(classes, subject_id, semester_id);
            try {
                while (rs.next()) {
                    int student_id = rs.getInt("student_id");
                    
                    if (request.getParameter(student_id + " scoreMouth") != null) {
                        String scoreMouth = request.getParameter(student_id + " scoreMouth");
                        String scoreShortExam = request.getParameter(student_id + " scoreShortExam");
                        String scoreMidSemester = request.getParameter(student_id + " scoreMidSemester");
                        String scoreSemester = request.getParameter(student_id + " scoreSemester");
                        Float gpa = Float.parseFloat(request.getParameter(student_id + " gpa"));
                        
                        tDAO.updateScoreById(student_id, scoreMouth, scoreShortExam, scoreMidSemester, scoreSemester, gpa);
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(AddScore.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            response.sendRedirect("/AddScore");
        } else if (request.getParameter("btn-filtScore") != null) {
            String classes = request.getParameter("class");
            String semester = request.getParameter("semester");
            
            session.setAttribute("semester", semester);
            response.sendRedirect("/AddScore/reportScore");
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
