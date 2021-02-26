package com.lec.ex1_awt;
//panel만들어서 내용넣기
import java.awt.*;

public class Ex04Login extends Frame {
	private Panel panel;
	private TextField txtId, txtPw;
	private Button btnLogin;
	public Ex04Login(String title) {
		super(title);
		//setLayout(new BorderLayout()); //기본값
		panel = new Panel(new GridLayout(2,2));
		//panel.setLayout(new GridLayout(2,2)); //panel 세팅 !
		txtId = new TextField("ID",20);
		txtPw = new TextField(20);
		txtPw.setEchoChar('*');
		btnLogin = new Button("로그인");
		panel.add(new Label("아이디",(int)CENTER_ALIGNMENT)); //1행1열
		panel.add(txtId);   //1행2열
		panel.add(new Label("비밀번호",(int)CENTER_ALIGNMENT));
		panel.add(txtPw);
		add(panel, BorderLayout.CENTER);
		add(btnLogin,BorderLayout.SOUTH);
		setSize(new Dimension(400,200));
		setLocation(0,0); //기본값
		setVisible(true);
		
	}
	public static void main(String[] args) {
		new Ex04Login("로그인 예제");
	}
}
