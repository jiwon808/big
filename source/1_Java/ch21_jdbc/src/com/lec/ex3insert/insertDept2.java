package com.lec.ex3insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class insertDept2 {
	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		System.out.print("입력할 부서번호는?");
		int deptno = scanner.nextInt();
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		String selectsql = "SELECT * FROM DEPT WHERE DEPTNO = 60"+deptno; //숫자라서 ''신경쓸 필요 없음
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs   = stmt.executeQuery(selectsql); // (4)+(5)
			if(rs.next()) {
				System.out.println("중복된 부서번호는 입력이 불가합니다.");
			}else {
				System.out.print("입력할 부서이름은 ?");
				String dname = scanner.next();
				System.out.print("입력할 부서위치는 ?");
				scanner.nextLine(); // '\n' 버퍼 clear
				String loc = scanner.nextLine();
				String insertSql = String.format("INSERT INTO DEPT VALUES(%d,'%s','%s')", 
																		deptno,dname,loc); // INSERT INTO DEPT VALUES(60,'MARKETING','INCHON');
				int result = stmt.executeUpdate(insertSql);
				System.out.println(result>0? "입력성공": "입력실패"); 
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			} // 연결해제 try-catch
		} 
		
	} //main
} // class
