package com.doctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.entity.Doctor;


@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Email=request.getParameter("Email");
		String Password=request.getParameter("Password");
		
		DoctorDao dd=new DoctorDao();
		Doctor d=dd.LoginCheck(Email, Password);
		
		HttpSession s=request.getSession();
		
		if(d!=null) {
			
			s.setAttribute("Doctor",d);
			response.sendRedirect("Doctor/DoctorDashboard.jsp");
		}
		else {
			s.setAttribute("Error", "Invalid Password or Email");
			response.sendRedirect("DoctorLogin.jsp");;
		}
	}

}
