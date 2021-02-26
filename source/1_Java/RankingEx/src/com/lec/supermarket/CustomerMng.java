package com.lec.supermarket;

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

import com.lec.studentGUI.StudentSwingDao;
import com.lec.studentGUI.StudentSwingDto;
import com.lec.studentGUI.SwingStudentMng;

public class CustomerMng extends JFrame implements ActionListener {
	private Container container;
	private JPanel jpup, jpbtn;
	private JTextField txtCId, txtCTel, txtCName, txtCPoint, txtCAmount;
	private Vector<String> levelNames; //Combobox에 들어갈 내용 
	private JComboBox<String> comLevelName;
	private JButton btnCIdSearch, btnCTelSearch, btnCNameSearch, btnBuyWithPoint,
	btnBuy,btnLevelNameOutput,btnAllOutput, btnInsert,btnCTelUpdate,btnDelete,btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;
	private String driver; // ***********?***************
	private String url; // ***********?***************
	private CustomerDao  dao = CustomerDao.getInstance(); //*****?*****
	private ArrayList<CustomerDto> customer; //*****?*****
	public CustomerMng(String title) {
		super(title); //super는 왜 필요하는지?
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		container = getContentPane();
		container.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(6,3));
		jpbtn = new JPanel(new FlowLayout());
	
		txtCId   = new JTextField(20);
		txtCTel  = new JTextField(20);
		txtCName  = new JTextField(20);
		txtCPoint = new JTextField(20);
		txtCAmount = new JTextField(20);
	
		levelNames = dao.getLevelNames(); //************dao의 0번  (콤보박스에 들어갈 내용)
		comLevelName = new JComboBox<String>(levelNames);
	
		
	//button
		btnCIdSearch = new JButton("아이디 검색");
		btnCTelSearch = new JButton("폰4자리(FULL) 검색");
		btnCNameSearch = new JButton("고객 이름 검색");
		btnBuyWithPoint = new JButton("포인트로만 구매");
		
		txtPool = new JTextArea(6, 70);
		scrollPane = new JScrollPane(txtPool);
		jpup.add(new JLabel(" 아 이 디 ",(int) CENTER_ALIGNMENT));
		jpup.add(txtCId);
		jpup.add(btnCIdSearch);
		jpup.add(new JLabel("고 객 전 화",(int) CENTER_ALIGNMENT));
		jpup.add(txtCTel);
		jpup.add(btnCTelSearch);
		jpup.add(new JLabel("고 객 이 름",(int) CENTER_ALIGNMENT));
		jpup.add(txtCName);
		jpup.add(btnCNameSearch);
		jpup.add(new JLabel("포  인  트",(int) CENTER_ALIGNMENT));
		jpup.add(txtCPoint);
		jpup.add(btnBuyWithPoint);
		jpup.add(new JLabel("구 매 금 액",(int) CENTER_ALIGNMENT));
		jpup.add(txtCAmount);
		jpup.add(new JLabel(""));//빈 라벨 추가하는 부분
		jpup.add(new JLabel("고 객 등 급",(int) CENTER_ALIGNMENT));
		jpup.add(comLevelName);
		
		btnBuy = new JButton("물품 구매");
		btnLevelNameOutput = new JButton("등급별출력");
		btnAllOutput = new JButton("전체출력");
		btnInsert = new JButton("회원가입");
		btnCTelUpdate = new JButton("번호수정");
		btnDelete = new JButton("회원탈퇴");
		btnExit = new JButton("나가기");
		
		jpbtn.add(btnBuy);
		jpbtn.add(btnLevelNameOutput);
		jpbtn.add(btnAllOutput);
		jpbtn.add(btnInsert);
		jpbtn.add(btnCTelUpdate);
		jpbtn.add(btnDelete);
		jpbtn.add(btnExit);
	
