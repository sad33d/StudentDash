package com.project.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.daofiles.StudentDAOImpl;
import com.project.model.Student;


public class FetchAll extends HttpServlet {
	private List<Student> studentList;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAOImpl sdimpl=new StudentDAOImpl();
		studentList =sdimpl.fetchAll();

		req.getSession().setAttribute("studentList", studentList);

		// Retrieve and forward status message
		String statusMessage = (String) req.getSession().getAttribute("statusMessage");
		req.getSession().removeAttribute("statusMessage");
		req.setAttribute("statusMessage", statusMessage);

		req.getRequestDispatcher("home.jsp").forward(req, resp);
	}
}
