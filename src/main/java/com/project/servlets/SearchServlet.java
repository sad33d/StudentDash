package com.project.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.daofiles.StudentDAO;
import com.project.daofiles.StudentDAOImpl;
import com.project.model.Student;

public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAOImpl(); // Create DAO instance
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query"); // Get search term from input
        List<Student> students = studentDAO.searchStudents(query); // Search students based on query

        // Set the search results as a request attribute
        request.setAttribute("studentList", students);

        // Forward to home.jsp to display results
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
