package com.project.daofiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.project.dbUtils.MyConnect;
import com.project.model.Student;

public class StudentDAOImpl implements StudentDAO {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet resultSet;
    private int status;

    // SQL Queries
    private static final String fetchAll = "SELECT * FROM `student`";
    private static final String fetchOnId = "SELECT * FROM `student` WHERE `id`=?";
    private static final String addStudent = "INSERT INTO `student`(`name`, `email`, `mobile`, `branch`) VALUES(?, ?, ?, ?)";
    private static final String updateStudent = "UPDATE `student` SET `name`=?, `mobile`=?, `branch`=? WHERE id=?";
    private static final String searchQuery = "SELECT * FROM `student` WHERE `name` LIKE ? OR CAST(`id` AS CHAR) LIKE ?";
    private static final String deleteStudent = "DELETE FROM `student` WHERE id=?";

    public StudentDAOImpl() {
        try {
            con = MyConnect.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int insertStudent(Student s) {
        try {
            pstmt = con.prepareStatement(addStudent);
            pstmt.setString(1, s.getName());
            pstmt.setString(2, s.getEmail());
            pstmt.setLong(3, s.getMobile());
            pstmt.setString(4, s.getBranch());

            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(pstmt, null);
        }
        return status;
    }

    @Override
    public List<Student> fetchAll() {
        List<Student> studentList = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(fetchAll);
            resultSet = pstmt.executeQuery();

            studentList = extractStudentListFromResultSet(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(pstmt, resultSet);
        }
        return studentList;
    }

    @Override
    public Student fetchOnId(int id) {
        Student student = null;
        try {
            pstmt = con.prepareStatement(fetchOnId);
            pstmt.setInt(1, id);
            resultSet = pstmt.executeQuery();

            List<Student> studentList = extractStudentListFromResultSet(resultSet);
            if (!studentList.isEmpty()) {
                student = studentList.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(pstmt, resultSet);
        }
        return student;
    }

    private List<Student> extractStudentListFromResultSet(ResultSet result) {
        List<Student> students = new ArrayList<>();
        try {
            while (result.next()) {
                students.add(new Student(
                    result.getInt("id"),
                    result.getString("name"),
                    result.getString("email"),
                    result.getLong("mobile"),
                    result.getString("branch")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public int updateStudent(Student s) {
        try {
            pstmt = con.prepareStatement(updateStudent);
            pstmt.setString(1, s.getName());
            pstmt.setLong(2, s.getMobile());
            pstmt.setString(3, s.getBranch());
            pstmt.setInt(4, s.getId());

            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(pstmt, null);
        }
        return status;
    }

    @Override
    public List<Student> searchStudents(String searchTerm) {
        List<Student> searchedStudents = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(searchQuery);
            String queryPattern = "%" + searchTerm + "%";
            pstmt.setString(1, queryPattern);
            pstmt.setString(2, queryPattern);
            resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                searchedStudents.add(new Student(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getLong("mobile"),
                    resultSet.getString("branch")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return searchedStudents;
    }

    @Override
    public int delete(int id) {
        try {
            pstmt = con.prepareStatement(deleteStudent);
            pstmt.setInt(1, id);
            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(pstmt, null);
        }
        return status;
    }

    private void closeResources(Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