		container.add(jpup);
		container.add(jpbtn);
		container.add(scrollPane);
		setSize(new Dimension(800, 400));setLocation(200, 200);
		setVisible(true);
		txtPool.setText("\t★ ★ ★ 고객검색 후 구매하세요 ★ ★ ★");
		
// *********(2)function**********
		btnCIdSearch.addActionListener(this);
		btnCTelSearch.addActionListener(this);
		btnCNameSearch.addActionListener(this);
		btnBuyWithPoint.addActionListener(this);
		btnBuy.addActionListener(this);
		btnLevelNameOutput.addActionListener(this); 
		btnAllOutput.addActionListener(this);
		btnInsert.addActionListener(this);
		btnCTelUpdate.addActionListener(this);
		btnDelete.addActionListener(this);
		btnExit.addActionListener(this);		

	} //main
	// *********(1)implements override**********
	@Override
	public void actionPerformed(ActionEvent e) {
// -- 1. cId로 검색 : public CustomerDto cIdGetCustomers(int cId)   
		//[입력]
		if(e.getSource()==btnCIdSearch) {
			// int cId  txtCId.getText().trim(); //**여기는txtCId는  String만 가능. 그러나 내가 설정시 int cId.따라서 밑에와 같이 try-catch
			//SwingStudentMng에서  btnInput. (Score)부분과 유사
			int cId=0; 
			try {
				cId = Integer.parseInt(txtCId.getText().trim());

			} catch (Exception e1) {
				txtPool.setText("유효한 고객ID를 입력하시고 아이디 검색하세요.\n"); //txtPool.append는 원래 있는거에 추가   setText는 새로
				return; //*****return ==여기서 딱 끝내 (밑으로 안빠짐)*****    int cId=0 한 이유   만약에 cId를 초기화하지 않으면 아무값도 없다. return이 없을 시 밑으로 떨어져 그럼error발생
			}
			
			
			CustomerDto dto = dao. cIdGetCustomers(cId);
			if(dto !=null) { //[상황1]해당 cID가 DB에 검색되었을 경우
				txtPool.setText("ID\t전화\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추가 구매할 금액\n");
				txtPool.append("────────────────────────────────────────────────────────\n");
				txtPool.append(dto.toString()+"\n");  //****** dto.toString()  ****
				
				//txtCId.setText(""+dto.getcId());     //-실행화면에 cID로 검색하면 ' cID, cTEL, cPOINT,cAMOUNT, LEVELNAME ' 다 나오기 위해. 다 여기다 나열
				txtCTel.setText(dto.getcTel());
				txtCName.setText(dto.getcName());
				txtCPoint.setText(String.valueOf(dto.getcPoint()));
				txtCAmount.setText(String.valueOf(dto.getcAmount()));
				comLevelName.setSelectedItem(dto.getLevelName());
				
				
			} else {  //[상황2]해당 학번이 DB에 없는 경우 
				txtPool.setText("검색되지 않은ID입니다"); 
				
			}
			
		}
			
//-- 2. 폰뒤4자리(FULL) 검색 - CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을 위한 쓸 돈
//--    public ArrayList<CustomerDto> cTelGetCustomers(String cTel);   --*()안에는 폰4자리들어와야
		else if  (e.getSource()==btnCTelSearch) {
			String cTel =txtCTel.getText().trim();
			if(cTel.length()<4) { //*********중요: 전화번호 4자리 입력해야하는데, 만약에 이보다 적을 시 다시 입력
				txtPool.setText("전화번호를 입력하고 검색하십시오"); // }else if (e.getSource()==btnSNameSearch)부분 문의. 왜 여기는 바로 안썼는지
				return;
			}
			
			ArrayList<CustomerDto> dtos = dao.cTelGetCustomers(cTel);
			if(dtos.size()>=1) {
				txtPool.setText("ID\t전화\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추가 구매할 금액\n");
				txtPool.append("\t------------------------------------------------------\n");
				for(CustomerDto d: dtos) { //dtos가 전체  d는 몇번째 방을 의미
					txtPool.append(d.toString()+"\n"); //********??//
					txtCId.setText(String.valueOf(d.getcId()));     
					txtCTel.setText(d.getcTel());
					txtCName.setText(d.getcName());
					txtCPoint.setText(String.valueOf(d.getcPoint()));
					txtCAmount.setText(String.valueOf(d.getcAmount()));
					comLevelName.setSelectedItem(d.getLevelName());
				}
				
				
			} else {
				txtPool.setText("해당 전화번호의 고객이 검색되지 않습니다. 회원가입 해 주세요.");    //db에 입력이 안되어있을 경우
				txtCId.setText("");     
				//txtCTel.setText("");
				txtCName.setText("");
				txtCPoint.setText("");
				txtCAmount.setText("");
				comLevelName.setSelectedItem(0);  //첫번쨰 방 빈방  (Dao에 그렇게 설정)
				//다른 필드(""비었다)를 써야 화면에서 칸이 깨끗해져
			}
			
			
			
		}
			
/*-- 3. 고객이름검색 - CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을 위한 쓸 돈          --*실행화면 보면 3번째 칸
--                       public ArrayList<CustomerDto> cNameGetCustomers(String cName);*/			
		else if (e.getSource()== btnCNameSearch) {
			String cName = txtCName.getText().trim();
			if(cName.length()==0) {
				txtPool.setText("이름을 입력하시고 검색하십시오");
				return;
				
			} //if 이름 입력했는지
			ArrayList<CustomerDto> customers = dao.cNameGetCustomers(cName);
			if(customers.size()>=1) { //여기서 size는 방의 갯수
				txtPool.setText("ID\t전화\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추가 구매할 금액\n");
				txtPool.append("────────────────────────────────────────────────────────\n");
				for(CustomerDto customer : customers) {
					txtPool.append(customer.toString()+"\n"); //화면 '밑에'뿌리고
					txtCId.setText(String.valueOf(customer.getcId())); //화면 '위에' 뿌리고
					txtCTel.setText(customer.getcTel());
					//txtCName.setText(customer.getcName());
					txtCPoint.setText(String.valueOf(customer.getcPoint()));
					txtCAmount.setText("");
					comLevelName.setSelectedItem(customer.getLevelName());
				}//for
			}else {
				txtPool.setText("해당 이름의 고객이 검색되지 않습니다. 회원가입 해 주세요");
				txtCId.setText("");
				txtCName.setText("");
				txtCPoint.setText("");
				txtCAmount.setText("");
				comLevelName.setSelectedIndex(0);
			}

		}
			
			

			
/*-- 4. 포인트로만 구매(1000원짜리를 포인트로만 구매) : public int buyWithPoint(int cAmount, int cId)   *성공하면1, 실패하면 0*/		
		else if (e.getSource() == btnBuyWithPoint) {
			
			String cTel = txtCTel.getText().trim();
			if(cTel.length()<4) {
				txtPool.setText("적어도 폰4자리 이상 입력하시고 검색하세요");
				return;
			}// if - 폰4자리 이상 입력했는지
			ArrayList<CustomerDto> customers = dao.cTelGetCustomers(cTel);
			if(customers.size()>=1) {
				txtPool.setText("ID\t전화\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추가 구매할 금액\n");
				txtPool.append("────────────────────────────────────────────────────────\n");
				for(CustomerDto customer : customers) {
					txtPool.append(customer.toString()+"\n");
					//txtCId.setText(""+customer.getcId());
					txtCId.setText(String.valueOf(customer.getcId()));
					txtCTel.setText(customer.getcTel());
					txtCName.setText(customer.getcName());
					//txtCPoint.setText(""+customer.getcPoint());
					txtCPoint.setText(String.valueOf(customer.getcPoint()));
					txtCAmount.setText("");
					comLevelName.setSelectedItem(customer.getLevelName());
				}//for
			}else {
				txtPool.setText("해당 전화번호의 고객이 검색되지 않습니다. 회원가입 해 주세요");
				txtCId.setText("");
				txtCName.setText("");
				txtCPoint.setText("");
				txtCAmount.setText("");
				comLevelName.setSelectedIndex(0);
			}
			
			
			
			
/*-- 5. 물품구매 (1000000원짜리를 구매할 경우. 포인트는 구매금액의 5%)      (POINT,CAMOUNT,LEVELNO변경) */			
		}else if (e.getSource() == btnBuy) {
			int cId = 0,cAmount=0 ;
			try {
				cId = Integer.parseInt(txtCId.getText().trim());
				cAmount = Integer.parseInt(txtCAmount.getText().trim());
			}catch (NumberFormatException e1) {
				txtPool.setText("유효한 고객ID와 전화번호를 입력하세요");
				return;
			}
			
			int result = dao.updatePoint(cId, cAmount); //8번Dao에서 이렇게 설정 int result
			if(result == CustomerDao.SUCCESS) {
				//txtPool.append("  입력 성공");
				txtCId.setText("");
				txtCTel.setText("");
				txtCName.setText("");
				txtCPoint.setText("");
				txtCAmount.setText("");
				comLevelName.setSelectedIndex(0);
			}
			
			
		}


			
			
			
			
/*-- 6. 등급별출력 - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈
--              public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)*/
			
		else if (e.getSource() == btnLevelNameOutput) {
			txtCId.setText("");
			txtCTel.setText("");
			txtCName.setText("");
			txtCPoint.setText("");
			String levelName = comLevelName.getSelectedItem().toString();
			if(levelName.equals("")) {
				txtPool.setText("원하는 등급을 선택하시고 검색하세요");
				return;
			}// if - 폰4자리 이상 입력했는지
			ArrayList<CustomerDto> customers = dao.levelNameGetCustomers(levelName);
			if(customers.size()!=0) {
				txtPool.setText("ID\t전화\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추가 구매할 금액\n");
				txtPool.append("────────────────────────────────────────────────────────\n");
				for(CustomerDto customer : customers) {
					txtPool.append(customer.toString()+"\n");
				}//for
				txtPool.append("총 "+customers.size()+"명");
			}else {
				txtPool.setText("해당 레벨의 고객이 검색되지 않습니다. 회원가입 해 주세요");
			}	

/*-- 7.전체출력 - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈     *(실행화면 밑에 라인 버튼의 2번째)
--            public ArrayList<CustomerDto> getCustomers()          */
		}else if (e.getSource() == btnAllOutput) {
			ArrayList<CustomerDto> customers = dao.getCustomers();
			if(customers.size()>=1) {
				txtPool.setText("ID\t전화\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을 위한 추가 구매할 금액\n");
				txtPool.append("────────────────────────────────────────────────────────\n");
				for(CustomerDto customer : customers) {
					txtPool.append("\t"+customer.toString()+"\n");
				} //전체 출력이므로  txtPool에만 출력하면됨
			}else {
				txtPool.setText("해당 고객이 없습니다");
				txtCId.setText("");
				txtCTel.setText("");
				txtCName.setText("");
				txtCPoint.setText("");
				txtCAmount.setText("");
				comLevelName.setSelectedIndex(0);
			}
			
		}
	
/*-- 8. 회원가입(고객전화와 고객이름은 입력받아 INSERT)
--          public int insertCustomer(String cTel, String cName)*/
		else if (e.getSource() == btnInsert) {
			String cTel = txtCTel.getText().trim();
			String cName = txtCName.getText().trim();
			if(cTel.equals("") || cName.equals("") ) {
				txtPool.setText("고객전화와 고객이름 입력해야해주세요");
				return;
			}

			int result = dao.insertCustomer(cTel, cName); //8번Dao에서 이렇게 설정 int result
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText(cName+"  회원 가입 성공");
				txtCId.setText("");
				txtCTel.setText("");
				txtCName.setText("");
				txtCPoint.setText("");
				txtCAmount.setText("");
				comLevelName.setSelectedIndex(0);
			}
			
			
		}

			
