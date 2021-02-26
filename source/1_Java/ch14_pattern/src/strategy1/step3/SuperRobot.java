package strategy1.step3;

//Super  로봇 : 날 수 O. 미사일을 쏠 수 O. 레이저검.
public class SuperRobot extends Robot_same_part {
	@Override
	public void actionFly() {
		System.out.println("날 수 있다");
	}

	@Override
	public void actionMissile() {
		System.out.println("미사일을 쏠 수 있다");
	}

	@Override
	public void actionKnife() {
		System.out.println("레이저 검이 있다."); // Robot_same_part에서 override
	}
}