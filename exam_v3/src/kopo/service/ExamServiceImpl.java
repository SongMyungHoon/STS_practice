package kopo.service;

import java.util.ArrayList;
import java.util.List;

import kopo.dao.ExamRepo;
import kopo.domain.ExamRIO;
import kopo.dto.ExamSIO;

public class ExamServiceImpl implements ExamService {

	@Override
	public void createDB() {
		ExamRepo.createDB();
	}

	@Override
	public void dropDB() {
		ExamRepo.dropDB();
		
	}

	@Override
	public void allsetDB() {
		this.insert(new ExamSIO("나연",209901,95,100,95));
		this.insert(new ExamSIO("정연",209902,95,95,95));
		this.insert(new ExamSIO("모모",209903,100,100,100));
		this.insert(new ExamSIO("사나",209904,100,95,90));
		this.insert(new ExamSIO("지효",209905,80,100,70));
		this.insert(new ExamSIO("미나",209906,100,100,70));
		this.insert(new ExamSIO("다현",209907,70,70,70));
		this.insert(new ExamSIO("채영",209908,80,75,72));
		this.insert(new ExamSIO("쯔위",209909,79,79,82));
	}

	@Override
	public ExamSIO selectOne(int id) {
		ExamRIO examRIO = ExamRepo.getRecordById(id);
		
		return new ExamSIO(
				examRIO.getName(), examRIO.getStudentId()
				, examRIO.getKor(), examRIO.getEng(), examRIO.getMat()
			);
	}

	@Override
	public List<ExamSIO> selectAll() {
		List<ExamRIO> examRIOs = ExamRepo.getAllRecord();
		List<ExamSIO> examSIOs = new ArrayList<>();
		for (ExamRIO examRIO : examRIOs) {
			examSIOs.add(new ExamSIO(
					examRIO.getName(), examRIO.getStudentId()
					, examRIO.getKor(), examRIO.getEng(), examRIO.getMat()
				));
			
		}
		return examSIOs;
	}

	@Override
	public List<ExamSIO> selectAllByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(ExamSIO examSIO) {
		
		return ExamRepo.insert(
				new ExamRIO(examSIO.getName(), examSIO.getStudentId()
						, examSIO.getKor(), examSIO.getEng(), examSIO.getMat())
				);
	}

	@Override
	public int update(int id, ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
