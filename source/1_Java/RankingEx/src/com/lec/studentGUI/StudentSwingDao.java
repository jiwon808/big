package com.lec.studentGUI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import com.lec.student.StudentDto;

public class StudentSwingDao {
	private String     driver = "oracle.jdbc.driver.OracleDriver"; 
	private String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final int SUCCESS =1; //***************
	public static final int FAIL =0;
	
	private static StudentSwingDao INSTANCE;
	public static  StudentSwingDao getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new StudentSwingDao();
		}
		return INSTANCE;
		
	}
	private StudentSwingDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	//  0. 첫화면에 전공이름들 콤보박스에 추가(mName) : DAO에서 public Vector<String> getMNamelist()
	public Vector<String> getMNamelist(){
		Vector<String> mnames = new Vector<String>(); //*********중요*********
		mnames.add(""); //*********중요*********
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT MNAME FROM MAJOR";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				mnames.add(rs.getString("mname")); //*******rs에서 한줄 한줄  rs.next()   그 result중에서  "mname"이라는 필드를 가져와 *******
						
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
		return mnames;
		
	}
	
	
	
	// 1. 학번검색 (sNo, sName, mName, score) : DAO에서 public StudentSwingDto sNogetStudent(String sNo)
	public StudentSwingDto sNogetStudent(String sNo) {
		//학번은 0명 혹은 1명. 따라서 arraylist필요없음 
		StudentSwingDto dto =null; //**중요****
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT sNO, sName, mName, score" + 
				"    FROM STUDENT S, MAJOR M" + 
				"    WHERE S.mNO = M.mNO AND SNO = ?";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, sNo);
			rs = pstmt.executeQuery();  //select문은 executeQuery
			if(rs.next()) {
				String sName = rs.getString("sName");
				String mName= rs.getString("mName");
				int score=rs.getInt("score");
				dto = new StudentSwingDto(sNo, sName, mName, score); //****중요****
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
		
		return dto;
		
	}
	
	
	//2. 이름검색 (sNo, sName, mName, score)  : 
	// DAO에서 public ArrayList<StudentSwingDto> sNamegetStudent(String sName)
	public ArrayList<StudentSwingDto> selectsName(String sName){
		ArrayList<StudentSwingDto> dtos = new ArrayList<StudentSwingDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT sNO, sName, mName, score" + 
				"    FROM STUDENT S, MAJOR M" + 
				"    WHERE S.mNO = M.mNO AND sNAME = ?";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, sName);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				String sNo = rs.getString("sNo");
				//sName = rs.getString("sName"); 
				String mName= rs.getString("mName");
				int score=rs.getInt("score");
				dtos.add(new StudentSwingDto(sNo, sName, mName, score));
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
	
	

	
	//3. 전공검색 (rank, sName(sNo포함), mName(mNo포함), score) : 
	//DAO에서 public ArrayList<StudentSwingDto> mNamegetStudent(String mName)
	// 출력 : 1 정우성(2021001) 빅데이터학(1) 90 
	public ArrayList<StudentSwingDto> mNamegetStudent(String mName){
		ArrayList<StudentSwingDto> dtos = new ArrayList<StudentSwingDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT ROWNUM RANK, sNAME||'('||sNO||')' sName, mNAME||'('||mNO||')' mNAME, SCORE" + 
				"    FROM (SELECT S.*, MNAME FROM STUDENT S, MAJOR M" + 
				"            WHERE S.mNO=m.mNO AND mNAME=?" + 
				"            ORDER BY SCORE DESC)";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, mName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String sName = rs.getString("sName");
				mName= rs.getString("mName");
				int score=rs.getInt("score");
				dtos.add(new StudentSwingDto(rank, sName, mName, score));
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

	
	
	//4. 학생입력 : DAO에서 public int insertStudent(String sName, String mName, int score)  or 
	//             DAO에서 public int insertStudent(StudentSwingDto dto)

	public int insertStudent(String sName, String mName, int score) { //************중요***
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES" + 
				"    (TO_CHAR(SYSDATE, 'YYYY')" + 
				"    ||TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000'))," + 
				"    ?,(SELECT mNO FROM MAJOR WHERE mNAME=?), ?)";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sName);
			pstmt.setString(2, mName);
			pstmt.setInt(3, score);
			result = pstmt.executeUpdate();
			
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
	
	public int insertStudent(StudentSwingDto dto) { //************중요******
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES" + 
				"    (TO_CHAR(SYSDATE, 'YYYY')" + 
				"    ||TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000'))," + 
				"    ?,(SELECT mNO FROM MAJOR WHERE mNAME=?), ?)";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getsName());
			pstmt.setString(2, dto.getmName());
			pstmt.setInt(3, dto.getScore());
			result = pstmt.executeUpdate();
			
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
	
	
	//5. 학생수정 : DAO에서 public int updateStudent(String sNo, String sName, String mName, int score)  or 
	//             DAO에서 public int updateStudent(StudentSwingDto dto)
	
	
	public int updateStudent(String sNo, String sName, String mName, int score) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE STUDENT SET  sNAME=?, " + 
				"                    mNO=(SELECT mNO FROM MAJOR WHERE mNAME=?)," + 
				"                    SCORE = ?" + 
				"                WHERE SNO=?";
		try {
			conn = DriverManager.getConnection(url, "scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sName);
			pstmt.setString(2, mName);
			pstmt.setInt(3, score);
			pstmt.setString(4, sNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	
	
	public int updateStudent(StudentSwingDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="UPDATE STUDENT SET  sNAME=?, " + 
				"                    mNO=(SELECT mNO FROM MAJOR WHERE mNAME=?)," + 
				"                    SCORE = ? WHERE SNO=?";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getsName());
			pstmt.setString(2, dto.getmName());
			pstmt.setInt(3, dto.getScore());
			pstmt.setString(3, dto.getsNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
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
	
	
	//6. 학생출력 (rank, sName(sNo포함), mName(mNo포함), score) : 
	//DAO에서 public ArrayList<StudentSwingDto> getStudents()
	// 출력 : 1 정우성(2021001) 빅데이터학(1) 90
	public ArrayList<StudentSwingDto> getStudents(){
		ArrayList<StudentSwingDto> dtos = new ArrayList<StudentSwingDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT ROWNUM RANK, sNAME || '('||sNO || ')' sName," + 
				"    mNAME || '(' || mNo || ')' mNAME, SCORE" + 
				"    FROM (SELECT S.*, mNAME  " + 
				"    FROM STUDENT S, MAJOR M" + 
				"    WHERE S.mNO = M.mNO AND sEXPEL=0" + 
				"    ORDER BY SCORE DESC)" ;
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String sName = rs.getString("sName");
				String mName= rs.getString("mName");
				int score=rs.getInt("score");
				dtos.add(new StudentSwingDto(rank, sName, mName, score));
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
	
	
	
	//7. 제적자출력  (rank, sName(sNo포함), mName(mNo포함), score) : 
	//DAO에서 public ArrayList<StudentSwingDto> getStudentsExpel()
	// 출력 : 1 김제적(2021004) 컴퓨터공학(3) 10
	public ArrayList<StudentSwingDto> getStudentsExpel(){
		ArrayList<StudentSwingDto> dtos = new ArrayList<StudentSwingDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql ="SELECT ROWNUM RANK, sNAME || '('|| sNO || ')'  sName," + 
				"    mNAME ||'(' || mNo || ')' mNAME,  SCORE" + 
				"    FROM (SELECT S.*,mNAME FROM STUDENT S, MAJOR M" + 
				"     WHERE S.mNO = M.mNO  AND sEXPEL =1" + 
				"     ORDER BY SCORE DESC)";
		
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			rs   = pstmt.executeQuery(); 
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String sName = rs.getString("sName");
				String mName = rs.getString("mName"); // 파라미터로 입력된 mName이 빅데이터의 경우 여기서의 mName은 빅데이터(1)
				int score = rs.getInt("score");
				dtos.add(new StudentSwingDto(rank, sName, mName, score));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn  !=null) conn.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return dtos;
	}
	
	
	
	// 8. 제적처리 : DAO에서 public int sNoExpel(String sNo)
	
	public int sNoExpel(String sNo) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="UPDATE STUDENT SET sEXPEL =1 WHERE SNO= ?";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
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
	
	
	
	
}
