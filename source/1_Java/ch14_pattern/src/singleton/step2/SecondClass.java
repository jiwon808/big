package singleton.step2;

public class SecondClass {
	public SecondClass() {
		SingletonClass singletonObject = SingletonClass.getInstance();
		System.out.println("SecondClass 생성자");
		System.out.println(singletonObject.getI()); /// 999가 뿌려져 (FirstClass봐
		System.out.println("SecondClass 생성자 끝 ===");
	}
}
