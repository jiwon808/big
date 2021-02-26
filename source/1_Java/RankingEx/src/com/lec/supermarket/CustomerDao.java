package com.lec.supermarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import com.lec.studentGUI.StudentSwingDto;

public class CustomerDao {
	private String     driver = "oracle.jdbc.driver.OracleDriver"; 
	private String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final int SUCCESS =1; //***************
	public static final int FAIL =0;
	
	private static CustomerDao INSTANCE;
	public static CustomerDao getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new CustomerDao();
		}
		return INSTANCE;
	}
	
	private CustomerDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
	}

	
//0. levelNAMES(레벨이름들):  public Vector<String> getLevelNames()
	public Vector<String> getLevelNames(){
		Vector<String> levelNames = new Vector<String>();
		levelNames.add(""); // ************combo박스 첫번째 방 '빈방'!****
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT LEVELNAME FROM CUS_LEVEL" + 
				"    ORDER BY LEVELNO";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				levelNames.add(rs.getString("levelName"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return levelNames;
		
	}
	
//-- 1. cId로 검색 : public CustomerDto cIdGetCustomers(int cId)   
//    --아이디 한명밖에 없어서 arraylist사용할 필요없음   --실행화면에 cID로 검색하면 ' cID, cTEL, cPOINT,cAMOUNT, LEVELNAME ' 다 나옴	
	public CustomerDto cIdGetCustomers(int cId) { //****?****
		CustomerDto dto = null;
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT cID, cTEL, cNAME,cPOINT,cAMOUNT, LEVELNAME," + 
				"    (SELECT HIGH-CAMOUNT+1" + 
				"        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP" + 
				"    FROM CUSTOMER C, CUS_LEVEL L" + 
				"    WHERE C.LEVELNO= L.LEVELNO AND cID =? ";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, cId);
			rs= pstmt.executeQuery();
			if(rs.next()) {                         //*********한줄 - if문을 써       ||   여러줄 -while문 ***********
				String cTel = rs.getString("cTel");
				String cName = rs.getString("cName");
				int cPoint = rs.getInt("cPoint");
				int cAmount = rs.getInt("cAmount");
				String levelName = rs.getString("levelName");
				int forLevelup = rs.getInt("forLevelup");
				dto= new CustomerDto(cId,cTel,cName, cPoint,cAmount, levelName,forLevelup); //****Arraylist아니므로  dto.add (x)   dto = new CustomerDto(); 
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
		
	}
	
	
	
//-- 2. 폰뒤4자리(FULL) 검색 - CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을 위한 쓸 돈
 //public ArrayList<CustomerDto> cTelGetCustomers(String cTel);   --*()안에는 폰4자리들어와야
	public ArrayList<CustomerDto> cTelGetCustomers(String cTel){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>(); //*****CustomerDto의 무엇을 가져오는지??***
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT cID, cTEL,cNAME, cPOINT,cAMOUNT, LEVELNAME," + 
				"    (SELECT HIGH-CAMOUNT+1" + 
				"        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP" + 
				"    FROM CUSTOMER C, CUS_LEVEL L" + 
				"    WHERE C.LEVELNO= L.LEVELNO AND cTEL LIKE '%'|| ? ";  //****주의: '?' (x)  ? (o)
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, cTel);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				int cId      = rs.getInt("cId");
				cTel = rs.getString("cTel");
				String cName = rs.getString("cName");
				int cPoint = rs.getInt("cPoint");
				int cAmount = rs.getInt("cAmount");
				String levelName = rs.getString("levelName");
				int forLevelup = rs.getInt("forLevelup");
				dtos.add(new CustomerDto(cId, cTel, cName, cPoint, cAmount, levelName, forLevelup)); 
								//**화면 출력시 결과들 나오게. 그럼 순서 중요한지???*************
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
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

	
	
/*-- 3. 고객이름검색 - CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을 위한 쓸 돈          --*실행화면 보면 3번째 칸
--                       public ArrayList<CustomerDto> cNameGetCustomers(String cName);*/
	public ArrayList<CustomerDto> cNameGetCustomers(String cName){  //**밑에arraylist사용하기 위해 선언하는건지??**
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT cID, cTEL,cName, cPOINT,cAMOUNT, LEVELNAME," + 
				"    (SELECT HIGH-CAMOUNT+1" + 
				"        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP" + 
				"    FROM CUSTOMER C, CUS_LEVEL L" + 
				"    WHERE C.LEVELNO= L.LEVELNO AND cNAME = ?";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cId = rs.getInt("cId");
				String cTel = rs.getString("cTel");
				int cPoint = rs.getInt("cPoint");
				int cAmount= rs.getInt("cAmount");
				String levelName = rs.getString("levelName");
				int forLevelup = rs.getInt("forLevelup"); //*******?***********
				dtos.add(new CustomerDto(cId, cTel, cName, cPoint, cAmount, levelName, forLevelup));
				
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

	
	
//-- 4. 포인트로만 구매(1000원짜리를 포인트로만 구매) : public int buyWithPoint(int cAmount, int cId)   *성공하면1, 실패하면 0
	public int buyWithPoint (int cAmount, int cId) {
		//**buyWithPoint는 내가 만든 이름. 이를int변수로 선언. 여기서 (int cAmount, int cId)를 가져와라 *****??****
		int result = FAIL;  //*********INT이므로 바로 여기로 떨어지는지 ?*****
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER SET CPOINT = CPOINT - ? WHERE CID=?";
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cAmount);
			pstmt.setInt(2, cId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		return result; //return ==여기서끝
		
	}
	
	
//-- 5. 물품구매 (1000000원짜리를 구매할 경우. 포인트는 구매금액의 5%)      
	public int updatePoint(int cId, int cAmount) { //**() 안에  가져올 내용만 입력 / 
														//(POINT,CAMOUNT,LEVELNO변경) 은 DB에서 변경한 내용. 여기와 무관
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = " UPDATE CUSTOMER  SET CPOINT = CPOINT + ?*0.05," + 
				"                      CAMOUNT = CAMOUNT + ?," + 
				"                       LEVELNO = ( " + 
				"                            SELECT L.LEVELNO 바꿔야할레벨" + 
				"                              FROM CUSTOMER C, CUS_LEVEL L" + 
				"                              WHERE CAMOUNT + ? BETWEEN LOW AND HIGH" + 
				"                              AND CID=?)" + 
				"                WHERE CID =? ";
		try {
			conn = DriverManager.getConnection(url, "scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cAmount);
			pstmt.setInt(2, cAmount);
			pstmt.setInt(3, cAmount);
			pstmt.setInt(4, cId);
			pstmt.setInt(5, cId);
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

	
/*-- 6. 등급별출력 - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈
--              public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)*/
	public ArrayList<CustomerDto> levelNameGetCustomers(String levelName){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT cID, cTEL, cNAME,cPOINT,cAMOUNT, LEVELNAME," + 
				"    (SELECT HIGH-CAMOUNT+1 " + 
				"        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP" + 
				"    FROM CUSTOMER C, CUS_LEVEL L" + 
				"    WHERE C.LEVELNO= L.LEVELNO AND levelNAME = ?" + 
				"    ORDER BY CAMOUNT DESC"; 
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, levelName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cId = rs.getInt("cId");
				String cTel = rs.getString("cTel");
				String cName = rs.getString("cName");
				int cPoint = rs.getInt("cPoint");
				int cAmount = rs.getInt("cAmount");
				int forLevelup= rs.getInt("forLevelup");
				dtos.add(new CustomerDto(cId, cTel, cName, cPoint, cAmount, levelName, forLevelup));	
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
	
	

/*-- 7.전체출력 - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈     *(실행화면 밑에 라인 버튼의 2번째)
--            public ArrayList<CustomerDto> getCustomers()        */
	 public ArrayList<CustomerDto> getCustomers(){
		ArrayList<CustomerDto> dtos = new  ArrayList<CustomerDto>(); //****???dto의 getCustomers들을 arraylist에 넣는게 맞는지?
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String sql = "SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME," + 
				"    (SELECT HIGH-CAMOUNT+1" + 
				"        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP" + 
				"    FROM CUSTOMER C, CUS_LEVEL L" + 
				"    WHERE C.LEVELNO= L.LEVELNO" + 
				"    ORDER BY CAMOUNT DESC";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			rs   = pstmt.executeQuery(); 
			while(rs.next()) {
				int cId = rs.getInt("cId");
				String cTel = rs.getString("cTel");
				String cName = rs.getString("cName");
				int cPoint = rs.getInt("cPoint");
				int cAmount= rs.getInt("cAmount");
				String levelName = rs.getString("levelName");
				int forLevelup = rs.getInt("forLevelup");
				dtos.add(new CustomerDto(cId, cTel, cName, cPoint, cAmount, levelName,forLevelup) );
			} // *******************??**********************
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
		 return dtos;  //************다시 위 arraylist에 들어가는게 맞는지?**********
		 
	 }
	
	
	
/*-- 8. 회원가입(고객전화와 고객이름은 입력받아 INSERT)
--          public int insertCustomer(String cTel, String cName)*/
	 public int insertCustomer(String cTel, String cName) {
		 int result = FAIL;
		 Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO CUSTOMER (cID, cTEL,cNAME) VALUES (CUSTOMER_SEQ.NEXTVAL, ?,?)";
			try {
				conn = DriverManager.getConnection(url,"scott","tiger");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cTel);
				pstmt.setString(2, cName);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;	
			
	 }

	 
/*-- 9. 번호수정 : public int updateCustomer(String cTel, int cId)*/
	
	 public int updateCustomer(String cTel, int cId) {
		 int result = FAIL;
		 Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "UPDATE CUSTOMER SET CTEL = ? WHERE CID=?";
			try {
				conn = DriverManager.getConnection(url,"scott","tiger");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cTel);
				pstmt.setInt(2, cId);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;	
			
	 }
	 
	 
	 
	 
/*-- 10. 회원탈퇴 : public int deleteCustomer(int cId)*/
	
	 public int deleteCustomer(int cId) {
		 int result = FAIL;
		 Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "DELETE FROM CUSTOMER WHERE CID=?";
			try {
				conn = DriverManager.getConnection(url,"scott","tiger");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cId);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;	
			
	 }
	
	
	
}//class
