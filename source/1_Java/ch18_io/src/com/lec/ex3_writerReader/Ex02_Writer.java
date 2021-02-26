package com.lec.ex3_writerReader;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class Ex02_Writer {

	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("txtFile/outTest.txt");
//			char[] st = {'안','녕','하','세','요'};
			String str = "안녕하세요.";
			char[] st = str.toCharArray(); // 스트링을 char배열로
			writer.write(str); // *****!중요*******
			String str1 = "한국지엠(GM)의 임금 및 단체협약(임단협)";// append에서 들어가
			writer.write(str1);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (writer != null)
					writer.close();
			} catch (Exception ignore) {
			}
		}

	}

}
