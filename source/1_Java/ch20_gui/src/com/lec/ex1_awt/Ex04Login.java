package com.lec.ex1_awt;
//panel���� ����ֱ�
import java.awt.*;

public class Ex04Login extends Frame {
	private Panel panel;
	private TextField txtId, txtPw;
	private Button btnLogin;
	public Ex04Login(String title) {
		super(title);
		//setLayout(new BorderLayout()); //�⺻��
		panel = new Panel(new GridLayout(2,2));
		//panel.setLayout(new GridLayout(2,2)); //panel ���� !
		txtId = new TextField("ID",20);
		txtPw = new TextField(20);
		txtPw.setEchoChar('*');
		btnLogin = new Button("�α���");
		panel.add(new Label("���̵�",(int)CENTER_ALIGNMENT)); //1��1��
		panel.add(txtId);   //1��2��
		panel.add(new Label("��й�ȣ",(int)CENTER_ALIGNMENT));
		panel.add(txtPw);
		add(panel, BorderLayout.CENTER);
		add(btnLogin,BorderLayout.SOUTH);
		setSize(new Dimension(400,200));
		setLocation(0,0); //�⺻��
		setVisible(true);
		
	}
	public static void main(String[] args) {
		new Ex04Login("�α��� ����");
	}
}
