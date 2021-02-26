package com.lec.ex2_date;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class Sawon {
	private String num;
	private String name;
//	private String part;
	private PartType part;
	private Date enterDate;

	public Sawon(String num, String name, PartType part) {
		this.num = num;
		this.name = name;
		this.part = part;
		enterDate = new Date();
	}

	public Sawon(String num, String name, PartType part, int year, int month, int day) {
		this.num = num;
		this.name = name;
		this.part = part;
		enterDate = new Date(new GregorianCalendar(year, month - 1, day).getTimeInMillis()); // !!중요
	}

	@Override // object class에 있는 내용을 override(object class에 있는 형식이 맘에 안들어서,
				// 여기서 재정의해서 새로 덮어버림) //super.toString (ctrl누르면서 object class볼 수 있음)
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		String result = "[사번]" + num + "[이름]" + name + "[부서]" + part + "[입사일]" + sdf.format(enterDate);
		return result; // 나를 호출한 곳으로 다시 돌아가 그래야 Main에서 출력가능
						// System.out.println(s1.toString());
	}

}
