package com.lec.ex1_inputStreamOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

//1. stream객체 생성(inputStream,outputStream) 2.읽고쓰기(반복) 3.stream닫기
public class Ex05_fileCopyStep3 {
	public static void main(String[] args) {
		InputStream is = null;
		OutputStream os = null;
		try {
			File originalFile = new File("txtFile\\\\mamamoo.jpg"); //없어도 error안남       
//				if(originalFile.exists()) {
//					System.out.println("파일 존재함");
//				}else {
//					System.out.println("파일 이름이 잘못 되었습니다. 존재하지 않습니다");
//				}
			is = new FileInputStream(originalFile); // \만하면 해석하기 시작.기능의미 따라서 \\ //입력
			os = new FileOutputStream("txtFile/mamamoo_copy.jpg"); // d:/big/ //출력
			int cnt = 0; // 뒤 "번 반목문 실행 후 파일 복사 성공"를 위해 변수 선언
			byte[] bs = new byte[(int) originalFile.length()];  		
										// ***********3단계*********
										// 1024KB 이 배열에 읽어 들이는 목적 //한번에 슉 //21억까지(2.1기가) !!byte선언
										// 예. 3000를 넣었다. 그럼 읽어오는 횟수가 더 적어져서 ---> 더 빨라짐
										// 그러나 (이미지가 그렇게 크지않는데도)만약에 21억을 넣었다 그러면 용량 너무 많이 차지
										// 수는 파일 용량만큼 올려
			while (true) {
				++cnt; // 반복문 실행
				int readByteCount = is.read(bs); // !!이부분 중요 byte수를 읽어라
				if (readByteCount == -1)
					break;
				os.write(bs, 0, readByteCount); // !!이부분 중요 bs배열에 0번 index부터readByteCount만큼만 파일에 쓰기
			}
			System.out.println(cnt + "번 반목문 실행 후 파일 복사 성공");
		} catch (FileNotFoundException e) {
			System.out.println("파일 이나 폴더 못 찾음" + e.getMessage());
		} catch (IOException e) {
			System.out.println("일고 쓸 때 예외남" + e.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
				if (os != null)
					os.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}// main
}// class
