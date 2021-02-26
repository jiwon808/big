package com.lec.ex5_printwriter;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;

public class Ex01 {
	public static void main(String[] args) {
		PrintWriter printWriter = null;
		OutputStream os 			= null;
		Writer		writer 		= null;
		try {
			//printWriter = new PrintWriter("txtFile/out.txt");
			//os = new FileOutputStream("txtFile/out.txt");
			//printWriter = new PrinterWriter(os);
//			writer = new FileWriter("txtFile/out.txt");
			printWriter = new PrintWriter(writer); //stream 객체 생성
			
			System.out.println("안녕하세요\n 반갑습니다"); //콘솔에 뿌림
			printWriter.println("안녕하세요\r\n 반갑습니다");//파일에  뿌림
			System.out.print("개행자동 안될 예정\n");
			printWriter.print("개행자동 안될 예정\r\n"); //콘솔에 뿌리는 것을 파일에 뿌리는것 빼고 똑같다
			System.out.printf("%5s %3d %3d %5.1f \n","홍길동", 99,98,98.5);
			printWriter.printf("%5s %3d %3d %5.1f \r\n","홍길동", 99,98,98.5);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(printWriter !=null) printWriter.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
