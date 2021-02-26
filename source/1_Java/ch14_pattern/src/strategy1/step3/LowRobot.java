package strategy1.step3;

//Low    로봇 : 날 수 X. 미사일을 쏠 수 X. 검 없음.
public class LowRobot extends Robot_same_part {
	@Override
	public void actionFly() {
		System.out.println("날 수 없다");
	}

	@Override
	public void actionMissile() {
		System.out.println("미사일을 쏠 수 없다");
	}

	@Override
	public void actionKnife() {
		System.out.println("검이 없다.");
	}
}