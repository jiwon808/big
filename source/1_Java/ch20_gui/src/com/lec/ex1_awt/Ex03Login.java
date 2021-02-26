package com.lec.ex1_awt;

import java.awt.*;

public class Ex03Login extends Frame {
	private Label lbl1;
	private TextField txtId;
	private Label lbl2;
	private TextField txtPw;
	private Button btnLogin;
	public Ex03Login(String title) {
		super(title); //title
		setLayout(new FlowLayout()); // frame의 layout셋팅 
		lbl1 =  new Label("아 이 디 ");
		txtId = new TextField("ID",20);
		lbl2 = new Label("비밀번호");
		txtPw = new TextField(20); //가로 20 
		txtPw.setEchoChar('*');// 비밀번호에는 내가 친 숫자 보이면 안됨
		btnLogin = new Button("로그인");
		add(lbl1);
		add(txtId);
		add(lbl2);
		add(txtPw);
		add(btnLogin);
		setSize(new Dimension(300,150));
		setResizable(false); //사용자가frame 사이즈 조정 불가 !
		setLocation(100,100);
		setVisible(true);
	}	
	public static void main(String[] args) {
		new Ex03Login("로그인 화면");
	}
}
