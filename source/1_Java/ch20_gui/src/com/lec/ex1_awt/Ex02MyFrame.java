package com.lec.ex1_awt;
//2. 특정 event 걸리면 . 생성자에서 선언 
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex02MyFrame extends Frame implements ActionListener { // 꼭Frame을 상속받아야 만들 수 있다
	private Label lbl1; // 추가할 컴포넌트 변수들 선언
	private Button btnExit;

	public Ex02MyFrame() {
		//frame과 label과 button 추가후 setVisible과 setSize
		//frame의 layout스타일을 flowLayout()으로 - add순서대로 차곡차곡 
		setLayout(new FlowLayout());
		//setLayout(new BorderLayout()); --기본
		//setLayout(new GridLayout(2,2)); --2행2열짜리 격자  layout
		lbl1 = new Label("즐거운 월요일");
		lbl1.setPreferredSize(new Dimension(150,200)); //컴포넌트 사이즈
		btnExit = new Button("종료");
		btnExit.setPreferredSize(new Dimension(200,100));
		add(lbl1);
		add(btnExit);
		setVisible(true);
		setSize(new Dimension(500,300));
		setLocation(100,100);
		//btnExit 클릭이벤트 발생되면 this.actionPerformed()호출 
		btnExit.addActionListener(this);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
			setVisible(false);
			dispose();
			System.exit(0);
			}
		});
	}

	public Ex02MyFrame(String title) {
		this();
		setTitle(title);
	}

	public static void main(String[] args) {
		new Ex02MyFrame("두 번째 GUI 예제");
	}


	@Override
	public void actionPerformed(ActionEvent e) {  //이벤트 처리 메소드  //이벤트 걸리 애들에만 수행
		// btnExit 클릭이벤트 발생되면 this.actionPerformed()호출 
		if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}
		
}
