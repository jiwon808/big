package com.lec.person_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

// PersonDao dao = new PersonDao();      생성자 함수 한번만 생성하면됨 
public class PersonDao {
	private String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
	private String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final int SUCCESS =1; //final이므로 1를 바꿀 수 없음
	public static final int FAIL =0;
	
	private static PersonDao INSTANCE;
	public static PersonDao getInstance() {
		if(INSTANCE==null) {
			INSTANCE = new PersonDao();
		}
		return INSTANCE;
	}
	
	private PersonDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
//1번 insertPerson (PersonDto dto)
	public int insertPerson(PersonDto dto) {
		int result = FAIL;
		//dto값들을 DB에 넣기
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO PERSON VALUES (PERSON_SQ.NEXTVAL,?," + 
				"  (SELECT JNO FROM JOB WHERE JNAME=?),?,?,?)";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getJname());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
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
	
//2번 selectJname (String jname)
	public ArrayList<PersonDto> selectJname(String jname){
		ArrayList<PersonDto> dtos = new ArrayList<PersonDto>();
		Connection         conn = null;
		PreparedStatement pstmt = null;
		ResultSet             rs=null;
		String sql = "SELECT ROWNUM RANK, S.*" + 
				"    FROM(SELECT NAME || '( '||NO||' 번)' NAME, JNAME, KOR, ENG, MATH," + 
				"    KOR+ENG+MATH SUM" + 
				"    FROM PERSON P, JOB J" + 
				"    WHERE P.JNO = J.JNO AND JNAME = ?" + 
				"    ORDER BY SUM DESC) S";
		//jname 직업인 사람들 리스트 dtos에 add하기
		//select에 있는 내용을 arraylist에 담아서 return
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jname); //'sql'은 select문이어서  rs사용
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String name = rs.getString("name");
				//jname = rs.getString("jname");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int math = rs.getInt("math");
				int sum = rs.getInt("sum");
				dtos.add(new PersonDto(rank, name, jname, kor, eng, math, sum));
			}
			
		} catch (SQLException e) {
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
	
	
//3번 selectAll()
	public ArrayList<PersonDto> selectAll(){
		ArrayList<PersonDto> dtos = new ArrayList<PersonDto>();
		Connection         conn = null;
		PreparedStatement pstmt = null;
		ResultSet             rs=null;
		String sql = "SELECT ROWNUM RANK, S.*" + 
				"    FROM(SELECT NAME || '( '||NO||' 번)' NAME, JNAME, KOR, ENG, MATH," + 
				"    KOR+ENG+MATH SUM" + 
				"    FROM PERSON P, JOB J" + 
				"    ORDER BY SUM DESC) S ";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String name = rs.getString("name");
				String jname = rs.getString("jname");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int math = rs.getInt("math");
				int sum = rs.getInt("sum");
				dtos.add(new PersonDto(rank, name, jname, kor, eng, math, sum));
			}
			
		} catch (SQLException e) {
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
	public Vector<String> jnamelist(){    //'배우,가수'가 들어가       //gui에 두번째칸
		Vector<String> jnames = new Vector<String>(); //생성
		// 직업들 리스트를jname에 add하기       select모들아니면 jname from job
		jnames.add("");
		String sql = "SELECT JNAME FROM JOB";   //(1)이것을 받아서 jnames에 넣어
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn  = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			rs    =  pstmt.executeQuery();    //select문이므로 rs, executeQuery
			while (rs.next()){
				jnames.add(rs.getString("jname"));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} //close try-catch
		} //전체 db연결 try catch
		return jnames;
	} //jnamelist()
} //class
