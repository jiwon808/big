package com.lec.person_dao;
//210108.성적표.pptx
//gui화면에 입력하고 입력한 내용 sql에서 확인
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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

public class PersonMngGui_Function extends JFrame implements ActionListener {
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
	public PersonMngGui_Function(String title) { //매개변수가 들어 있는 '생성자 함수' 만들기
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
	// *********(2)function**********
	btnInput.addActionListener(this);
	btnSearch.addActionListener(this);
	btnOutput.addActionListener(this);
	btnExit.addActionListener(this);
	}
	// *********(1)implements override**********
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnInput) { //이름, 직업명, 국영수 받아와서 dao.insert호출
			String name = txtName.getText().trim();  //trim()==white space removed
			String jname = comJob.getSelectedItem().toString().trim();
			String korStr = txtKor.getText().trim();//국어 점수에  숫자를 넣어야하는데, 문자를 넣을까봐
			String engStr = txtEng.getText().trim();
			String mathStr = txtMath.getText().trim(); //무엇가을 쳐야한다. 빈상태로 두면안된다 
			if(name.equals("")||jname.equals("")|| korStr.equals("")
					||engStr.equals("")|| mathStr.equals("")) {
				txtPool.setText("이름, 직업, 국, 영, 수  모두 입력하셔야 입력 가능 ");
				return;
			}
			int kor = Integer.parseInt(korStr);
			int eng = Integer.parseInt(engStr);
			int math = Integer.parseInt(mathStr);
			PersonDto newPerson = new PersonDto(name,jname,kor,eng,math);
			int result = dao.insertPerson(newPerson);
			if(result == PersonDao.SUCCESS) {
				txtPool.setText(name+"님 입력 성공");
				txtName.setText("");
				comJob.setSelectedIndex(0); //콤보박스 0번째 선택 
				txtKor.setText("");
				txtEng.setText("");
				txtMath.setText("");
			}//if
		} else if(e.getSource()==btnSearch) { //직업명으로 dao.selectJname호풀
			String jname = comJob.getSelectedItem().toString().trim(); //빈string이라면 뭐라하고아니면 dao 부름
			if(jname.equals("")) {
				txtPool.setText("직업을 선택 후 직업조회하세요");
				return;
			}
			person = dao.selectJname(jname);
			txtPool.setText("등수\t이름\t직업\t국어\t영어\t수학\t총점\n");
			if(person.isEmpty()){
				txtPool.setText(txtPool.getText()+"해당 직업군의 인원이 없습니다.");
			}else {
				for(PersonDto p:person) {
					txtPool.append(p.toString()+"\n");
				}
			}
		} else if(e.getSource()== btnOutput) {//dap.selectAll 호출   (결과를 뿌리게된다)
			person = dao.selectAll(); //***이거만 위랑 다름**
			txtPool.setText("등수\t이름\t직업\t국어\t영어\t수학\t총점\n");
			if(person.isEmpty()){
				txtPool.setText(txtPool.getText()+"해당 직업군의 인원이 없습니다.");
			}else {
				for(PersonDto p:person) {
					txtPool.append(p.toString()+"\n");
				}
			}
			
		} else if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}	
	public static void main(String[] args) {
		new PersonMngGui_Function("연예인 성적 관리");
	}
}






