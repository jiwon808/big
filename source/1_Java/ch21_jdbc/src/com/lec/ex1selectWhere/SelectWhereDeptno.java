package com.lec.ex1selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 사용자에게 원하는 부서번호를 입력받아, 부서정보 뿌리기 
public class SelectWhereDeptno {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection   conn = null;
		Statement    stmt = null;
		ResultSet    rs   = null;// select 문 전송 결과만 받기 위한 변수
		Scanner scanner   =  new Scanner(System.in);//사용자에게 물어봐 "몇 번 부서 검색하고 싶니"
		System.out.println("원하는 부서번호는 ?"); //oracle에서 꼭 commit해야  eclipse에서 반영 가능 
		int deptno = scanner.nextInt();
		String       sql = "SELECT * FROM dept where deptno=" +deptno;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs   = stmt.executeQuery(sql); //(4)+(5) 
			if(rs.next()) { // 참이면 해당 부서 있음 (6)
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				System.out.println(deptno+"번 부서의 정보는 다음과 같습니다.");
				System.out.println("부서명: "+dname);
				System.out.println("위치: "+loc);
			} else { // 없으면 해당 부서 없음
				System.out.println("해당 부서가 존재히지 않습니다.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch(Exception e2){
				
			}
		}

	}

}
