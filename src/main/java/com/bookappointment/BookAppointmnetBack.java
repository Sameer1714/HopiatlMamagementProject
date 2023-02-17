package com.bookappointment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookAppointmentDao;
import com.entity.BookAppointment;

@WebServlet("/BookAppointmnetBack")
public class BookAppointmnetBack extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int PatientId =Integer.parseInt(request.getParameter("PatientId"));
		 String FullName=request.getParameter("FullName");
		 int Age =Integer.parseInt(	request.getParameter("Age"));
		 String Email=request.getParameter("Email");
		 String MobileNumber=request.getParameter("MobileNumber");
		 String AppointmentDate=request.getParameter("AppointmentDate");
		 String Disease=request.getParameter("Disease");
		 int DoctorId =Integer.parseInt(request.getParameter("DoctorId"));
		 String Gender=request.getParameter("Gender");
		 String Address=request.getParameter("Address");
		 String Status="Pending";
		 
		 
		 HttpSession session = request.getSession();
		 
		 BookAppointment ba=new BookAppointment(PatientId, DoctorId, FullName, Age, MobileNumber, Address, Email, AppointmentDate, Disease, Gender, Status);
		 
		 BookAppointmentDao bd=new BookAppointmentDao();
		 boolean flag=bd.BookDoctorAppointmento(ba);
		 
		 if(flag) {
			 session.setAttribute("Success","Appointment Book Successfully");
			 response.sendRedirect("BookAppointment.jsp");
		 }
		 else {
			 session.setAttribute("Error","Server Problem");
			 response.sendRedirect("BookAppointment.jsp");
		 }
		
	}

}
