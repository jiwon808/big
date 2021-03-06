package strategy1.step5.modularization;

import strategy1.step4.component.FlyNo;
import strategy1.step4.component.KnifeLazer;
import strategy1.step4.component.MissileYes; //ctrl+shift+o (필요한거만 남음)

public class StandardRobot extends Robot_same_part {

	public StandardRobot() { // 날 수 X. 미사일을 쓸 수O. 목검
								// 부품들 생성 //클래스 가지고 객체 생성
		setFly(new FlyNo()); // setter
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}

	public void shape() {
		System.out.println("StandardRobot은 팔,다리,머리,몸통으로 이루어져 있다");
	}

}
