package com.project.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.daofiles.StudentDAOImpl;
import com.project.model.Student;


public class AddStudent extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	Student s= new Student(req.getParameter("name"),
			req.getParameter("email"),
			Long.parseLong(req.getParameter("mobile")),
			req.getParameter("branch"));
	
	StudentDAOImpl sdaoi=new StudentDAOImpl();
	int status=sdaoi.insertStudent(s);
	if (status == 1) {
	    req.getSession().setAttribute("statusMessage", "Student added successfully!");
	} else {
	    req.getSession().setAttribute("statusMessage", "Failed to add student.");
	}
	resp.sendRedirect("FetchAll");
}
}
