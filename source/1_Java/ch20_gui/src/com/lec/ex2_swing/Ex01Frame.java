package com.lec.ex2_swing;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
//swing�� panel�� �ѹ� ���Ѵ�
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Ex01Frame extends JFrame implements ActionListener { //1.implement ActionListener
	//An extended version of java.awt.Frame that adds support for the JFC/Swing component architecture
	private JPanel panel;
	private JLabel jlbl;
	private JButton btn;
	public Ex01Frame(String title) { //title�ִ� windows
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); //X��ư ������ �����  //! �̰� �� �� �̸� ����
		panel = (JPanel)getContentPane(); // �����̳�(Frame)�� ����
		panel.setLayout(new FlowLayout());//����. ����containframe�� �Ӽ��� borderlayout�� �״�� �����ͼ� flowlayout�� �����ؾ�
		jlbl = new JLabel("��ſ� ������",(int)CENTER_ALIGNMENT);
		jlbl.setPreferredSize(new Dimension(150,200));
		btn = new JButton("����");  //button�� icon�� ���� �� �ִ�
		btn.setPreferredSize(new Dimension(200,200));
		panel.add(jlbl); //panel��ü�� �������� ������ ,panel��ü�� frame
		panel.add(btn);
		setVisible(true);
		//pack(); //�ּ����� ������ ����
		setSize(new Dimension(500,300));
		setVisible(true);
		//2.listener�߰� (�����ڿ� �߰�)
		btn.addActionListener(this);
	}
	public static void main(String[] args) {
		new Ex01Frame("ù ��������");
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
