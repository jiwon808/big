package com.lec.supermarket;
//Dto는 입출력만  . 따라서 입출력 안되는 내용은 변수선언 할 필요가 없음
public class CustomerDto {
	//private int levelNo; 입출력 안됨 
	//private int low;  입출력 안됨 
	//private int high; 입출력 안됨 
	private int cId;
	private String cTel;
	private String cName;
	private int cPoint;
	private int cAmount;
	private String levelName;
	private int forLevelup;

	// 어떤 것을 검색해도 이 형식으로 출력 
	public CustomerDto(int cId, String cTel, String cName, int cPoint, int cAmount, String levelName,
			int forLevelup) {
		this.cId = cId;
		this.cTel = cTel;
		this.cName = cName;
		this.cPoint= cPoint;
		this.cAmount = cAmount;
		this.levelName = levelName;
		this.forLevelup = forLevelup;
	}

	@Override
	public String toString() {
		return cId + "\t" + cTel + "\t" + cName + "\t"+ cPoint +  "\t" + cAmount +  "\t"+ levelName +"\t"+ forLevelup;
				
	}


	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcTel() {
		return cTel;
	}

	public void setcTel(String cTel) {
		this.cTel = cTel;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getcPoint() {
		return cAmount;
	}

	public void setcPoint(int cPoint) {
		this.cPoint = cPoint;
	}
	
	public int getcAmount() {
		return cAmount;
	}

	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	
	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	
	public int getforLevelup() {
		return forLevelup;
	}

	public void setforLevelup(int forLevelup) {
		this.forLevelup = forLevelup;
	}
	
	
}
