package com.lec.ex6preparedstatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

// 부서이름을 입력받아 해당 부서의 사번, 이름, job, SAL를 출력
public class SelectWhereDname {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner (System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT EMPNO,ENAME,JOB,SAL" + 
				"    FROM EMP E, DEPT D" + 
				"    WHERE E.DEPTNO = D.DEPTNO" + 
				"    AND DNAME = ?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			System.out.println("검색하고자 하는 부서명은?");
			pstmt.setString(1, scanner.next());
			rs = pstmt.executeQuery(); //부서명 없는거 치면 result없다
			if(rs.next()) { //해당 부서사원이 있는 경우 list출력
				System.out.println("사번\t이름\t직책\t\t급여");
				do {
					int empno = rs.getInt("empno");
					String ename = rs.getString("ename");
					String job = rs.getString("job");
					int sal = rs.getInt("sal");
					if(job!=null && job.length()<=7) {
						System.out.println(empno+"\t"+ename+"\t"+job+"\t\t"+sal);
					}else {
						System.out.println(empno+"\t"+ename+"\t"+job+"\t"+sal);
					}

				}while(rs.next());
			}else {
				System.out.println("해당 부서의 직원은 없습니다");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}

}
