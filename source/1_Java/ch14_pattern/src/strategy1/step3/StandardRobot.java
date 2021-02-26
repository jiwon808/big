package strategy1.step3;

//Standard로봇: 날 수 X. 미사일을 쏠 수 O. 목검
public class StandardRobot extends Robot_same_part {

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
