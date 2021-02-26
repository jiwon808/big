package com.lec.ex1selectWhere;
//다른점:부서번호 --> 상사번호
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 사용자에게 원하는 부서번호를 입력받아
// (1) 해당 부서번호가 존재하는 경우: 부서정보 출력, 
//      사원(사번,이름,급여, 상사명)이 존재할 경우 리스트 출력, 존재하지 않은 경우 사원이 없다고 출력 
// (2) 해당 부서번호가 존재하지 않을 경우: 존재하지 않는 부서번호라고 출력 
public class SelectWhereDeptno3 {
	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		Scanner scanner = new Scanner(System.in);
		System.out.println("원하는 부서 번호는?");
		int deptno = scanner.nextInt();
		String  query1 = "SELECT * FROM dept where deptno=" +deptno; 
		String  query2 = "SELECT W.EMPNO,W.ENAME, W.SAL, M.ENAME MANAGER " + 
				"FROM EMP W, EMP M " + 
				"WHERE W.MGR = M.EMPNO AND W.DEPTNO=" + deptno; // *******중요!*************************
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query1); 
			if(rs.next()) {
				System.out.println("원하는 부서번호: "+deptno);
				System.out.println("원하는 부서이름: "+rs.getString("dname"));
				System.out.println("원하는 부서위치: "+rs.getString("loc"));
				rs.close();
				rs = stmt.executeQuery(query2);
				if(rs.next()) {
					System.out.println("사번\t이름\t급여\t상사명");
					do {
						int    empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						int    sal   = rs.getInt("sal");
						String manager=rs.getString("manager"); // *******중요!*************************
						System.out.println(empno+"\t"+ename+"\t"+sal+"\t"+manager);
					}while(rs.next());
				}else {
					System.out.println(deptno+"번 부서 사원은 없습니다.");
				}
			}else {
				System.out.println("유효하지 않는 부서번호입니다.");
			}
		} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
					
		} catch (SQLException e) {
				System.out.println(e.getMessage());
		} finally {
					try {
						if (rs!=null) rs.close();
						if (stmt!=null) stmt.close();
						if(conn!=null) conn.close();
					
				} catch (Exception e2) {
					
				} 
			
			
		}//try-catch-finally
		
		
	}//main
}//class
