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
		//layout셋팅, 컴포넌트 생성 후 add, setVisible, setSize
		//setLayout(new BorderLayout()); //기본값이므로 생략 가능
		panel = new Panel(new FlowLayout()); // Panel은 flowlayout이 기본값
		txtField = new TextField(20);
		btnOk = new Button("OK");
		btnExit = new Button("EXIT");
		list = new List(); //list하기 -Creates a new scrolling list
		panel.add(new Label("write"));
		panel.add(txtField);
		panel.add(btnOk);
		panel.add(btnExit);
		add(panel, BorderLayout.NORTH);
		add(list, BorderLayout.CENTER); //listup 
		setVisible(true);
		setSize(new Dimension(400,200));
		//2.이벤트 리스트 추가
		//3.로직 추가
		btnOk.addActionListener(this); //this.actionPerformed(btnOk이벤트)
		btnExit.addActionListener(this);
		
	}
	public Ex05Frame() { //이거 안쓰면 매개변수 없는 게 호출됨.  근데 위에 보면 다 매개변수 있는 함수들. 
		//따라서 this("")하면 빈스트링   Ex05Frame 실행
		this("");
	} //*********************여기다 넣어도 되는지*******************************************************
	@Override
	public void actionPerformed(ActionEvent e) {  
		if(e.getSource()==btnOk) {
			//txtField의 텍스트를 list로 추가하고 textField는 ""
			list.add(txtField.getText());
			txtField.setText("");
		}else if(e.getSource()==btnExit) {
			//종료
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}
	public static void main(String[] args) {
		new Ex05Frame();  //위에 main함수가 없다 .  main함수있어야 실행가능   / 따라서 main함수 추가
	}
}
