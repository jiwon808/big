package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;

public class Ex0 {
	public static void main(String[] args) {
		Frame frame = new Frame("title");
		Button btn = new Button("��ư");
		Button btn1 = new Button("�׳� ��ư");
		frame.add(btn,BorderLayout.NORTH); //��
		frame.add(btn1,BorderLayout.CENTER);
		frame.setSize(new Dimension(300,200)); //����300 ����200 
		frame.setLocation(100, 50);
		frame.setVisible(true); //�ݵ�� setVisible(true)�ؾ� �� ���� ���δ� 
		try {
			Thread.sleep(2000); //2�ʰ� ������    ��
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		frame.setVisible(false); //ȭ�鿡�� �Ⱥ��̰�
		frame.dispose();         //�������� ��� �ڿ��� ���� 
		System.exit(0);			//����
	}
}
//window-general- workspace -default