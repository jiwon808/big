package com.lec.ex1selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 부서명을 입력받아 해당 '부서명 정보'와 '사원 리스트 출력 (사번, 이름, 급여, 급여등급)'
public class SelectWhereDname2 {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		System.out.println("원하는 부서명은?");
		String dname = scanner.next();
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		String query1 = String.format("SELECT * FROM DEPT WHERE DNAME= '%s'", dname);
		String query2 = String.format("SELECT EMPNO, ENAME, SAL, GRADE " + 
				"FROM EMP E , DEPT D, SALGRADE " + 
				"WHERE SAL BETWEEN LOSAL AND HISAL " + 
				"AND E.DEPTNO = D.DEPTNO " + 
				"AND DNAME='%s'", dname);
		try {
			Class.forName(driver); //(1)
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs   = stmt.executeQuery(query1); //(4)+(5)
			if(rs.next()) {
				System.out.println("부서번호: "+ rs.getInt("deptno"));
				System.out.println("부서이름" + dname);
				System.out.println("부서위치"+rs.getString("loc"));
				rs.close();
				rs = stmt.executeQuery(query2);
				if(rs.next()) { //(6)
					System.out.println("사번\t이름\t급여\t급여등급");
					do {
						int empno    = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal      = rs.getInt("sal");
						int grade    = rs.getInt("grade");
						System.out.println(empno+"\t"+ename+"\t"+sal+"\t"+grade); //*****중요*************
					}while(rs.next());
				}else {
					System.out.println("해당 부서의 사원은 없습니다.");
				}
			}else {
				System.out.println("해당 부서이름이 존재하지 않습니다");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally { //7
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
