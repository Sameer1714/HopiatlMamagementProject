package com.dao;

import java.sql.*;

import com.db.DBConection;
import com.entity.Patient;

public class PatientDao {

	public boolean PatientRegistration(Patient p) {

		Connection con = DBConection.getConnection();

		boolean flag = false;
		try {

			String sql = "insert into patientdetails (FullName,MobileNumber,Address,Email,BirthDate,Gender,Password)values(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, p.getFullName());
			ps.setString(2, p.getMobileNumber());
			ps.setString(3, p.getAddress());
			ps.setString(4, p.getEmail());
			ps.setString(5, p.getBirthDate());
			ps.setString(6, p.getGender());
			ps.setString(7, p.getPassword());

			int i = ps.executeUpdate();

			if (i > 0) {
				flag = true;
			}
			ps.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return flag;
	}

	public Patient PatientLoginCheck(String Email, String Password) {

		Connection con = DBConection.getConnection();

		Patient p = null;

		try {

			String sql = "select * from patientdetails where Email=? and Password=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Email);
			ps.setString(2, Password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Patient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
			}

			rs.close();
			ps.close();

		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return p;

	}

	public int getTotalPatientCount() {

		Connection con = DBConection.getConnection();

		int count = 0;

		try {

			String sql = "select count(*) from patientdetails";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			rs.next();

			int i = rs.getInt(1);

			if (i > 0) {
				count = i;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return count;

	}

	public String getPatientPassword(int PatientId) {

		Connection con = DBConection.getConnection();

		String Password = null;

		try {

			String sql = "select Password from patientdetails where Id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, PatientId);

			ResultSet rs = ps.executeQuery();

			rs.next();

			Password = rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return Password;

	}

	public boolean SetPatientPassword(int PatientId,String NewPassword) {
	
		Connection con = DBConection.getConnection();
		
		boolean flag=false;

		try {

			String sql = "update patientdetails set Password=?  where Id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, NewPassword);
			ps.setInt(2, PatientId);
			
			int i=ps.executeUpdate();

			if(i>0) {
				flag=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;
		
	}

}
