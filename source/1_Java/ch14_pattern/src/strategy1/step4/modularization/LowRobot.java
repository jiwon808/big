package strategy1.step4.modularization;

import strategy1.step4.component.*;

public class LowRobot extends Robot_same_part {
	private IFly fly;
	private IMissile missile;
	private IKnife knife;

	public LowRobot() { // 날 수 X. 미사일을 쏠 수 X. 검 없음.
		fly = new FlyNo();
		missile = new MissileNo();
		knife = new KnifeWoodNo();

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

	@Override
	public void actionFly() {
		fly.fly();
	}
}