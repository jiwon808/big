package com.lec.ex1_awt;

import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex01MyFrame extends Frame { //frame�� �ִ°� �� �޾Ҵ�
		private Button btn, btn1;
		public Ex01MyFrame(String title) {
			//��ư 2�� �߰��� ������ ����
			super(title);
			setLayout(new FlowLayout());
			btn = new Button("��ư");
			btn1 = new Button("�׳� ��ư");
			add(btn, BorderLayout.NORTH);
			add(btn1,BorderLayout.CENTER); //��� ���� �� ���� 
			setVisible(true);
			setSize(new Dimension(300,200));
			setLocation(200,100);
			addWindowListener(new WindowAdapter() {
				@Override
				public void windowClosing(WindowEvent e) {
					setVisible(false);
					dispose();
					System.exit(0);
				}
			});
		}
		//new Ex01MyFrame("title");
		//new Ex01MyFrame();
		
		public Ex01MyFrame() {
			this(" ");
		}
		public static void main(String[] args) {
			new Ex01MyFrame("ùGUI����");         //Ex01Main���� 

		}
		//new Ex01MyFrame("title");
		//new Ex01MyFrame();

}
