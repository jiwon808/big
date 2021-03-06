package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream; //ctrl+shift+o(필요한것만 쏙)

// 1.파일을 연다 (stream객체 생성)  2.데이터를 읽는다 (1 or 2byte 단위) 3.파일을 닫는다  
//문자 2byte, 그외1byte
public class Ex01_inputStream {
	public static void main(String[] args) {
		InputStream is = null; // try-catch절 전에 stream변수 선언
		try { // 그런 파일 있으면 is로 없으면catch로 빠져
			is = new FileInputStream("txtFile/1.txt"); // 1단계: 파일열기
			// 2. 데이터읽기(1byte 단위로 반복)
			while (true) {
				int i = is.read(); // 1 byte 읽기
				if (i == -1)
					break;
				// System.out.println((char)i+ "-아스키코드: "+i);
				System.out.print((char) i);
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			// 3.파일 닥기
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {

			} // catch
		} // finally

	}// main
}// class
