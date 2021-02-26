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
		setLayout(new FlowLayout()); // frame�� layout���� 
		lbl1 =  new Label("�� �� �� ");
		txtId = new TextField("ID",20);
		lbl2 = new Label("��й�ȣ");
		txtPw = new TextField(20); //���� 20 
		txtPw.setEchoChar('*');// ��й�ȣ���� ���� ģ ���� ���̸� �ȵ�
		btnLogin = new Button("�α���");
		add(lbl1);
		add(txtId);
		add(lbl2);
		add(txtPw);
		add(btnLogin);
		setSize(new Dimension(300,150));
		setResizable(false); //����ڰ�frame ������ ���� �Ұ� !
		setLocation(100,100);
		setVisible(true);
	}	
	public static void main(String[] args) {
		new Ex03Login("�α��� ȭ��");
	}
}
