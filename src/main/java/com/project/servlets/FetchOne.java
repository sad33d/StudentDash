package com.project.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.daofiles.StudentDAOImpl;
import com.project.model.Student;


public class FetchOne extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("lsdhflhdlhf");
		int id=Integer.parseInt(req.getParameter("id"));
		
		StudentDAOImpl sdimpl=new StudentDAOImpl(); 
		
		Student student=sdimpl.fetchOnId(id);
					
		req.getSession().setAttribute("student", student);
		
		resp.sendRedirect("edit.jsp");
	}

}
