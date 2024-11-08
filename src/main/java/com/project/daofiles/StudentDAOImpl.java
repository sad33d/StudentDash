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
	String fetchAll=" select * from `student`";
	String fetchOnId="select * from `student` where `id`=?";
	String addStudent="insert into `student`(`name`,`email`,`mobile`,`branch`) values(?,?,?,?)";
	String updateStudent="update `student` set `name`=?,`mobile`=?,`branch`=? where id=?";
	String deleteStudent="delete from `student` where id=? ";
	private Statement stmt;
	private ResultSet resultSet;
	List<Student> studentList=new ArrayList<Student>();
	private PreparedStatement pstmt;
	private int status;

	public StudentDAOImpl() {
		try {
			con=MyConnect.connect();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int insertStudent(Student s) {
		try {
			pstmt=con.prepareStatement(addStudent);
			pstmt.setString(1,s.getName() );
			pstmt.setString(2,s.getEmail() );
			pstmt.setLong(3,s.getMobile() );
			pstmt.setString(4,s.getBranch() );
			
			status=pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	@Override
	public List<Student> fetchAll() {
		try {
			stmt=con.createStatement();
			resultSet=stmt.executeQuery(fetchAll);
			
			return extractStudentListFromResusltSet(resultSet);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public Student fetchOnId(int id) {
		try {
			
			pstmt=con.prepareStatement(fetchOnId);
			pstmt.setInt(1,id);
			resultSet=pstmt.executeQuery();
			
			studentList=extractStudentListFromResusltSet(resultSet);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentList.get(0);
		
	}
	
	List<Student> extractStudentListFromResusltSet(ResultSet result) {
		try {
			while(result.next()) {
				studentList.add(new Student(resultSet.getInt("id"),
						resultSet.getString("name"),
						resultSet.getString("email"),
						resultSet.getLong("mobile"),
						resultSet.getString("branch")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentList;
	}
	
	public int updateStudent(Student s){
		try {
			pstmt=con.prepareStatement(updateStudent);
			pstmt.setString(1, s.getName());
			pstmt.setLong(2, s.getMobile());
			pstmt.setString(3, s.getBranch());
			pstmt.setInt(4, s.getId());
			status=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}



	public int delete(int id) {
		try {
			
			pstmt=con.prepareStatement(deleteStudent);
			pstmt.setInt(1, id);
			
			status=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

}
