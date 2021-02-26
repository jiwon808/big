package com.lec.ex4_buffered;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

// 키보드로부터 파일이름을 받아 해당파일 출력     해당파일 -'문자'이어야 한다  Reader 이기에    모르면inputstream으로 읽어야
public class Ex02_bufferedReaderKeyboard {
	public static void main(String[] args) {
		BufferedReader keyboard 
						= new BufferedReader (new InputStreamReader(System.in)); 
						//scanner 처럼  keyboard에 있는 내용 가져올 수 있어
		Reader		   reader = null; //기본stream변수 선언
		BufferedReader br 	  = null;
		System.out.println("읽어올 파일 이름은?"); //enter를 누르게되   자동개행이기때문에 //read변수 try catch
		try { // txtFile/1.txt  or    d:big/1.txt
			String filename = keyboard.readLine(); //파일 있으면 그거 뿌리고, 없으면 없다고 뿌리고    (파일exist하는지 물어봐야)
			File file = new File(filename); //file객체 만들기 (존재하지 않아도 만들 수 있다 )
			if(file.exists()) {
				reader = new FileReader(file); //string객체는 기본 객체부터
				br 	   = new BufferedReader(reader); //보조 stream객체 만들기 //이거있어서 한줄씩 있는게 나아
				while(true) {
					String line = br.readLine();
					if(line==null) break;   //line==null이면 문서가 없다는 의미
					System.out.println(line);
				}
			}else {
				System.out.println("해당 파일은 존재하지 않습니다.");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(br !=null) br.close();
				if(reader !=null) reader.close();  //입력은 순서대로 안 닫으면 내용저장안됨. 출력은 크게 상관없지만 그래도 습관들여 
			} catch (Exception e) {
				
			}
			
		}
	}
}
