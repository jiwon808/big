package strategy1.step5.modularization;

import strategy1.step4.component.IFly;
import strategy1.step4.component.IKnife;
import strategy1.step4.component.IMissile;

//공통 된 부분
public abstract class Robot_same_part { // 밑에 abstract void추가했으면, 여기도 abstract class
	private IFly fly;
	private IMissile missile;
	private IKnife knife;

	public abstract void shape();

	public void actionWalk() {
		System.out.println("걸을 수 있다.");
	}

	public void actionRun() {
		System.out.println("띌 수 있다");
	}

	public void actionFly() {
		fly.fly();
	}

	public void actionMissile() {
		missile.missile();

	}

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
