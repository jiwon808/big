package singleton.step2;

public class FirstClass {
	public FirstClass() {
		SingletonClass singletonObject = SingletonClass.getInstance(); // singletonObject 선언
		System.out.println("FirstClass형 객체 생성");
		System.out.println(singletonObject.getI());
		singletonObject.setI(999);
		System.out.println("변화 후 i값(FirstClass에서)" + singletonObject.getI());
		System.out.println("FirstClass형 생성자 끝");
	}
}
