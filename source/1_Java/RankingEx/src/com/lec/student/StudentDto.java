package com.lec.student;

public class StudentDto {
	private int rank;
	private String sNo;
	private String sName;
	private String mName;
	private int  score;
	private int sExpel;
	
	//select시 (dao에서2번)
	public StudentDto(String sNo,String sName, String mName, int score) {
		this.sNo = sNo;
		this.sName = sName;
		this.mName = mName;
		this.score = score;
	}

	//select시 (dao에서3번)
	public StudentDto(int rank, String sName, String mName, int score) {
		this.rank = rank;
		this.sName = sName;
		this.mName = mName;
		this.score = score;
	}

	//insert시
	public StudentDto(String sName, String mName, int score) {
		this.sName = sName;
		this.mName = mName;
		this.score = score;
	}


	



	@Override
	public String toString() {  //출력형식
		if (mName.length()<6) {
			return rank +"등\t" +"\t"+sName +"\t" +mName +"\t\t" + score  ;	
		}else
			return rank +"등\t" +"\t"+sName +"\t" +mName +"\t" + score  ;
	}

	/*	public String toString() {  
			return rank +"\t" +"\t"+sName +"\t" +mName +"\t" + score  ;
	}*/

	public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public String getsNo() {
		return sNo;
	}


	public void setsNo(String sNo) {
		this.sNo = sNo;
	}


	public String getsName() {
		return sName;
	}


	public void setsName(String sName) {
		this.sName = sName;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public int getsExpel() {
		return sExpel;
	}


	public void setsExpel(int sExpel) {
		this.sExpel = sExpel;
	}

	
}
