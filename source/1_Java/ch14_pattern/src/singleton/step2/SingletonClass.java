package singleton.step2;

public class SingletonClass {
	private static SingletonClass INSTANCE; // * = new SingletonClass();
	private int i;

	private SingletonClass() { // 변수만들고, 객체 만들어서 ==가지고와
		i = 10;
	}

	public static SingletonClass getInstance() { // method이름
		if (INSTANCE == null) {
			INSTANCE = new SingletonClass();
		}
		return INSTANCE;
	}

//	public static SingletonClass getINSTANCE() {
//		return INSTANCE;
//	}
//	public static void setINSTANCE(SingletonClass iNSTANCE) {
//		INSTANCE = iNSTANCE;
//	}
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
}
