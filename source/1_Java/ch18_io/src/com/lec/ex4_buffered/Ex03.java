package com.lec.ex4_buffered;
//1.키보드로부터 '출력'할 파일이름            파일(txtFile/2.txt)   앞에 읽어야하니까. 파일 존재하면 물어봤는데 / 지금은 없으면 쓸거여서    파일 존재하는지 안물어봐도됨

//while
//	2.출력할 파일 내용은? 키보드로부터 파일의 내용을 입력 받습니다  (파일쓰기를 하기 싫으면x)   참고예제 방금 했었던 예제와 그전의 예제
//	2.키보드에서 입력한 내용을 파일로 씁니다

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Writer;

public class Ex03 {
	public static void main(String[] args) {

		BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
		Writer writer = null;
		System.out.print("출력할 파일 이름은?");
		try {
			String filename = keyboard.readLine();
			writer = new FileWriter(filename, true); // 있으면 출력, 없으면 append ****!중요******
			while (true) {
				System.out.println("출력할 파일 내용은(원하지 않을시x)?");
				String content = keyboard.readLine(); // ****!중요******
				if (content.equalsIgnoreCase("x"))
					break;
				writer.write(content + "\r\n"); // 입력하고 enter(\r\n) 똑같은내용이 화일에 출력
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (writer != null)
					writer.close();
				if (keyboard != null)
					keyboard.close();
			} catch (Exception ignore) {

			}
			// 반드시 close ****!중요******
		}
	}

}
