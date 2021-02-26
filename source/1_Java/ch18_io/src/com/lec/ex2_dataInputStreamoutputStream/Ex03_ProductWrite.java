package com.lec.ex2_dataInputStreamoutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.InputMismatchException;
import java.util.Scanner;

//output
public class Ex03_ProductWrite {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String answer;
		OutputStream fos = null;
		DataOutputStream dos = null;
		try {
			fos = new FileOutputStream("txtFile/product.dat", true);
			dos = new DataOutputStream(fos);
			while (true) {
				System.out.println("상품을 입력하시겠습니까?(Y/N)");
				answer = scanner.next().trim();
				if (answer.equalsIgnoreCase("n")) {
					break;
				} else if (answer.equalsIgnoreCase("y")) {
					System.out.println("상품명을 입력해주세요");
					String name = scanner.next();
					dos.writeUTF(name);
					System.out.println("가격을 입력해주세요");
					int price = scanner.nextInt();
					dos.writeInt(price);
					System.out.println("재고갯수를 입력해주세요");
					int ps = scanner.nextInt();
					dos.writeInt(ps);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (dos != null)
					dos.close();
				if (fos != null)
					fos.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	} // main
} // class
