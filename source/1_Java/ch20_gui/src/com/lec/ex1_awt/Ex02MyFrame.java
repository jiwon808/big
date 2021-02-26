package com.lec.ex1_awt;
//2. Ư�� event �ɸ��� . �����ڿ��� ���� 
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex02MyFrame extends Frame implements ActionListener { // ��Frame�� ��ӹ޾ƾ� ���� �� �ִ�
	private Label lbl1; // �߰��� ������Ʈ ������ ����
	private Button btnExit;

	public Ex02MyFrame() {
		//frame�� label�� button �߰��� setVisible�� setSize
		//frame�� layout��Ÿ���� flowLayout()���� - add������� �������� 
		setLayout(new FlowLayout());
		//setLayout(new BorderLayout()); --�⺻
		//setLayout(new GridLayout(2,2)); --2��2��¥�� ����  layout
		lbl1 = new Label("��ſ� ������");
		lbl1.setPreferredSize(new Dimension(150,200)); //������Ʈ ������
		btnExit = new Button("����");
		btnExit.setPreferredSize(new Dimension(200,100));
		add(lbl1);
		add(btnExit);
		setVisible(true);
		setSize(new Dimension(500,300));
		setLocation(100,100);
		//btnExit Ŭ���̺�Ʈ �߻��Ǹ� this.actionPerformed()ȣ�� 
		btnExit.addActionListener(this);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
			setVisible(false);
			dispose();
			System.exit(0);
			}
		});
	}

	public Ex02MyFrame(String title) {
		this();
		setTitle(title);
	}

	public static void main(String[] args) {
		new Ex02MyFrame("�� ��° GUI ����");
	}


	@Override
	public void actionPerformed(ActionEvent e) {  //�̺�Ʈ ó�� �޼ҵ�  //�̺�Ʈ �ɸ� �ֵ鿡�� ����
		// btnExit Ŭ���̺�Ʈ �߻��Ǹ� this.actionPerformed()ȣ�� 
		if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}
		
}
