package com.lec.ex6preparedstatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

// 1. 삭제할 부서번호를 입력받기
// 2-1. 입력한 부서번호가 있을 경우 "진짜XX번 부서를 삭제하시겠습니까"
// 2-1-1. Y:삭제   --> 삭제완료 메세지      그 외: 삭제 안하고 종료  
// 2-2  입력한 부서번호가 없으면 없다하고 종료  
public class DeleteDept {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs 			= null;  
		Scanner scanner = new Scanner(System.in);
		String selectSql = "SELECT * FROM DEPT WHERE DEPTNO=?";
		String deleteSql = "DELETE FROM DEPT WHERE DEPTNO=?";
		
		System.out.println("삭제할 부서번호는?");
		int deptno = scanner.nextInt();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1,deptno); //위 1st 물음표
			rs = pstmt.executeQuery();
			if(rs.next()) { //삭제 진행
				System.out.println(deptno+"번 부서를 진짜 삭제하시겠습니까?");
				String answer = scanner.next(); //answer가 Y이면 삭제
				if(answer.equalsIgnoreCase("y")) {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(deleteSql);
					pstmt.setInt(1, deptno);
					int result = pstmt.executeUpdate();
					System.out.println(result>0? deptno+"번 부서 삭제성공":"삭제 실패");
				}
			}else {
				System.out.println("해당 부서번호의 부서는 존재하지 않습니다");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) pstmt.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		

	}

}
