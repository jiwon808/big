package com.lec.ex1_awt;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Ex05Frame extends Frame implements ActionListener { // ActionListener - listen to action events  
																//1. implements ActionListener
	private Panel panel;
	private TextField txtField;
	private Button btnOk;
	private Button btnExit;
	private List list;
	public Ex05Frame(String title) {
		//layout����, ������Ʈ ���� �� add, setVisible, setSize
		//setLayout(new BorderLayout()); //�⺻���̹Ƿ� ���� ����
		panel = new Panel(new FlowLayout()); // Panel�� flowlayout�� �⺻��
		txtField = new TextField(20);
		btnOk = new Button("OK");
		btnExit = new Button("EXIT");
		list = new List(); //list�ϱ� -Creates a new scrolling list
		panel.add(new Label("write"));
		panel.add(txtField);
		panel.add(btnOk);
		panel.add(btnExit);
		add(panel, BorderLayout.NORTH);
		add(list, BorderLayout.CENTER); //listup 
		setVisible(true);
		setSize(new Dimension(400,200));
		//2.�̺�Ʈ ����Ʈ �߰�
		//3.���� �߰�
		btnOk.addActionListener(this); //this.actionPerformed(btnOk�̺�Ʈ)
		btnExit.addActionListener(this);
		
	}
	public Ex05Frame() { //�̰� �Ⱦ��� �Ű����� ���� �� ȣ���.  �ٵ� ���� ���� �� �Ű����� �ִ� �Լ���. 
		//���� this("")�ϸ� ��Ʈ��   Ex05Frame ����
		this("");
	} //*********************����� �־ �Ǵ���*******************************************************
	@Override
	public void actionPerformed(ActionEvent e) {  
		if(e.getSource()==btnOk) {
			//txtField�� �ؽ�Ʈ�� list�� �߰��ϰ� textField�� ""
			list.add(txtField.getText());
			txtField.setText("");
		}else if(e.getSource()==btnExit) {
			//����
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}
	public static void main(String[] args) {
		new Ex05Frame();  //���� main�Լ��� ���� .  main�Լ��־�� ���డ��   / ���� main�Լ� �߰�
	}
}