/*-- 9. 번호수정 : public int updateCustomer(String cTel, int cId)*/
		else if (e.getSource() == btnCTelUpdate) { // 번호수정
			int cId = 0; String cTel;
			try {
				cId = Integer.parseInt(txtCId.getText().trim());
				cTel = txtCTel.getText().trim();
				if(cTel.equals("")) {
					txtPool.setText("변경할 전화번호를 입력하셔야 번호수정이 가능합니다.");
					return;
				}
			}catch (NumberFormatException e1) {
				txtPool.setText("유효한 고객ID를 검색 후 변호변경을 하세요");
				return;
			}
			int result = dao.updateCustomer(cTel, cId);
			if(result==CustomerDao.SUCCESS) {
				txtPool.setText("아이디 : "+cId+"님의 전화번호가 수정되었습니다");
			}else {
				txtPool.setText("유효한 고객ID를 검색 후 변호변경을 하세요");
			}	
			
			
			
			
/*-- 10. 회원탈퇴 : public int deleteCustomer(int cId)*/
		}else if (e.getSource() == btnDelete) {
			int cId = 0;
			try {
				cId = Integer.parseInt(txtCId.getText().trim());
			} catch (Exception e2) {
				txtPool.setText("탈퇴할 고객아이디를 입력 하세요");
				return;
			}
			
			int result = dao.deleteCustomer(cId);     //dao에서8번 result은 int 그래서 'int result'   메소드:sNoExpel 매게변수:sNo
			//*********중요*******
			if(result == 1) { // 해당 학번이 DB에 검색된 경우
				txtPool.setText(cId+"탈퇴 성공");

			}else { // 해당 학번이 DB에 없는 경우
				txtPool.setText(cId+"탈퇴 실패");
			}//if
		
		
		

/*exit*/			
		}else if (e.getSource() == btnExit) {	
			setVisible(false);
			dispose();
			System.exit(0);
		}
				
			
	} // actionPerformed
	
	public static void main(String[]args) {
		new CustomerMng("슈퍼마켓 관리");
	}
	
	
} // class
