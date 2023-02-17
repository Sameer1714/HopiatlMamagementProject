package com.doctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookAppointmentDao;


@WebServlet("/PatientComment")
public class PatientComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("Id"));
		int DoctorId=Integer.parseInt(request.getParameter("DoctorId"));
		String Status=request.getParameter("Status");
		
		BookAppointmentDao bd=new BookAppointmentDao();
		boolean b=bd.UpdatePatientStatus(Status, id, DoctorId);
		
		HttpSession s=request.getSession();
		
		if(b) {
			s.setAttribute("Success", "Comment Succesfully");
			response.sendRedirect("Doctor/PatientView.jsp");
		}
		else {
			s.setAttribute("Error", "Comment Succesfully");
			response.sendRedirect("Doctor/PatientView.jsp");
		}
		
	}

}
