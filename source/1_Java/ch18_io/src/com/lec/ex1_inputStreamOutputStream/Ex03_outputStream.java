package com.lec.ex1_inputStreamOutputStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Ex03_outputStream {
	public static void main(String[] args) {
		FileOutputStream os = null;
		try {
			os = new FileOutputStream("txtFile/1.txt");
			byte[] bs = { 'H', 'e', 'l', 'l', 'o' };
			for (int i = 0; i < bs.length; i++) {
				os.write(bs[i]); // 2.파일에 데이터 쓰기(반복)
			} // for
			System.out.println("성공");

		} catch (IOException e) {
			System.out.println(e.getMessage());

		} finally {
			try {
				if (os != null)
					os.close(); // 3.파일 닫기 왜 여기에 os.close??
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// catch
	}// main
}// class
