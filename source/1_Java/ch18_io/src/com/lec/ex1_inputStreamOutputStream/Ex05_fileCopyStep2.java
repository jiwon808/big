package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

//1. stream객체 생성(inputStream,outputStream) 2.읽고쓰기(반복) 3.stream닫기
public class Ex05_fileCopyStep2 {
	public static void main(String[] args) {
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("txtFile\\mamamoo.jpg"); // \만하면 해석하기 시작.기능의미 따라서 \\ 		입력
			os = new FileOutputStream("txtFile/mamamoo_copy.jpg"); // d:/big/ 						출력
			int cnt = 0; //뒤 "번 반목문 실행 후 파일 복사 성공"를 위해  변수 선언 
			byte[] bs = new byte[1024]; //1KB씩 이 배열에 읽어 들이는 목적  	!!byte선언
			while (true) {
				++cnt; //반복문 실행 
				int readByteCount = is.read(bs); //         		!!이부분 중요  byte수를 읽어라
				if (readByteCount == -1)
					break;
				os.write(bs,0,readByteCount); 			//!!이부분 중요  bs배열에 0번 index부터readByteCount만큼만 파일에 쓰기
			}
			System.out.println(cnt+"번 반목문 실행 후 파일 복사 성공");
		} catch (FileNotFoundException e) {
			System.out.println("파일 이나 폴더 못 찾음" + e.getMessage());
		} catch (IOException e) {
			System.out.println("일고 쓸 때 예외남" + e.getMessage());
		} finally {
			try {
				if(is!=null) is.close();
				if(os!=null) os.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} 
	}// main
}// class
