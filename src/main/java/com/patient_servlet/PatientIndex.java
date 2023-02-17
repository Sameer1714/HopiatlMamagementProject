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

@WebServlet("/PatientIndex")
public class PatientIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Email = request.getParameter("Email");
		String Password = request.getParameter("Password");

		PatientDao pd = new PatientDao();
		Patient p = pd.PatientLoginCheck(Email, Password);

		HttpSession ss = request.getSession();

		if (p != null && Email.equals(p.getEmail()) && Password.equals(p.getPassword())) {
			ss.setAttribute("Patient", p);
			response.sendRedirect("index.jsp");

		} else {

			ss.setAttribute("Error", "Invalid Email or Password");
			response.sendRedirect("PatientLogin.jsp");
		}

	}

}
