package com.lec.ex2_swing;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
//swing은 panel로 한번 감싼다
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Ex01Frame extends JFrame implements ActionListener { //1.implement ActionListener
	//An extended version of java.awt.Frame that adds support for the JFC/Swing component architecture
	private JPanel panel;
	private JLabel jlbl;
	private JButton btn;
	public Ex01Frame(String title) { //title있는 windows
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); //X버튼 누르면 종료됨  //! 이거 한 줄 이면 끝남
		panel = (JPanel)getContentPane(); // 컨테이너(Frame)를 얻어옴
		panel.setLayout(new FlowLayout());//원래. 지금containframe의 속성인 borderlayout를 그대로 가져와서 flowlayout로 지정해야
		jlbl = new JLabel("즐거운 월요일",(int)CENTER_ALIGNMENT);
		jlbl.setPreferredSize(new Dimension(150,200));
		btn = new JButton("종료");  //button에 icon을 넣을 수 있다
		btn.setPreferredSize(new Dimension(200,200));
		panel.add(jlbl); //panel전체를 가져오기 때문에 ,panel자체가 frame
		panel.add(btn);
		setVisible(true);
		//pack(); //최소한의 사이즈 셋팅
		setSize(new Dimension(500,300));
		setVisible(true);
		//2.listener추가 (생성자에 추가)
		btn.addActionListener(this);
	}
	public static void main(String[] args) {
		new Ex01Frame("첫 스윙예제");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btn) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}
}
