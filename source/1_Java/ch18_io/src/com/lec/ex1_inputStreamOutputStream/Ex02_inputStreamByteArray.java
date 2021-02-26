package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

//1. 파일을 연다 2. 읽는다 3.파일을 닫는다
public class Ex02_inputStreamByteArray {
	public static void main(String[] args) {
		InputStream is = null; //!중요 변수선언
		try {
			is = new FileInputStream("txtFile/1.txt"); // 1단계
			byte[] bs = new byte[10]; // 10byte씩 읽어라
			while (true) {
				// int i = is.read(): 1byte만
				int readByteCount = is.read(bs); // 10byte씩 읽는다 //10번방에
				if (readByteCount == -1)
					break;
				for (int i = 0; i < readByteCount; i++) {
					System.out.println((char) bs[i]);
				}
			} // while
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (is != null)
					is.close(); // 3단계
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} // catch
		} // try

	}// main
}// class
