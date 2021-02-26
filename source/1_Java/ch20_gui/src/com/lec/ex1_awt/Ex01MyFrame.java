package com.lec.ex1_awt;

import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex01MyFrame extends Frame { //frame에 있는것 다 받았다
		private Button btn, btn1;
		public Ex01MyFrame(String title) {
			//버튼 2개 추가된 프레임 생성
			super(title);
			setLayout(new FlowLayout());
			btn = new Button("버튼");
			btn1 = new Button("그냥 버튼");
			add(btn, BorderLayout.NORTH);
			add(btn1,BorderLayout.CENTER); //가운데 공간 다 차지 
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
			new Ex01MyFrame("첫GUI예제");         //Ex01Main내용 

		}
		//new Ex01MyFrame("title");
		//new Ex01MyFrame();

}
