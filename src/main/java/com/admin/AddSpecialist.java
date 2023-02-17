package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;

@WebServlet("/AddSpecialist")
public class AddSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String SpecialistName = request.getParameter("SpecialistName");

		SpecialistDao sd = new SpecialistDao();

		boolean flag = sd.AddSpecialistName(SpecialistName);

		HttpSession s = request.getSession();

		if (flag) {
			s.setAttribute("SuccessSp", "Specialist Added SuccessFully");
			response.sendRedirect("Admin/AdminDashboard.jsp");
		} else {
			s.setAttribute("Error", "Specialist Already Exist");
			response.sendRedirect("Admin/AdminDashboard.jsp");
		}

	}

}
