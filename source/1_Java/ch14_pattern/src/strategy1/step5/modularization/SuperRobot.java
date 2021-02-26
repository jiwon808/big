package strategy1.step5.modularization;
//날수있음. 미사일쏨. 레이저검

//*이면 내용 다 들어옴   ctrl+shift+o 필요부분만 남음 
import strategy1.step4.component.FlyNo;
import strategy1.step4.component.KnifeLazer;
import strategy1.step4.component.MissileYes;

public class SuperRobot extends Robot_same_part {
	public SuperRobot() {
		setFly(new FlyNo()); // setter
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());

	}

	public void shape() {
		System.out.println("SuperRobot은 팔,다리,머리,몸통으로 이루어져 있다");

	}
}
