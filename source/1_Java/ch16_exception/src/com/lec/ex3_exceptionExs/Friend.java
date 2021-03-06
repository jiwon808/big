package com.lec.ex3_exceptionExs;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Friend {
	private String name;
	private String tel;
	private Date enterDate;

	public Friend(String name, String tel) {
		this.name = name;
		this.tel = tel;
		enterDate = new Date(); // null값 안들어가기 위해
	}

	@Override
	public String toString() {
		String post = tel.substring(tel.lastIndexOf("-") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년도에 친구됨");
		return "Friend [name=" + name + ", tel=***-****-" + post + "\t" + sdf.format(enterDate) + "]";
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public String getTel() {
		return tel;
	}

}// class