package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConection;
import com.entity.BookAppointment;

public class BookAppointmentDao {

	public boolean BookDoctorAppointmento(BookAppointment b) {

		Connection con = DBConection.getConnection();

		boolean flag = false;

		try {

			String sql = "insert into appointment (PatientId,DoctorId,FullName,Age,MobileNumber,Address,Email,AppointmentDate,Disease,Gender,Status)values(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, b.getPatientId());
			ps.setInt(2, b.getDoctorId());
			ps.setString(3, b.getFullName());
			ps.setInt(4, b.getAge());
			ps.setString(5, b.getMobileNumber());
			ps.setString(6, b.getAddress());
			ps.setString(7, b.getEmail());
			ps.setString(8, b.getAppointmentDate());
			ps.setString(9, b.getDisease());
			ps.setString(10, b.getGender());
			ps.setString(11, b.getStatus());
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

	public List<BookAppointment> getAppoinmentBookByDoctorId(int DoctortId) {

		Connection con = DBConection.getConnection();

		List<BookAppointment> list = new ArrayList<BookAppointment>();

		BookAppointment ba = null;

		try {

			String sql = "select * from appointment where DoctorId=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, DoctortId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ba = new BookAppointment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
				list.add(ba);
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

	public BookAppointment getAppoinmentBookById(int Id, int DoctorId) {

		Connection con = DBConection.getConnection();

		BookAppointment ba = null;

		try {

			String sql = "select * from appointment where Id=? and DoctorId=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Id);
			ps.setInt(2, DoctorId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ba = new BookAppointment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));

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

		return ba;

	}

	public boolean UpdatePatientStatus(String Status, int id, int DoctorId) {

		Connection con = DBConection.getConnection();

		boolean flag = false;

		try {
			String sql = "update appointment set Status=? where Id=? and DoctorId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Status);
			ps.setInt(2, id);
			ps.setInt(3, DoctorId);

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

	public List<BookAppointment> getAppoinmentBookByPatientId(int PatientId) {

		Connection con = DBConection.getConnection();

		List<BookAppointment> list = new ArrayList<BookAppointment>();

		BookAppointment ba = null;

		try {

			String sql = "select * from appointment where PatientId=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, PatientId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ba = new BookAppointment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
				list.add(ba);
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

	public List<BookAppointment> getAllBookAppointment() {

		Connection con = DBConection.getConnection();

		List<BookAppointment> list = new ArrayList<BookAppointment>();

		BookAppointment ba = null;

		try {

			String sql = "select * from appointment order by Id desc";

			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ba = new BookAppointment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
				list.add(ba);
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
	
	
	
	public int TotalBookAppointmentCount() {
		
		
		Connection con = DBConection.getConnection();

		int count=0;

		try {
			String sql = "select count(*) from appointment";
			PreparedStatement ps = con.prepareStatement(sql);
			
		     ResultSet rs=ps.executeQuery();
            
		      rs.next();
		      
			count=rs.getInt(1);
			

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
	
public int getParticularDoctorAppointmentCount(int DoctorId) {
		
		
		Connection con = DBConection.getConnection();

		int count=0;

		try {
			String sql = "select count(*) from appointment where DoctorId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, DoctorId);
			
		     ResultSet rs=ps.executeQuery();
            
		      rs.next();
		      
			count=rs.getInt(1);
			

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


}
