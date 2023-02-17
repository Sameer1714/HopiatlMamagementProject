package com.doctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.PatientDao;


@WebServlet("/DoctorChangePassword")
public class DoctorChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int DoctorId=Integer.parseInt(request.getParameter("DoctorId"));
		String OldPassword=request.getParameter("OldPassword");
		String NewPassword=request.getParameter("NewPassword");
		String ConfirmPassword=request.getParameter("ConfirmPassword");
		
		DoctorDao dd=new DoctorDao();
		String CurrentPassword=dd.getDoctorPassword(DoctorId);
		
		HttpSession s=request.getSession();
		
		if(NewPassword.equals(ConfirmPassword)) {
			
			if(OldPassword.equals(CurrentPassword)) {
				
				Boolean flag=dd.SetDoctorPassword(DoctorId, NewPassword);
				
				if(flag) {
				
				s.setAttribute("Success","Password Change Successfully");
				response.sendRedirect("DoctorLogin.jsp");
				}
				else {
					s.setAttribute("Error","Server Problem");
					response.sendRedirect("Doctor/DoctorChangePassword.jsp");
				}
			}
			else {
				s.setAttribute("Error","Current Password Invalid");
				response.sendRedirect("Doctor/DoctorChangePassword.jsp");
			}
			
		}
		else {
			s.setAttribute("Error","ConfirmPassword  Not Match");
			response.sendRedirect("Doctor/DoctorChangePassword.jsp");
			
		}
		
	}

}
