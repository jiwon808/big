package com.lec.person;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class person {

	public static void main(String[] args) {
		String     driver = "oracle.jdbc.driver.OracleDriver"; //앞에 복사한 'ojdbc6.jar'
		String       url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String fn;       //***중요**** //string으로 한 이유 숫자,문자 다 인식가능. int로 하면 만약에 입력자가 문자를 넣을 경우를 대비 try catch문도 밑에 작성해야됨
		try {
			Class.forName(driver); //1단계는 처음 한번만
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		do {
			System.out.println("1:입력 | 2:직업별 출력 |3:전체출력 | 그외: 종료 >");
			fn = scanner.next();
			switch (fn) {
			case "1": //이름, 직업명, 국어, 영어, 수학을 입력받아 (insert)        //그후DB연결
				System.out.println("입력할 이름은?");
				String name = scanner.next();
				
				System.out.print("직업명은 (배우|가수)?");
				String jname = scanner.next();
			
				System.out.print("국어?");
				int kor = scanner.nextInt();
				
				System.out.print("영어?");
				int eng = scanner.nextInt();
				
				System.out.print("수학?");
				int math = scanner.nextInt();
				
				String sql1 ="INSERT INTO PERSON VALUES (PERSON_SQ.NEXTVAL,?, " + 
						"(SELECT JNO FROM JOB WHERE JNAME=?),?,?,?)";
				try {
					conn = DriverManager.getConnection(url,"scott","tiger");
					pstmt = conn.prepareStatement(sql1);
					pstmt.setString(1, name);
					pstmt.setString(2, jname);
					pstmt.setInt(3, kor);
					pstmt.setInt(4, eng);
					pstmt.setInt(5, math);
					int result = pstmt.executeUpdate();
					System.out.println(result>0? "입력성공":"입력실패" );
					
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if(pstmt!=null) pstmt.close();
						if(conn!=null) conn.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
				
				break; // *여기서break안쓰면 1를 누를시  1,2번까지의 결과가 나옴*
			case "2": //직업명을 입력받아 직업별 출력(select)
				System.out.println("출력하고자 하는 직업명은(배우|가수)?");
				jname = scanner.next();
				String sql2= "SELECT ROWNUM RANK, S.*" + 
						"    FROM(SELECT NAME || '( '||NO||' 번)' NAME, JNAME, KOR, ENG, MATH," + 
						"    KOR+ENG+MATH SUM" + 
						"    FROM PERSON P, JOB J" + 
						"    WHERE P.JNO = J.JNO AND JNAME = ?" + 
						"    ORDER BY SUM DESC) S";
				try {
					conn = DriverManager.getConnection(url,"scott","tiger");
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, jname);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						System.out.println("등수\t이름\t직업\t국어\t영어\t수학\t총점");
						do {
							int rank = rs.getInt("rank");
							name = rs.getString("name");
							jname = rs.getString("jname");
							kor = rs.getInt("kor");
							eng = rs.getInt("eng");
							math = rs.getInt("math");
							int sum = rs.getInt("sum");
							System.out.println(rank+"\t"+name+"\t"+jname+"\t"+kor+"\t"+eng+"\t"+math+"\t"+sum);
									
									
							//리스트 출력
						}while(rs.next());
					} else {
						System.out.println("해당 직업명의 사람이 없습니다");
					}
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}finally {
					try {
						if(rs!=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn!=null) conn.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} //close try-catch
				}//DB접속 try-catch
				break;
			case "3": //전체 출력 (select)
				String sql3 = "SELECT ROWNUM RANK, S.*" + 
						"    FROM(SELECT NAME || '( '||NO||' 번)' NAME, JNAME, KOR, ENG, MATH," + 
						"    KOR+ENG+MATH SUM" + 
						"    FROM PERSON P, JOB J" + 
						"    ORDER BY SUM DESC) S";
				try {
					conn = DriverManager.getConnection(url,"scott","tiger");
					pstmt = conn.prepareStatement(sql3);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						System.out.println("등수\t이름\t직업\t국어\t영어\t수학\t총점");
						do {
							int rank = rs.getInt("rank");
							name = rs.getString("name");
							jname = rs.getString("jname");
							kor = rs.getInt("kor");
							eng = rs.getInt("eng");
							math = rs.getInt("math");
							int sum = rs.getInt("sum");
							System.out.println(rank+"\t"+name+"\t"+jname+"\t"+kor+"\t"+eng+"\t"+math+"\t"+sum);
									
									
							//리스트 출력
						}while(rs.next());
					} else {
						System.out.println("해당 직업명의 사람이 없습니다");
					}
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}finally {
					try {
						if(rs!=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn!=null) conn.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} //close try-catch
				}//DB접속 try-catch
				
				
				break;

			}
		}while(fn.equals("1")|| fn.equals("2")||fn.equals("3"));
		System.out.println("BYE");
		
		
		
	}

}
