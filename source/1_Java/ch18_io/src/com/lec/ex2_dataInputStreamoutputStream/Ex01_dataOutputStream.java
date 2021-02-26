package com.lec.ex2_dataInputStreamoutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

//1.stream만들고 읽고 쓰고   2. 기본- 보조     따라서 변수2개필요
public class Ex01_dataOutputStream {
	public static void main(String[] args) {
		OutputStream fos = null;
		DataOutputStream dos = null;
		try {													//보조stream은 기본stream을 통해서만 생성
			fos = new FileOutputStream("txtFile/dataFile.dat"); //byte변수만 가져옴
			dos = new DataOutputStream(fos); //string,int,double, boolean변수 가져와
															 //!!보조stream
									//파일은 순서지켜야
			dos.writeUTF("홍길동"); 	//스트링 저장
			dos.writeInt(2);		//int값 저장
			dos.writeDouble(95.9);  //double 값 저장
			System.out.println("저장 완료");//dos를 먼저 닫고, fos를 닫아야 . 만약에 fos를 먼저 닫아버리면dos데이터를 받지 못함
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(dos!=null) dos.close();
				if(fos!= null) fos.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
