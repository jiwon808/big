package singleton.step1;

public class SingletonClass {
	private int i;
	private static SingletonClass INSTANCE; //SingletonClass형 객체 주소                          2.aclass형변static 
	public static SingletonClass getInstance() {  // getInstnace는 메소드 이름              3.null이면 생성, 아니면 주소가져가 
		if(INSTANCE==null) { //메모리에 올라온 객체 ==INSTANCE 
			INSTANCE = new SingletonClass();
		} //이제 INSTANCE안에 주고 들어있어
		return INSTANCE;
		}
	
	private SingletonClass() { //  1.private int 
		i=10; //? 안띄어도되는지
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}

}//변수에null, 객체만들어, 넣어, 그럼 이제 1000 -->singleton요 아이, return
