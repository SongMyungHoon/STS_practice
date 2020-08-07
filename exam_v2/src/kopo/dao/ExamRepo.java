package kopo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kopo.domain.ExamRIO;

public class ExamRepo {
	public static Connection getConnection() {
		Connection con = null;
		final String id = "root";
		final String password = "qortjf90";
		final String accessURL = "jdbc:mysql://192.168.23.110:33060/"
				+ "?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul"
				+ "&allowPublicKeyRetrieval=true&useSSL=false";
		final String dbName = "koposw26";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(accessURL, id, password);
			con.setCatalog(dbName); // using database
		} catch (Exception e) {System.out.println(e);}
		return con;
	}
	
	public static int createDB() {
		int status = 0;
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String query = "create table examtable("
					+ "name varchar(20),"
					+ "studentId int not null primary key,"
					+ "kor int, eng int, mat int);";
			stmt.executeUpdate(query);
			stmt.close();
			con.close();
		} catch (Exception e) { System.out.println(e); }
		return status;
	}
	
	public static int dropDB() {
		int status = 0;
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("drop table examtable;");
			stmt.close();
			con.close();
		} catch (Exception e) {System.out.println(e);}
		return status;
	}
	
	public static int insert(ExamRIO u) {
		int status = 0;
		String query = "insert into examtable(name, studentId, kor, eng, mat) "
				+ "values (?, ?, ?, ?, ?)";
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,  u.getName());
			ps.setInt(2,  u.getStudentId());
			ps.setInt(3,  u.getKor());
			ps.setInt(4,  u.getEng());
			ps.setInt(5,  u.getMat());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {System.out.println(e);}
		return status;
	}
	
	public static int update(ExamRIO u) {
		int status = 0;
		String query = "update examtable set name=?, studentId=?, kor=?, eng=?, mat=? where studentId=?";
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setInt(2, u.getStudentId());
			ps.setInt(3, u.getKor());
			ps.setInt(4, u.getEng());
			ps.setInt(5, u.getMat());
			ps.setInt(6, u.getStudentId());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {System.out.println(e);}
		return status;
	}
	
	public static int delete(ExamRIO u) {
		int status = 0;
		String query = "delete from examtable where studentId = ?";
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, u.getStudentId());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch(Exception e) {System.out.println(e);}
		return status;
	}
	
	public static List<ExamRIO> getAllRecord() {
		List<ExamRIO> list = new ArrayList<ExamRIO>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from examtable");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ExamRIO u = new ExamRIO();
				u.setName(rs.getString("name"));
				u.setStudentId(rs.getInt("studentId"));
				u.setKor(rs.getInt("kor"));
				u.setEng(rs.getInt("eng"));
				u.setMat(rs.getInt("mat"));
				list.add(u);
			}
			rs.close();
			ps.close();
			con.close();
		} catch(Exception e) {System.out.println(e);}
		
		return list;
	}
	
	public static ExamRIO getRecordById(int id) {
		ExamRIO u = new ExamRIO();
		String query = "select * from examtable where studentid=?";
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u.setName(rs.getString("name"));
				u.setStudentId(rs.getInt("studentId"));
				u.setKor(rs.getInt("kor"));
				u.setEng(rs.getInt("eng"));
				u.setMat(rs.getInt("mat"));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {System.out.println(e);}
		return u;
	}
}
