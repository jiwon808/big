package com.lec.ex2_dataInputStreamoutputStream;

//product.dat(쓰기)를 가져옴  따라서input
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

public class Ex04_Productlist {
	public static void main(String[] args) {
		ArrayList<Product> products = new ArrayList<Product>();
		InputStream fis = null;
		DataInputStream dis = null;
		try {
			fis = new FileInputStream("txtFile\\product.dat");
			dis = new DataInputStream(fis);
			while (true) {
				String name = dis.readUTF();
				int price = dis.readInt();
				int ps = dis.readInt();
				products.add(new Product(name, price, ps));
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println("목록입니다");
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
		for (Product p : products) {
			System.out.println(p);
		}
		System.out.println("총 " + products.size() + "개 의 물건 입니다");
	}
}
