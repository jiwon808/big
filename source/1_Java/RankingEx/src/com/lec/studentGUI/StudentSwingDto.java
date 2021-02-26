package com.lec.studentGUI;

public class StudentSwingDto {
	private int rank;
	private String sNo;
	private String sName;
	private String mName;
	private int score;
	private int sExpel;
	
	public StudentSwingDto() {}

	//1번
	public StudentSwingDto(String sNo, String sName, String mName, int score) {
		this.sNo = sNo;
		this.sName = sName;
		this.mName = mName;
		this.score = score;
	}

	//select시 
	public StudentSwingDto(int rank, String sName, String mName, int score) {
		this.rank = rank;
		this.sName = sName;
		this.mName = mName;
		this.score = score;

	}


	@Override
	public String toString() {
		if(rank!=0) {
			return rank +"등" + "\t"+sName + "\t"+mName + "\t"+score;
		}else
		return sNo + "\t" +sName + "\t"+mName + "\t"+score;
	}

	

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


}
