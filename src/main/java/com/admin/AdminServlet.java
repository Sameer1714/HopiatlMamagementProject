package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Email = request.getParameter("Email");
		String Password = request.getParameter("Password");

		HttpSession s1 = request.getSession();

		if (Email.equals("admin@gmail.com") && Password.equals("admin")) {

			s1.setAttribute("Success", "admin");
			response.sendRedirect("Admin/AdminDashboard.jsp");
		} else {

			s1.setAttribute("Error", "Incorrect Email or Password..!");
			response.sendRedirect("AdminLogin.jsp");

		}

	}

}
