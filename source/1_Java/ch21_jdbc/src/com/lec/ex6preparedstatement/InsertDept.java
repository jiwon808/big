package com.lec.ex6preparedstatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertDept {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		System.out.println("추가할 부서번호는 ?");
		int deptno = scanner.nextInt();
		System.out.println("추가할 부서이름은 ?");
		String dname = scanner.next();
		System.out.println("추가할 부서의 위치는 ?");
		scanner.nextLine();
		String loc = scanner.nextLine();
		
		//DB접속해서 INSERT실행    
		String sql = "INSERT INTO DEPT VALUES (?,?,?)";  //*****중요****
		Connection         conn = null;
		PreparedStatement pstmt = null; 
		try {
			Class.forName(driver);
			 conn= DriverManager.getConnection(url,"scott","tiger");//(1)
			 pstmt= conn.prepareStatement(sql);
			 pstmt.setInt(1,deptno); //deptno변수가 int라 setInt   
			 pstmt.setString(2,dname); 
			 pstmt.setString(3, loc);
			 // int result = stmt.executeUpdate(sql);
			 int result = pstmt.executeUpdate();
			 System.out.println(result>0? deptno+"입력성공":"입력실패");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(deptno+"번 입력실패");
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
