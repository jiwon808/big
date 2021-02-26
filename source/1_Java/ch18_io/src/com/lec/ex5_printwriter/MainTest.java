package com.lec.ex5_printwriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class MainTest {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String answer, name, phone, birthday, address;
		ArrayList<Customer> customers = new ArrayList<Customer>();
		//Writer writer = null;   //java.io사전 보면: public abstract void write(int b) throws IOException; 
								//java.io사전 보면: outputstream은  이건 abstract class
								//*****중요*****
		
		Date today = new Date(); 								//*****중요*****
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");  //*****중요*****
		String todayStr = sdf.format(today); // "12-16"   	 //*****중요*****
		
		do {
				System.out.println("회원가입 진행 하시겠습니까(Y/N)?");
				answer = scanner.next();
				if (answer.equalsIgnoreCase("y")) {
					System.out.println("가입하실 회원님 이름은?");
					name = scanner.next();
					System.out.println("가입하실 회원님 전화번호는?");
					phone = scanner.next();
					System.out.println("가입하실 회원님의 생일은");
					birthday = scanner.next();
					System.out.println("가입하실 회원님 주소는?");
					scanner.nextLine(); // 버퍼지우기 !!********중요*************!! //   /n전까지 내용 나옴.  이것을 넣어야  '주소'질문에 답을 할 수 있다
					address = scanner.nextLine();
				if(birthday.equals(todayStr)) {
					System.out.println(name+"님 생일이시군요. 생일축하합니다!"); //*****중요*****
				}
					customers.add(new Customer(name, phone, birthday, address));
				} else if (answer.equalsIgnoreCase("n")) {
					break;
				}
		}while(true);
		//2.ArrayList 정보와 몇명 가입했는지 파일 출려과 콘솔 출력한다
		OutputStream os = null;
		try {
			os = new FileOutputStream("txtFile\\customer.txt",true);
			for(Customer c : customers) {
				byte [] bs = c.toString().getBytes();  //*********byte예제 봐*************//
				System.out.print(c); //customer.java toString output에서 "\r\n" 해서 여기서 그냥 print . not println
				os.write(bs);
			}
		} catch(FileNotFoundException e) {
			System.out.println("파일 못 찾음"+e.getMessage()); //'File' catch 
		} catch (IOException e) {
			System.out.println(e.getMessage()); //'byte' catch
		} finally {
			try {
				if (os != null) os.close();
			} catch (Exception ignore) { //보통close때 에러발생 잘 안한다 
				System.out.println(ignore.getMessage());
			
		}
		
		} // finally

	}// try
}// main
