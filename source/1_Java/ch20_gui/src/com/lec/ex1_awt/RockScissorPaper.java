package com.lec.ex1_awt;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class RockScissorPaper extends Frame implements ActionListener {
	private Panel panel;
	private TextField txtField;
	private Button btnRock,btnScissor,btnPaper,btnExit,btnRemove; //주의: btnExit,btnRemove 도써야함
	private List list;
	public RockScissorPaper(String title) { 
		super(title); //*********중요! //RockScissorPaper은 Frame으로부터 상속받음. 따라서 super자동적으로 생성
					//super();하면 아무것도 안나옴 //title가 필요해서  Frame(java.awt)으로부터 타이틀을 가져옴
					//Frame(java.awt)- A Frame is a top-level window with a title and a border. 
		setLayout(new BorderLayout());
		panel = new Panel(new FlowLayout());// Panel은 flowlayout이 기본값 //맨 위 패널객체
//		txtField = new TextField(100);
		btnRock = new Button ("바위");
		btnScissor = new Button ("가위");
		btnPaper = new Button("보");
		btnRemove = new Button ("지우기");
		btnExit = new Button("종료");
		list = new List(5); //5줄까지만 보여줘. 밑에 볼려면 scroll바 이용 
//		panel.add(txtField);
		panel.add(btnScissor);
		panel.add(btnRock);
		panel.add(btnPaper);
		panel.add(btnRemove);
		add(panel,BorderLayout.NORTH); 
		add(list,BorderLayout.CENTER); // 리스느는 가운데  //종료버튼 맨 밑
		add(btnExit, BorderLayout.SOUTH);
//		setVisible(true);
		setSize(new Dimension(300,200));
		setVisible(true);
		//!중요********
		addWindowListener(new WindowAdapter() { //*안치고 바로 나오는법 ********?
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false);
				dispose();
				System.exit(0); //순서
			}
		}); 
		btnRock.addActionListener(this);  //ActionListener가 가위,바위,보 버튼 클릭했는지 감시. click했느면 밑에 method 호출
		btnScissor.addActionListener(this);
		btnPaper.addActionListener(this);
		btnRemove.addActionListener(this);  
		btnExit.addActionListener(this);	//RockScissorPaper 안에  Actionperformed가 있다. 따라서 this는 actionPerformed호출
											//Actionperformed가 ActionListener로부터 override
		
	}//main
	@Override
	public void actionPerformed(ActionEvent e) { 
		int computer =(int)(Math.random()*3);
		if(e.getSource()==btnRock) { //바위
			switch(computer) {
			case 0: 
				list.add("당신이 이김. 당신이 보, 컴퓨터는 가위");
				break;
			case 1: 
				list.add("비김. 당신과 컴퓨터 모두 바위");
				break;
			case 2:
				list.add("컴퓨터가 이김. 당신은 바위, 컴퓨터는 보");
				break;
			}
			
		}else if(e.getSource()==btnScissor) { //가위
			switch(computer) {
			case 0:
				list.add("비김. 우리 다 가위");
				break;
			case 1:
				list.add("컴퓨터가 이김.당신은 가위, 컴퓨터는 바위");
				break;
			case 2:
				list.add("당신이 이김.당신은 가위, 컴퓨터는 보");
				break;
			}
		}else if(e.getSource()==btnPaper) { //보
			switch(computer) {
			case 0:
				list.add("비김. 우리 다 보");
				break;
			case 1:
				list.add("컴퓨터가 이김. 당신은 보, 컴퓨터는 가위");
				break;
			case 2:
				list.add("당신이 이김. 당신은 보, 컴퓨터는 바위");
				break;
			}
		}else if(e.getSource()==btnExit) { //종료
			setVisible(false);
			dispose();
			System.exit(0);
		}else if (e.getSource()==btnRemove) { //모두 기우기
			list.removeAll();
		}
			
		//*********************여기는 왜 이 생성자 없어도 되는지*******************************************************
	}
//	public RockScissorPaper() {
//		this("");
//	}
	public static void main(String[] args) {
		new RockScissorPaper("첫 가위 바위 보 게임");
		
	}
}//class
