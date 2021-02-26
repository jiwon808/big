package com.lec.ex3insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class insertDept {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		System.out.print("입력할 부서번호는?");
		int deptno = scanner.nextInt();
		System.out.println("입력할 부서이름은 ?");
		String dname = scanner.next();
		System.out.print("입력할 부서의 위치는 ?");
		scanner.nextLine(); // '/n'이있는 버퍼 clear
		String loc = scanner.next(); // seoul korea
		Connection conn = null;
		Statement stmt = null; //rs는 필요없음 select문이 아니기때문에
		//String sql = "INSERT INTO DEPT VALUES("  +deptno+  ",'"   +dname+ "','"  +loc+"')"; 
							//INSERT INTO DEPT VALUES(60,'MARKETING','INCHON');
		String sql = String.format("INSERT INTO DEPT VALUES(%d,'%s','%s')",
													deptno, dname, loc);
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			System.out.println(result>0?"부서입력성공":"부서입력실패"); // 상항연산
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
	}

}
