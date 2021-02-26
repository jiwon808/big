package strategy1.step4.modularization;

import strategy1.step4.component.*;

public class StandardRobot extends Robot_same_part {
	private IFly fly;
	private IMissile missile;
	private IKnife knife;

	public StandardRobot() { // 날 수 X. 미사일을 쓸 수O. 목검
								// 부품들 생성 //클래스 가지고 객체 생성
		fly = new FlyNo(); // 이거 안넣으면 다 null값
		missile = new MissileYes();
		knife = new KnifeWood();
		// setFly(new FlyNo()); //setter
		// setMissile(new MissileYes());
		// setFly(new KnifeLazer());

	}

	@Override
	public void actionFly() {
		fly.fly();

	}

	@Override
	public void actionMissile() {
		missile.missile();

	}

	@Override
	public void actionKnife() {
		knife.knife();

	}

	// setter
	public void setFly(IFly fly) {
		this.fly = fly;
	}

	public void setMissile(IMissile missile) {
		this.missile = missile;
	}

	public void setKnife(IKnife knife) {
		this.knife = knife;
	}

}