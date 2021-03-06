package kopo.service;

import java.util.List;

import kopo.dto.ExamSIO;

public interface ExamService {
	// createDB & dropDB
	void createDB();
	void dropDB();
	void allsetDB();
	
	// Read
	ExamSIO selectOne(int id);
	List<ExamSIO> selectAll();
	List<ExamSIO> selectAllByName(String name);
	
	// Update
	int insert(ExamSIO examSIO);
	int update(int id, ExamSIO examSIO);
	int update(ExamSIO examSIO);
	
	// Delete
	int delete(int id);
	int delete(ExamSIO examSIO);
}
