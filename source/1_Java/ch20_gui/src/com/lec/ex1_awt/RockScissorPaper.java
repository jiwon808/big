package com.lec.ex1_awt;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class RockScissorPaper extends Frame implements ActionListener {
	private Panel panel;
	private TextField txtField;
	private Button btnRock,btnScissor,btnPaper,btnExit,btnRemove; //����: btnExit,btnRemove �������
	private List list;
	public RockScissorPaper(String title) { 
		super(title); //*********�߿�! //RockScissorPaper�� Frame���κ��� ��ӹ���. ���� super�ڵ������� ����
					//super();�ϸ� �ƹ��͵� �ȳ��� //title�� �ʿ��ؼ�  Frame(java.awt)���κ��� Ÿ��Ʋ�� ������
					//Frame(java.awt)- A Frame is a top-level window with a title and a border. 
		setLayout(new BorderLayout());
		panel = new Panel(new FlowLayout());// Panel�� flowlayout�� �⺻�� //�� �� �гΰ�ü
//		txtField = new TextField(100);
		btnRock = new Button ("����");
		btnScissor = new Button ("����");
		btnPaper = new Button("��");
		btnRemove = new Button ("�����");
		btnExit = new Button("����");
		list = new List(5); //5�ٱ����� ������. �ؿ� ������ scroll�� �̿� 
//		panel.add(txtField);
		panel.add(btnScissor);
		panel.add(btnRock);
		panel.add(btnPaper);
		panel.add(btnRemove);
		add(panel,BorderLayout.NORTH); 
		add(list,BorderLayout.CENTER); // �������� ���  //�����ư �� ��
		add(btnExit, BorderLayout.SOUTH);
//		setVisible(true);
		setSize(new Dimension(300,200));
		setVisible(true);
		//!�߿�********
		addWindowListener(new WindowAdapter() { //*��ġ�� �ٷ� �����¹� ********?
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false);
				dispose();
				System.exit(0); //����
			}
		}); 
		btnRock.addActionListener(this);  //ActionListener�� ����,����,�� ��ư Ŭ���ߴ��� ����. click�ߴ��� �ؿ� method ȣ��
		btnScissor.addActionListener(this);
		btnPaper.addActionListener(this);
		btnRemove.addActionListener(this);  
		btnExit.addActionListener(this);	//RockScissorPaper �ȿ�  Actionperformed�� �ִ�. ���� this�� actionPerformedȣ��
											//Actionperformed�� ActionListener�κ��� override
		
	}//main
	@Override
	public void actionPerformed(ActionEvent e) { 
		int computer =(int)(Math.random()*3);
		if(e.getSource()==btnRock) { //����
			switch(computer) {
			case 0: 
				list.add("����� �̱�. ����� ��, ��ǻ�ʹ� ����");
				break;
			case 1: 
				list.add("���. ��Ű� ��ǻ�� ��� ����");
				break;
			case 2:
				list.add("��ǻ�Ͱ� �̱�. ����� ����, ��ǻ�ʹ� ��");
				break;
			}
			
		}else if(e.getSource()==btnScissor) { //����
			switch(computer) {
			case 0:
				list.add("���. �츮 �� ����");
				break;
			case 1:
				list.add("��ǻ�Ͱ� �̱�.����� ����, ��ǻ�ʹ� ����");
				break;
			case 2:
				list.add("����� �̱�.����� ����, ��ǻ�ʹ� ��");
				break;
			}
		}else if(e.getSource()==btnPaper) { //��
			switch(computer) {
			case 0:
				list.add("���. �츮 �� ��");
				break;
			case 1:
				list.add("��ǻ�Ͱ� �̱�. ����� ��, ��ǻ�ʹ� ����");
				break;
			case 2:
				list.add("����� �̱�. ����� ��, ��ǻ�ʹ� ����");
				break;
			}
		}else if(e.getSource()==btnExit) { //����
			setVisible(false);
			dispose();
			System.exit(0);
		}else if (e.getSource()==btnRemove) { //��� ����
			list.removeAll();
		}
			
		//*********************����� �� �� ������ ��� �Ǵ���*******************************************************
	}
//	public RockScissorPaper() {
//		this("");
//	}
	public static void main(String[] args) {
		new RockScissorPaper("ù ���� ���� �� ����");
		
	}
}//class
