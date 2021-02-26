package com.lec.studentGUI;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class SwingStudentMng extends JFrame implements ActionListener {
	//grid layout 4행3열
	private Container contenPane;
	private JPanel jpup, jpbtn;
	private JTextField txtSNo, txtSName, txtScore;
	private Vector<String> mNames; //Combobox에 들어갈 내용 
	private JComboBox<String> comMname;
	private JButton btnSNoSearch, btnSNameSearch, btnMNameSearch, 
	btnInput,btnUpdate,btnStudentOut, btnExpelOut,btnExpel,btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;
	private String driver; // **************?************
	private String url; // **************?************
	private StudentSwingDao  dao = StudentSwingDao.getInstance();
	private ArrayList<StudentSwingDto> student;
	public SwingStudentMng(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane();
		contenPane.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(4,3));
		jpbtn = new JPanel(new FlowLayout());
	
		txtSNo = new JTextField(10);
	
		mNames = dao.getMNamelist();//****중요**************** (combobox에 들어감)
		comMname = new JComboBox<String>(mNames);
	
		txtSName = new JTextField(10);
		txtScore = new JTextField(10);
	
	//Icon
		btnSNoSearch = new JButton("학번검색");
		btnSNameSearch = new JButton("이름검색");
		btnMNameSearch = new JButton("전공검색"); 
		btnInput = new JButton("학생입력");
		btnUpdate = new JButton("학생수정");
		btnStudentOut = new JButton("학생출력");
		btnExpelOut = new JButton("제적자검색");
		btnExpel = new JButton("제적처리");
		btnExit = new JButton("종료");
	
		txtPool = new JTextArea(10,50);
		scrollPane = new JScrollPane(txtPool);
		jpup.add(new JLabel("학번",(int)CENTER_ALIGNMENT));
		jpup.add(txtSNo);
		jpup.add(btnSNoSearch); //**** 순서 중요 (화면에 순서대로 뿌려짐)
		jpup.add(new JLabel("이름",(int)CENTER_ALIGNMENT));
		jpup.add(txtSName);
		jpup.add(btnSNameSearch); //****
		jpup.add(new JLabel("전공",(int)CENTER_ALIGNMENT));
		jpup.add(comMname);
		jpup.add(btnMNameSearch);
		jpup.add(new JLabel("점수",(int)CENTER_ALIGNMENT));
		jpup.add(txtScore);
	
		jpbtn.add(btnInput); 
		jpbtn.add(btnUpdate); 
		jpbtn.add(btnStudentOut); 
		jpbtn.add(btnExpelOut); 
		jpbtn.add(btnExpel); 
		jpbtn.add(btnExit); 
	
		contenPane.add(jpup);
		contenPane.add(jpbtn);
		contenPane.add(scrollPane);
		setSize(new Dimension(600,400));
		setLocation(200,150);
		setVisible(true);
		// *********(2)function**********
		btnSNoSearch.addActionListener(this);
		btnSNameSearch.addActionListener(this);
		btnMNameSearch.addActionListener(this);
		btnInput.addActionListener(this);
		btnUpdate.addActionListener(this);
		btnStudentOut.addActionListener(this);
		btnExpelOut.addActionListener(this);
		btnExpel.addActionListener(this);
		btnExit.addActionListener(this);
	}
	// *********(1)implements override**********
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnSNoSearch) {                     //학번 검색
			String sNo = txtSNo.getText().trim();
			if(sNo.equals("")) {
				txtSName.setText(""); //****************************??*******************
				comMname.setSelectedItem("");
				comMname.setSelectedIndex(0); // 0 specifies the first item in the list and -1 indicates no selection
				txtScore.setText("");
				txtPool.setText("학번을 입력 후 검색 하시길 바랍니다.");
				return;
			} // if 학번을 입력하지 않은 경우
			StudentSwingDto dto = dao.sNogetStudent(sNo);
			if(dto!=null) { //해당 학번이 DB에 검색되었을 경우
				txtSName.setText(dto.getsName());
				comMname.setSelectedItem(dto.getmName());
				txtScore.setText(String.valueOf(dto.getScore()));
				txtPool.setText(sNo+ "검색 완료");
			}else { //해당 학번이 DB에 없는 경우 
				txtSName.setText("");
				comMname.setSelectedItem("");
				txtScore.setText("");
				txtPool.setText(sNo+"은 유효하지 않은 학번입니다.");
			}
				

			
		
		}else if (e.getSource()==btnSNameSearch) {          //이름 검색
			String sName = txtSName.getText().trim();
			if(sName.length()==0) {
				txtSNo.setText("");
				comMname.setSelectedIndex(0);
				txtScore.setText("");
				txtPool.setText("이름을 입력하고 검색하십시오");
				return;
			} //if -이름을 입력하지 않을 경우
			ArrayList<StudentSwingDto> students = dao.selectsName(sName);
			if(students.size()>1) {     //size - the number of elements in this list
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t--------------------------\n");
				for(StudentSwingDto student : students) {
					txtPool.append("\t"+students.toString()+"\n");
					txtSNo.setText(student.getsNo());
					comMname.setSelectedItem(student.getmName());
					txtScore.setText(String.valueOf(student.getScore()));
				} // for
			}else if (students.size()==1) {
				txtSNo.setText(students.get(0).getsNo());
				comMname.setSelectedItem(students.get(0).getmName());
				txtScore.setText(String.valueOf(students.get(0).getScore()));
			}else {
				txtSNo.setText("");
				comMname.setSelectedItem("");
				txtScore.setText("");
				txtPool.setText("해당 이름의 학생이 없습니다.");
			}
			
			
			
		}
		else if (e.getSource()==btnMNameSearch) { //전공 검색
			txtSNo.setText("");
			txtSName.setText("");
			txtScore.setText("");
			String mName = comMname.getSelectedItem().toString();
			if(mName.equals("")) {
				txtPool.setText("전공을 선택하고 검색 하시길 바랍니다.");
				return;
			}
			ArrayList<StudentSwingDto> students = dao.mNamegetStudent(mName);
			if(students.size()!=0) {
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t----------------\n");
				for(StudentSwingDto student:students) {
					txtPool.append("\t"+student.toString()+"\n");
				}
			}else {
				txtPool.setText("해당 학과의 학생이 없습니다");
			}//if
		}
		
		
		else if (e.getSource()== btnInput) { //학생입력
			String sName = txtSName.getText().trim();
			String mName = comMname.getSelectedItem().toString();
			if(sName.equals("") || mName.equals("")) {
				txtPool.setText("학생입력시 학번, 이름, 전공을 입력해야해");
				return;
			}
			txtPool.setText(""); //****문의****
			int score = 0;
			try {
				score = Integer.parseInt(txtScore.getText().trim());
				if(score<0 || score>100) {
					txtPool.append("유효한 점수가 아니면 0점 처리\n");
					score = 0;
				}
			}catch (NumberFormatException e1) {
				txtPool.append("점수를 입력 안 하거나 문자로 입력하면 0점 처리\n");
			}// try-catch (score 입력)
//			StudentSwingDto newStudent = new StudentSwingDto(0, sName, mName, score);
//			int result = dao.insertStudent(newStudent);
			int result = dao.insertStudent(sName, mName, score);
			if(result == StudentSwingDao.SUCCESS) {
				txtPool.append(sName+" 학생 입력 성공");
				txtSNo.setText("");
				txtSName.setText("");
				comMname.setSelectedIndex(0);
				txtScore.setText("");
			}//if
			
			
		}else if (e.getSource() == btnUpdate) {
			String sNo = txtSNo.getText().trim(); // ***내용을 가져와야**
			String sName = txtSName.getText().trim();
			String mName = comMname.getSelectedItem().toString();
			if(sName.equals("") || mName.equals("")) {
				txtPool.setText("학생입력시 학번, 이름, 전공을 입력해야해");
				return;
			}
			txtPool.setText("");
			int score = 0;
			try {
				score = Integer.parseInt(txtScore.getText().trim());
				if(score<0 || score>100) {
					txtPool.append("유효한 점수가 아니면 0점 처리\n");
					score = 0;
				}
			}catch (NumberFormatException e1) {
				txtPool.append("점수를 입력 안 하거나 문자로 입력하면 0점 처리\n");
			}
			int result = dao.updateStudent(sNo, sName, mName, score); //****
			if(result == StudentSwingDao.SUCCESS) {
				txtPool.append(sName+" 학생 수정 성공");
				txtSNo.setText("");
				txtSName.setText("");
				comMname.setSelectedIndex(0);
				txtScore.setText("");
			}//if
			
			
			
					
		}
		else if (e.getSource() == btnStudentOut) {// 학생출력(제적자를 제외하고 txtPool에) 출력
			ArrayList<StudentSwingDto> students = dao.getStudents(); //메소드가 dao에 있어야
			if(students.size()>1) {
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t──────────────────────────\n");
				for(StudentSwingDto student : students) {
					txtPool.append("\t"+student.toString()+"\n");
				} //전체 출력이므로  txtPool에만 출력하면됨
			}else {
				txtSNo.setText("");
				comMname.setSelectedItem("");
				txtScore.setText("");
				txtPool.setText("학생이 없습니다");
			}
			
		}	
			
			
		else if (e.getSource() == btnExpelOut) {  
			ArrayList<StudentSwingDto> students = dao.getStudentsExpel();
			if(students.size()!=0) {
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t──────────────────────────\n");
				for(StudentSwingDto student : students) {
					txtPool.append("\t"+student.toString()+"\n");
				}
			}else {
				txtSNo.setText("");
				comMname.setSelectedItem("");
				txtScore.setText("");
				txtPool.setText("제적 당한 학생은 없습니다.");
			}
				
		}else if (e.getSource() == btnExpel) {
			String sNo = txtSNo.getText().trim();
			if(sNo.equals("")) {
				txtSName.setText("");
				comMname.setSelectedItem("");
				comMname.setSelectedIndex(0);
				txtScore.setText("");
				txtPool.setText("학번을 입력 하세요");
				return;
			}
			int result = dao.sNoExpel(sNo);     //dao에서8번 result은 int 그래서 'int result'   메소드:sNoExpel 매게변수:sNo
									     //*********중요*******
			if(result == 1) { // 해당 학번이 DB에 검색된 경우
				txtPool.setText(sNo+" 학생 제적 처리 완료");
				
			}else { // 해당 학번이 DB에 없는 경우
				txtPool.setText(sNo+"은 유효하지 않는 학번입니다");
			}//if
			
			
			//학번 만 가져오고  (입력)
			//1로바꿈
			
		}
			
			
			
			
		else if (e.getSource() == btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		} 
			
			
			
			
	}// actionPerformed	
		public static void main(String[]args) {
			new SwingStudentMng("학사관리");
		
	}//main
	
	
	
}//class
