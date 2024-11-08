package com.project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.daofiles.StudentDAOImpl;


public class Delete extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));		
		StudentDAOImpl sdaoi=new StudentDAOImpl();
		int status=sdaoi.delete(id);
		if (status != 0) {
		    req.getSession().setAttribute("statusMessage", "Deleted successfully!");
		} else {
		    req.getSession().setAttribute("statusMessage", "Failed to Delete.");
		}
		resp.sendRedirect("FetchAll");
	}

}
