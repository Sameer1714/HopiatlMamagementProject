package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;

@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String FullName = request.getParameter("FullName");
		String Email = request.getParameter("Email");
		String Qualification = request.getParameter("Qualification");
		String SpecialistName = request.getParameter("SpecialistName");
		String BirthDate = request.getParameter("BirthDate");
		String MobileNumber = request.getParameter("MobileNumber");
		String Gender = request.getParameter("Gender");
		String Password = request.getParameter("Password");

		DoctorDao dd = new DoctorDao();
		boolean flag = dd.AddDoctor(FullName, Email, Qualification, SpecialistName, BirthDate, MobileNumber, Gender,
				Password);

		HttpSession s = request.getSession();

		if (flag) {
			s.setAttribute("DSuccess", "Doctor Registration SucessFully");
			response.sendRedirect("Admin/AddDoctor.jsp");

		} else {
			s.setAttribute("Error", "Server Problem try again ");
			response.sendRedirect("Admin/AddDoctor.jsp");
		}

	}

}
