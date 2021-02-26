package com.lec.ex2_dataInputStreamoutputStream;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class Ex02_DataInputStream {
	public static void main(String[] args) {
		InputStream fis = null; // fileinputstream
		DataInputStream dis = null;
		try {
			fis = new FileInputStream("txtFile/dataFile.dat");
			dis = new DataInputStream(fis); // 보조stream은 기본stream을 통해서만 만들어진다
			// 앞에dataoutput내용고 같아야 // 읽어들일때도 앞에쓴 순서와 같아야 // 그래야 정상적으로 출력가능
			String name = dis.readUTF();
			int grade = dis.readInt();
			double score = dis.readDouble();
			System.out.println("파일로부터 입력 받은 값은 " + name + "\t" + grade + "\t" + score);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (dis != null)
					dis.close();
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
