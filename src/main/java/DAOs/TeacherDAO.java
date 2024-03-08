/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Model.parents;
import Model.teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class TeacherDAO {

    Connection conn;

    public TeacherDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean existAccount(String phone_number, String password) {
        try {
            PreparedStatement ps = conn.prepareStatement("Select * from teacher Where phone_number = ? AND password = ?");
            ps.setString(1, phone_number);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public teacher updatePasswordTeacher(String username, String newPassword) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE teacher SET password = ? WHERE phone_number = ?");
            ps.setString(1, newPassword);
            ps.setString(2, username);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count == 0 ? null : new teacher(); // hoặc return null;
    }

    public teacher updateTeacher(int id, teacher newInfo) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE teacher SET phone_number =? , email = ?,  name = ?, gender = ?, birthday = ?, address = ?, status =? WHERE id =?;");
            ps.setString(1, newInfo.getPhone_number());
            ps.setString(2, newInfo.getEmail());
            ps.setString(3, newInfo.getName());
            ps.setString(4, newInfo.getGender());
            ps.setDate(5, newInfo.getBirthday());
            ps.setString(6, newInfo.getAddress());
            ps.setString(7, newInfo.getStatus());
            ps.setInt(8, id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count == 0 ? null : newInfo;
    }

    public teacher getInfoteacher(String phone_number) {
        teacher acc = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from teacher where phone_number =?");
            ps.setString(1, phone_number);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc = new teacher(rs.getInt("id"), rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getString("gender"), rs.getDate("birthday"), rs.getString("phone_number"), rs.getString("address"), rs.getString("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public ResultSet getAllTeacher(String phone_number) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from teacher where phone_number=?");
            ps.setString(1, phone_number);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs != null ? rs : null;
    }

    public boolean checkSDTeacher(String phone_number) {
        PreparedStatement ps;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select * from teacher where phone_number =?");
            ps.setString(1, phone_number);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ResultSet getAllClass() {
        ResultSet rs = null;

        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select id from class");
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public ResultSet getAllSubject() {
        ResultSet rs = null;

        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from subject order by id");
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public ResultSet getAllSemester() {
        ResultSet rs = null;

        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from semester");
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public String getTeacherNameById(int id) {
        ResultSet rs = null;
        String name = "";

        try {
            PreparedStatement ps = conn.prepareStatement("select name from teacher where id = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return name;
    }

    public int getTeacherByPhoneNumber(String phoneNumber) {
        ResultSet rs = null;
        int id = 0;

        try {
            PreparedStatement ps = conn.prepareStatement("select id from teacher where phone_number = ?");
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;
    }

    public boolean getTeacherByClassAndSubject(String classes, int subject_id, int id) {
        ResultSet rs = null;
        int newId = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select teacher_id from teaching where class_id = ? and subject_id = ?");
            ps.setString(1, classes);
            ps.setInt(2, subject_id);

            rs = ps.executeQuery();
            while (rs.next()) {
                newId = rs.getInt(1);
            }
            if (newId == id) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public ResultSet getStudent(String nameClass, int subject_id, int semester_id) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT  score.student_id, student.phone_number, student.name, student.birthday, scoreMouth, scoreShortExam, scoreMidSemester, scoreSemester\n"
                    + "from studying\n"
                    + "JOIN student ON student.id = studying.student_id\n"
                    + "JOIN score ON student.id = score.student_id\n"
                    + "WHERE studying.class_id = ? AND score.subject_id = ? AND score.semester = ?\n"
                    + "order by score.student_id");

            ps.setString(1, nameClass);
            ps.setInt(2, subject_id);
            ps.setInt(3, semester_id);

            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs != null ? rs : null;
    }

    public ResultSet getStudentInClass(String nameClass) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select distinct id, phone_number, name, birthday from studying\n"
                    + "join student on id =student_id\n"
                    + "where class_id = ?");

            ps.setString(1, nameClass);

            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs != null ? rs : null;
    }

    public ResultSet getScoreByStudent(int student_id, int subject_id, int semester_id) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT  student_id, scoreMouth, scoreShortExam, scoreMidSemester, scoreSemester\n"
                    + "from score\n"
                    + "WHERE student_id =? and score.subject_id = ? AND score.semester = ?");

            ps.setInt(1, student_id);
            ps.setInt(2, subject_id);
            ps.setInt(3, semester_id);

            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs != null ? rs : null;
    }

    public void updateScoreById(int student_id, String scoreMouth, String scoreShortExam, String scoreMidSemester, String scoreSemester, float gpa) {
        try {
            PreparedStatement ps = conn.prepareStatement("update score set scoreMouth=?, scoreShortExam=?, scoreMidSemester=?, scoreSemester=?, gpa =? where student_id=?");
            if (scoreMouth.equals("")) {
                ps.setNull(1, java.sql.Types.FLOAT);
            } else {
                ps.setFloat(1, Float.parseFloat(scoreMouth));
            }

            if (scoreShortExam.equals("")) {
                ps.setNull(2, java.sql.Types.FLOAT);
            } else {
                ps.setFloat(2, Float.parseFloat(scoreShortExam));
            }

            if (scoreMidSemester.equals("")) {
                ps.setNull(3, java.sql.Types.FLOAT);
            } else {
                ps.setFloat(3, Float.parseFloat(scoreMidSemester));
            }

            if (scoreSemester.equals("")) {
                ps.setNull(4, java.sql.Types.FLOAT);
            } else {
                ps.setFloat(4, Float.parseFloat(scoreSemester));
            }

            ps.setFloat(5, gpa);
            ps.setFloat(6, student_id);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getHomeroomByPhoneNumber(String phoneNumber) {
        ResultSet rs = null;

        try {
            PreparedStatement ps = conn.prepareStatement("select distinct class_id, homeroom\n"
                    + "from teacher \n"
                    + "join teaching on teacher.id = teaching.teacher_id\n"
                    + "where teacher.phone_number = ? and homeroom is not null ");
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(TeacherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

}
