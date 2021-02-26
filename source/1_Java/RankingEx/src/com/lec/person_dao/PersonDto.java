package com.lec.person_dao;

public class PersonDto {

		private int rank;
		private String name;
		private String jname;
		private int kor;
		private int eng;
		private int math;
		private int sum;
		//select�떆
		public PersonDto(int rank, String name, String jname, int kor, int eng, int math, int sum) {
			this.rank = rank;
			this.name = name;
			this.jname = jname;
			this.kor = kor;
			this.eng = eng;
			this.math = math;
			this.sum = sum;
		}
		//insert�떆
		public PersonDto(String name, String jname, int kor, int eng, int math) {
			this.name = name;
			this.jname = jname;
			this.kor = kor;
			this.eng = eng;
			this.math = math;
		}
		
		
		
		@Override
		public String toString() {
			return rank + "\t" + name + "\t" + jname + "\t" + kor + "\t" + eng
					+ "\t" + math + "\t" + sum ;
		}



		public void setRank(int rank) {
			this.rank = rank;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getJname() {
			return jname;
		}
		public void setJname(String jname) {
			this.jname = jname;
		}
		public int getKor() {
			return kor;
		}
		public void setKor(int kor) {
			this.kor = kor;
		}
		public int getEng() {
			return eng;
		}
		public void setEng(int eng) {
			this.eng = eng;
		}
		public int getMath() {
			return math;
		}
		public void setMath(int math) {
			this.math = math;
		}
		public int getSum() {
			return sum;
		}
		public void setSum(int sum) {
			this.sum = sum;
		}
		
		
		
	

}
