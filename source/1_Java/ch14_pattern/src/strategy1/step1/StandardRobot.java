package strategy1.step1;

//Standard로봇: 날 수 X. 미사일을 쏠 수 O. 목검
public class StandardRobot {
	public void shape() {
		System.out.println("StandardRobot은 팔,다리,머리,몸통으로 이루어져 있다");
	}

	public void actionWalk() {
		System.out.println("걸을 수 있다.");
	}

	public void actionRun() {
		System.out.println("띌 수 있다");
	}

	public void actionFly() {
		System.out.println("날 수 없다");
	}

	public void actionMissile() {
		System.out.println("미사일을 쏠 수 있다");
	}

	public void actionKnife() {
		System.out.println("목검이 있다.");
	}
}