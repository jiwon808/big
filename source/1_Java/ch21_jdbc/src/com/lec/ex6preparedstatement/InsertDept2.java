package com.lec.ex6preparedstatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertDept2 {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection         conn = null;
		PreparedStatement pstmt = null; 
		ResultSet 			rs  = null;
		Scanner scanner = new Scanner(System.in);
		String insertSql = "INSERT INTO DEPT VALUES (?,?,?)"; //*****중요****
		String selectSql = "SELECT * FROM DEPT WHERE DEPTNO=?"; //*****중요****
		
		System.out.println("추가할 부서번호는 ?");
		int deptno = scanner.nextInt();
		//해당 부서번호가 있는지 확인 후 부서 추가
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, deptno); //1st물음표에 deptno
			rs = pstmt.executeQuery();
			if(!rs.next()) { //추가가능   (그 부서 번호가 없기때문에 추가가능)
				System.out.println("추가할 부서이름은 ?");
				String dname = scanner.next();
				System.out.println("추가할 부서의 위치는 ?");
				scanner.nextLine();
				String loc = scanner.nextLine();
				rs.close(); //*****중요****
				pstmt.close(); //sql문이 바꿔서 이거 닫고 밑에 새로 생성
				pstmt = conn.prepareStatement(insertSql);
				pstmt.setInt(1, deptno);
				pstmt.setString(2, dname);
				pstmt.setString(3, loc);
				
				int result = pstmt.executeUpdate();
				System.out.println(result>0? deptno+"번 부서 추가 성공": "추가실패");
			} else {
				System.out.println("중복된 부서번호는 추가가 불가합니다");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(deptno+"번 추가 실패");
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}  

	}

}

