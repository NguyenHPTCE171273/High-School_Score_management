/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Model.parents;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ParentsDAO {

    Connection conn;

    public ParentsDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ParentsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean existAccount(String phone_number, String password) {
        try {
            PreparedStatement ps = conn.prepareStatement("Select * from parents Where phone_number = ? AND password = ?");
            ps.setString(1, phone_number);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParentsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public parents updatePasswordParents(String username, String newPassword) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE parents SET password = ? WHERE phone_number = ?");
            ps.setString(1, newPassword);
            ps.setString(2, username);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count == 0 ? null : new parents(); // hoặc return null;

    }

    public parents getInfoparent(String phone_number) {
        parents acc = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from parents where phone_number =?");
            ps.setString(1, phone_number);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc = new parents(rs.getInt("id"), rs.getString("phone_number"), rs.getString("password"), rs.getString("name"), rs.getString("role"), rs.getString("job"), rs.getInt("student_id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParentsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public ResultSet getAllparents(String phone_number) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from parents p  inner join student s on  p.student_id = s.id \n"
                    + "where p.phone_number = ?");
            ps.setString(1, phone_number);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public parents updateParent(int id, parents newInfo) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE parents SET phone_number =? ,  name = ?, role = ?, job = ? WHERE id =?;");
            ps.setString(1, newInfo.getPhone_number());
            ps.setString(2, newInfo.getName());
            ps.setString(3, newInfo.getRole());
            ps.setString(4, newInfo.getJob());
            ps.setInt(5, id);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count == 0 ? null : newInfo;
    }

    public boolean checkSDTParent(String phone_number) {
        PreparedStatement ps;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("select * from parents where phone_number =?");
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

}
