package com.lec.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentDao {
// int insertStudent (String sName, mName, score)
// ArrayList<StudentDto> selectMname (String mName)
// ArrayList<StudentDto> selectStudent()
// ArrayList<StudentDto> selectExpel()

	private String     driver = "oracle.jdbc.driver.OracleDriver"; 
	private String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final int SUCCESS =1; //***************
	public static final int FAIL =0;
	
	private static StudentDao INSTANCE;
	public static  StudentDao getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new StudentDao();
		}
		return INSTANCE;
		
	}
	private StudentDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
// 1번 insertStudent 
	public int insertStudent(StudentDto dto) {
		int result = FAIL;
		//dto값을 DB에 넣기
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )), " + 
				"                                ?, " + 
				"                                (SELECT mNO FROM MAJOR WHERE mNAME = ?),?,0) ";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getsName());
			pstmt.setString(2, dto.getmName());
			pstmt.setInt(3, dto.getScore());
			result = pstmt.executeUpdate(); //**********중요**이거뺴버리면 return안됨***
			
			
		} catch(Exception e){
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	

//2번  ArrayList<StudentDto> selectMname (String mName)
	public ArrayList<StudentDto> selectmName(String mName){
		ArrayList<StudentDto> dtos = new ArrayList<StudentDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT ROWNUM RANK, S.*" + 
				"    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE" + 
				"    FROM MAJOR M, STUDENT S" + 
				"    WHERE M.mNO = S.mNO AND mNAME= ?" + 
				"    ORDER BY SCORE DESC) S";  //******같은 이름인 sql로 할수 있는 이유: 변수 선언은 {}빠져나가면  무효. 따라서 뒤에 똑같은 이름으로 변수 선언해도 상관없음***********
		//mName 출신 학과 학생들 이스트 dtos에 add하기
		// select에 있는 내용을 arraylist에 담아서 return
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, mName);
			rs = pstmt.executeQuery();  //select문은 executeQuery
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String sName = rs.getString("sName");
				mName= rs.getString("mName");
				int score=rs.getInt("score");
				dtos.add(new StudentDto(rank, sName, mName, score));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	
	
	

//3번  ArrayList<StudentDto> selectStudent()
	public ArrayList<StudentDto> selectStudent(){
		ArrayList<StudentDto> dtos = new ArrayList<StudentDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT ROWNUM RANK, S.*" + 
				"    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE" + 
				"    FROM MAJOR M, STUDENT S" + 
				"    WHERE M.mNO = S.mNO" + 
				"    ORDER BY SCORE DESC) S";  //******같은 이름인 sql로 할수 있는 이유: 변수 선언은 {}빠져나가면  무효. 따라서 뒤에 똑같은 이름으로 변수 선언해도 상관없음***********
		//mName 출신 학과 학생들 이스트 dtos에 add하기
		// select에 있는 내용을 arraylist에 담아서 return
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String sName = rs.getString("sName");
				String mName= rs.getString("mName");
				int score=rs.getInt("score");
				dtos.add(new StudentDto(rank, sName, mName, score));

				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
		
//4번  ArrayList<StudentDto> selectExpel()
	public ArrayList<StudentDto> selectExpel(){
		ArrayList<StudentDto> dtos = new ArrayList<StudentDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT ROWNUM RANK, S.*" + 
				"    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE" + 
				"    FROM MAJOR M, STUDENT S" + 
				"    WHERE M.mNO = S.mNO AND S.sEXPEL=1" + 
				"    ORDER BY SCORE DESC) S";  
		//mName 출신 학과 학생들 이스트 dtos에 add하기
		// select에 있는 내용을 arraylist에 담아서 return
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String sName = rs.getString("sName");
				String mName= rs.getString("mName");
				int score=rs.getInt("score");
				dtos.add(new StudentDto(rank, sName, mName, score));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	
	
	
	
	
	
	
	
	
	
	

	

	
} //class
