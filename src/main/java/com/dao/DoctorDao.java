package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConection;
import com.entity.Doctor;

public class DoctorDao {

	public boolean AddDoctor(String FullName, String Email, String Qualification, String SpecialistName,
			String BirthDate, String MobileNumber, String Gender, String Password) {

		Connection con = DBConection.getConnection();
		
		boolean flag = false;

		try {
			

			String sql = "insert into doctor (FullName,Email,Qualification,SpecialistName,BirthDate, MobileNumber,Gender,Password)values(?,?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, FullName);
			ps.setString(2, Email);
			ps.setString(3, Qualification);
			ps.setString(4, SpecialistName);
			ps.setString(5, BirthDate);
			ps.setString(6, MobileNumber);
			ps.setString(7, Gender);
			ps.setString(8, Password);
			int i = ps.executeUpdate();

			if (i > 0) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return flag;
	}

	public List<Doctor> getAllDoctors() {

		Connection con = DBConection.getConnection();

		List<Doctor> list = new ArrayList<Doctor>();

		Doctor d = null;

		try {

			String sql = "select * from doctor";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				d = new Doctor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				list.add(d);
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
		return list;
	}

	public Doctor getParticularDoctorInfo(int Id) {

		Connection con = DBConection.getConnection();

		Doctor d = null;

		try {

			String sql = "select * from doctor where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
		return d;
	}

	public boolean DeleteDoctor(int Id) {

		Connection con = DBConection.getConnection();

		boolean flag = false;

		try {

			String sql = "delete from doctor where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Id);

			int i = ps.executeUpdate();

			if (i > 0) {
				flag = true;
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

	public int getTotalDoctorCount() {

		Connection con = DBConection.getConnection();

		int count = 0;

		try {

			String sql = "select count(*) from doctor";
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

	public boolean EditDoctor(int Id, String FullName, String Email, String Qualification, String SpecialistName,
			String BirthDate, String MobileNumber, String Gender, String Password) {

		Connection con = DBConection.getConnection();
		
		boolean flag = false;

		try {

			String sql = "update doctor set FullName=?,Email=?,Qualification=?,SpecialistName=?,BirthDate=?,MobileNumber=?,Gender=?,Password=? where id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, FullName);
			ps.setString(2, Email);
			ps.setString(3, Qualification);
			ps.setString(4, SpecialistName);
			ps.setString(5, BirthDate);
			ps.setString(6, MobileNumber);
			ps.setString(7, Gender);
			ps.setString(8, Password);
			ps.setInt(9, Id);
			int i = ps.executeUpdate();

			if (i > 0) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return flag;
	}

	public Doctor LoginCheck(String Email, String Password) {

		Connection con = DBConection.getConnection();

		Doctor d = null;

		try {
			String sql = "select * from doctor where Email=? and Password=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Email);
			ps.setString(2, Password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
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

		return d;
	}
	
	public String getDoctorPassword(int DoctorId) {

		Connection con = DBConection.getConnection();

		String Password = null;

		try {

			String sql = "select Password from doctor where Id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, DoctorId);

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

	public boolean SetDoctorPassword(int DoctorId,String NewPassword) {
	
		Connection con = DBConection.getConnection();
		
		boolean flag=false;

		try {

			String sql = "update doctor set Password=?  where Id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, NewPassword);
			ps.setInt(2, DoctorId);
			
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
