package com.lec.ex4_buffered;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class Ex01_BufferedReader {
	public static void main(String[] args) {
		Reader reader = null;
		BufferedReader br = null; //변수 선언 
		try {
			reader = new FileReader("txtFile/1.txt");
			br 	   = new BufferedReader(reader); //1. 보조 stream 객체 만들기     
			while(true) {						//clause
					String line = br.readLine();
					if(line == null) break;  //4. 제대로 한줄 읽었나요
					System.out.println(line);
			}
		} catch (IOException e) {			//5. FileNotFoundException 지우고  IOException만쓰면됨 . 후자가 전자를 포함하고 있기 때문에
			System.out.println(e.getMessage());
		} finally {
			try {
				if(br!= null) br.close(); // 2. 보조 stream 먼저 닫기           
				if(reader!=null) reader.close(); //6. 기본 stream닫기 
			} catch (Exception e) {
				
			}
		}
	}
}
