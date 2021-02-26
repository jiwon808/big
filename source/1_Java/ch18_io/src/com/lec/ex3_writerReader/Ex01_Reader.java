package com.lec.ex3_writerReader;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

//문자열용 Reader Writer    (2byte단위)
public class Ex01_Reader {
	public static void main(String[] args) {
		Reader reader = null; // 변수 선언
		try {
			reader = new FileReader("txtFile/1.txt");
			while (true) {
				try {
					int i = reader.read(); // try catch
					if (i == -1)
						break;
					System.out.print((char) i);

				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (reader != null)
					reader.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}// class
