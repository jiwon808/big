package com.lec.studentGUI;
//Arraylist.size 
public class TestMain {
	/* 0. 첫화면에 전공이름들 콤보박스에 추가(mName) 
	: public Vector<String> getMNamelist()
	1. 학번검색 (sNo, sName, mName, score) 
	: public StudentSwingDto sNogetStudent(String sNo)
	2. 이름검색 (sNo, sName, mName, score) 
	: public ArrayList<StudentSwingDto> sNamegetStudent(String sName)
	3. 전공검색 (rank, sName(sNo포함), mName(mNo포함), score) 
	: public ArrayList<StudentSwingDto> mNamegetStudent(String mName)
	4. 학생입력 
	: public int insertStudent(String sName, String mName, int score)
	    public int insertStudent(StudentSwingDto dto)
	5. 학생수정 
	: public int updateStudent(String sNo,String sName,
	String mName,int score)
	    public int updateStudent(StudentSwingDto dto)
	6. 학생출력 (rank, sName(sNo포함), mName(mNo포함), score) 
	: public ArrayList<StudentSwingDto> getStudents()
	7. 제적자출력  (rank, sName(sNo포함), mName(mNo포함), score) 
	: public ArrayList<StudentSwingDto> getStudentsExpel()
	8. 제적처리 : public int sNoExpel(String sNo)
	*/
	public static void main(String[] args) {
		StudentSwingDto dto = new StudentSwingDto("정우성","빅데이터학",90);
		StudentSwingDao dao = StudentSwingDao.getInstance();
		int result = dao.insertStudent1(dto);
		System.out.println(result == StudentSwingDao.SUCCESS?"입력성공":"입력실패");
		
		System.out.println("----------------1번test--------------");
		
		
		
		System.out.println("----------------2번test--------------");
		
		
		
		System.out.println("----------------3번test--------------");
		
		
		System.out.println("----------------4번test--------------");
		
		System.out.println("----------------5번test--------------");
		
		
		System.out.println("----------------6번test--------------");
		
		
		System.out.println("----------------7번test--------------");
		
		System.out.println("----------------8번test--------------");
		result = dao.sNoExpel();
		if(result.isEmpty()) {
			System.out.println("제적된 학생이 없습니다.");
		}else {
				System.out.println(result);
		}
		
	}

}
