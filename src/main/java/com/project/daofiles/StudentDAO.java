package com.project.daofiles;

import java.util.List;

import com.project.model.Student;

public interface StudentDAO {
	public List<Student> fetchAll();
	public int insertStudent(Student s);
	public Student fetchOnId(int id);
	public int updateStudent(Student s);
	public List<Student> searchStudents(String searchTerm);
	public int delete(int id);
}
	
