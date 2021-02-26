package strategy1.step1;

//Super  로봇 : 날 수 O. 미사일을 쏠 수 O. 레이저검.
public class SuperRobot {
	public void shape() {
		System.out.println("SuperRobot은 팔,다리,머리,몸통으로 이루어져 있다");
	}

	public void actionWalk() {
		System.out.println("걸을 수 있다.");
	}

	public void actionRun() {
		System.out.println("띌 수 있다");
	}

	public void actionFly() {
		System.out.println("날 수 있다");
	}

	public void actionMissile() {
		System.out.println("미사일을 쏠 수 있다");
	}

	public void actionKnife() {
		System.out.println("레이저 검이 있다.");
	}
}
