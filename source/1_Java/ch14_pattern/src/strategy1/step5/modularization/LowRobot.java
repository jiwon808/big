package strategy1.step5.modularization;

import strategy1.step4.component.*;

public class LowRobot extends Robot_same_part {

	public LowRobot() { // 날 수 X. 미사일을 쏠 수 X. 검 없음.
		setFly(new FlyNo()); // setter
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}

	public void shape() {
		System.out.println("LowRobot은 팔,다리,머리,몸통으로 이루어져 있다");
	}
}
