package com.lec.ex1selectAll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectAllMySQL {

	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver"; // 8.0
		String url = "jdbc:mysql://localhost:3306/kimdb?serverTimezone=UTC";
		Connection conn = null;
		Statement stmt  = null;  //sql출력해줄 객체
		ResultSet rs    = null;
		String query    = "SELECT * FROM PERSONAL"; // * 여서 필드명 , alias 있으면 alias명
		try {
			Class.forName(driver); // (1)
			conn = DriverManager.getConnection(url, "root","mysql"); // (2)
			stmt = conn.createStatement(); //(3)       //sql문 출력가능 
			rs = stmt.executeQuery(query); //(4)+(5)   //sql 지금 select문 그래서 rs부터 결과 받아
			System.out.println("사번\t이름\t  직책\t\t상사사번\t  입사일\t\t 급여\t상여\t부서번호");
			if(rs.next()) { //select결과 있음 //(6)
				// while쓰면 첫번째 줄이 날라감  왜냐하면 첫번째줄 bill를 가지오 있는 상태에서 아무것도 안하고 rs.next()로 넘어가기때문
				do {
					int pno      = rs.getInt("pno");
					String pname = rs.getString("pname");
					String job = rs.getString("job");
					int manager = rs.getInt("manager");
					Date startdate = rs.getDate("startdate");
					//Timestamp startdate = rs.getTimestamp("startdate");
					int pay = rs.getInt("pay");
					int bonus = rs.getInt("bonus");
					int dno = rs.getInt("dno");
					if(pname!=null && pname.length()<7) {                          //출력결과 가지런하게 나열되기 위해
						System.out.printf("%d\t %s\t %s\t %d\t %TF\t %d\t %d\t %d\n",
								pno,pname,job,manager,startdate,pay,bonus,dno);						
					}else {
						System.out.printf("%d\t %s %s\t %d\t %TF\t %d\t %d\t %d\n",
								pno,pname,job,manager,startdate,pay,bonus,dno);	
					}
				}while(rs.next());
					
			}else {
				System.out.println("사원 정보가 없습니다.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs !=null) rs.close();
				if(stmt !=null) rs.close();
				if(conn !=null) rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

	}

}
