package singleton.step2;

public class TestMain {
	public static void main(String[] args) {
		FirstClass firstObj = new FirstClass(); // FirstClass생성자호출됨.-->그 파일로 가면 999로변경됨 SingletonClass . 객체 생성--> 주소값
												// 들어가
		SecondClass secondObj = new SecondClass();
		SingletonClass singObj = SingletonClass.getInstance();
		System.out.println("메인메소드에서singObj안의i값은");
		System.out.println(singObj.getI());
	}
}