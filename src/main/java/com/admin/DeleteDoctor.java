package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;

@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Id=Integer.parseInt(request.getParameter("Id"));
		
		DoctorDao dd=new DoctorDao();
		boolean flag=dd.DeleteDoctor(Id);
		
		HttpSession s=request.getSession();
		
		if(flag) {
			response.sendRedirect("Admin/ViewDoctor.jsp");
		}
		else {
			s.setAttribute("Error", "Server Proble Try Again");
			response.sendRedirect("Admin/ViewDoctor.jsp");
		}
	}

}
