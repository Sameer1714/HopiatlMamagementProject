package com.patient_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PatientDao;
import com.entity.Patient;

@WebServlet("/PatientRegistration")
public class PatientRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String FullName = request.getParameter("FullName");
			String MobileNumber = request.getParameter("MobileNumber");
			String Address = request.getParameter("Address");
			String Email = request.getParameter("Email");
			String BirthDate = request.getParameter("BirthDate");
			String Gender = request.getParameter("Gender");
			String Password = request.getParameter("Password");
			String CPassword = request.getParameter("CPassword");

			HttpSession session = request.getSession();

			if (MobileNumber.length() != 10) {
				session.setAttribute("Error", "Invalid Mobile Number");
				response.sendRedirect("PatientRegistration.jsp");
			} else if (!Password.equals(CPassword)) {
				session.setAttribute("Error", "Password Not Match");
				response.sendRedirect("PatientRegistration.jsp");
			} else {

				Patient p = new Patient(FullName, MobileNumber, Address, Email, BirthDate, Gender, Password);

				PatientDao pd = new PatientDao();
				boolean b = pd.PatientRegistration(p);

				if (b) {
					HttpSession session2 = request.getSession();
					session2.setAttribute("Success", "Registration Sucessfully Done..!");
					response.sendRedirect("PatientRegistration.jsp");

				} else {

					session.setAttribute("Error", "Email Id already Exist");
					response.sendRedirect("PatientRegistration.jsp");

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
