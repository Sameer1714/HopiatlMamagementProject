package com.patient_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.PatientDao;

/**
 * Servlet implementation class PatientChangePassword
 */
@WebServlet("/PatientChangePassword")
public class PatientChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int PatientId=Integer.parseInt(request.getParameter("PatientId"));
		String OldPassword=request.getParameter("OldPassword");
		String NewPassword=request.getParameter("NewPassword");
		String ConfirmPassword=request.getParameter("ConfirmPassword");
		
		PatientDao pd=new PatientDao();
		String CurrentPassword=pd.getPatientPassword(PatientId);
		
		HttpSession s=request.getSession();
		
		if(NewPassword.equals(ConfirmPassword)) {
			
			if(OldPassword.equals(CurrentPassword)) {
				
				Boolean flag=pd.SetPatientPassword(PatientId, NewPassword);
				
				if(flag) {
				
				s.setAttribute("Success","Password Change Successfully");
				response.sendRedirect("PatientLogin.jsp");
				}
				else {
					s.setAttribute("Error","Server Problem");
					response.sendRedirect("PatientChangePassword.jsp");
				}
			}
			else {
				s.setAttribute("Error","Current Password Invalid");
				response.sendRedirect("PatientChangePassword.jsp");
			}
			
		}
		else {
			s.setAttribute("Error","ConfirmPassword  Not Match");
			response.sendRedirect("PatientChangePassword.jsp");
			
		}
		
		
	}

}
