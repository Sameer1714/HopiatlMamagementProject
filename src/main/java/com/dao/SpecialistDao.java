package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConection;
import com.entity.Specialist;

public class SpecialistDao {

	

	public boolean AddSpecialistName(String SpecialistName) {

		Connection con = DBConection.getConnection();
		
		boolean flag = false;

		try {
			String sql = "insert into speciallist (SpecialistName)values(?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, SpecialistName);

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

				e.printStackTrace();
			}
		}

		return flag;
	}

	public List<Specialist> getSpecialist() {

		Connection con = DBConection.getConnection();
		
		List<Specialist> list = new ArrayList<>();
		Specialist s = null;
		try {
			String sql = "select * from speciallist";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				s = new Specialist(rs.getInt(1), rs.getString(2));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}

	public int getTotalSpecialistCount() {

		Connection con = DBConection.getConnection();
		
		int count = 0;

		try {

			String sql = "select count(*) from speciallist";
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
}
