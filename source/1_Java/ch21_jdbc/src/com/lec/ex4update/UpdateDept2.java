package com.lec.ex4update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class UpdateDept2 {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner (System.in); 
		System.out.print("수정할 부서번호는 ?"); //"50"
		String deptno = scanner.next();
		
		//입력한 해당 부서번호가 있는지 없는지 체크    *********중요***********
		String selectQuery = "SELECT * FROM DEPT WHERE DEPTNO="+deptno;
		Connection conn   = null;
		Statement stmt    = null;  //resultset은 select할때  . 지금은 update이므로 필요없음
		ResultSet rs      = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement(); //(3) statement생성
			rs   = stmt.executeQuery(selectQuery);
			if(rs.next()) { //수정 진행
				System.out.print("수정할 부서이름은 ?");
				String dname = scanner.next();
				System.out.print("수정할 부서의 위치는 ?");
				String loc = scanner.next();
				//DB수정
				String query
					= String.format("UPDATE DEPT SET DNAME = '%s', LOC = '%s'" + 
				"    WHERE DEPTNO = %s", 
							dname,loc,deptno) ;
				int result = stmt.executeUpdate(query);
				System.out.println(result>0? deptno+"번 부서 수정 성공":"해당 부서 존재하지 않습니다");
			}else {
				System.out.println("유용한 부서번호가 아닙니다. 수정을 종료합니다.");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("수정 실패");
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

	}

}
