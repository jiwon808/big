package singleton.step1;

public class AClass {
	private int intVar; //1번
	private static AClass INSTANCE;  //2번 변수가 null이냐 아니야. 변수의 타입은 '클래스명'과 동일 // 최소null
	public static AClass getInstance(){ //3.main에서 access해야하기에 public static+ 변수타입
		if(INSTANCE==null) {
			INSTANCE = new AClass(); //객체를 만들자. instace최초만들면 new. 그 객체가 위INSTANCE가 가지고 있기 때문에 newAClass
		}
		return INSTANCE;
	}
	private AClass() {}  //?
	public int getIntVar() {
		return intVar;
	}
	public void setIntVar(int intVar) {
		this.intVar = intVar;
	}
}	