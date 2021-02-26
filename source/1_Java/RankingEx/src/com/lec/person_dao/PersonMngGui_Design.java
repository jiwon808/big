package com.lec.person_dao;
//210108.성적표.pptx
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class PersonMngGui_Design extends JFrame {
	private Container contenPane;
	private JPanel jpup,jpbtn;
	private JTextField txtName, txtKor, txtEng, txtMath;
	private Vector<String> jnames;
	private JComboBox<String> comJob;
	private JButton btnInput, btnSearch, btnOutput, btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;
	private PersonDao dao = PersonDao.getInstance();
	private ArrayList<PersonDto> person;
	public PersonMngGui_Design(String title) { //매개변수가 들어 있는 '생성자 함수' 만들기
		super(title); // 매개변수 있는 슈퍼단 생성자 호출이됨 
	setDefaultCloseOperation(EXIT_ON_CLOSE);	 //종료버튼
	contenPane = getContentPane();
	contenPane.setLayout(new FlowLayout());  //왼쪽부터 오른쪽, 위부터 아래
	jpup = new JPanel(new GridLayout(5,2)); // jpup: 5행2열 grid    전체
	jpbtn = new JPanel(new FlowLayout());
	txtName = new JTextField(20);
	
	jnames = dao.jnamelist(); //****중요**************** (combobox에 넣을려고)
	comJob = new JComboBox<String>(jnames);
	txtKor = new JTextField(20);
	txtEng = new JTextField(20);
	txtMath = new JTextField(20);
	//ImageIcon
	ImageIcon icon1 = new ImageIcon("icon/write.gif");
	btnInput = new JButton("입력",icon1);
	ImageIcon icon2 = new ImageIcon("icon/hot.gif");
	btnSearch = new JButton("직업조회",icon2);
	btnOutput = new JButton("전체출력");
	btnExit = new JButton("종료");
	
	txtPool = new JTextArea(10,60);
	scrollPane = new JScrollPane(txtPool);
	jpup.add(new JLabel("이름",(int)CENTER_ALIGNMENT));
	jpup.add(txtName);
	jpup.add(new JLabel("직업",(int)CENTER_ALIGNMENT));
	jpup.add(comJob);
	jpup.add(new JLabel("국어",(int)CENTER_ALIGNMENT));
	jpup.add(txtKor);
	jpup.add(new JLabel("영어",(int)CENTER_ALIGNMENT));
	jpup.add(txtEng);
	jpup.add(new JLabel("수학",(int)CENTER_ALIGNMENT));
	jpup.add(txtMath);
	
	jpbtn.add(btnInput);
	jpbtn.add(btnSearch);
	jpbtn.add(btnOutput);
	jpbtn.add(btnExit);
	contenPane.add(jpup);
	contenPane.add(jpbtn);
	contenPane.add(scrollPane);
	setSize(new Dimension(700,450));
	setLocation(200,150);
	setVisible(true);
	
	}
	public static void main(String[] args) {
		new PersonMngGui_Design("연예인 성적 관리");
	}
	
}





