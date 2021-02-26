package strategy1.step5.modularization;

import strategy1.step4.component.FlyYes;

public class TestMain {

	public static void main(String[] args) {
		SuperRobot superRobot = new SuperRobot();
		StandardRobot standardRobot = new StandardRobot();
		LowRobot lowRobot = new LowRobot();
		Robot_same_part[] robots = { superRobot, standardRobot, lowRobot };
		for (Robot_same_part robot : robots) { // robots안에 있는 값이 robot안으로 copy됨 [배열]
			robot.shape();
			robot.actionWalk();
			robot.actionRun();
			robot.actionFly();
			robot.actionMissile();
			robot.actionKnife();
		}
		// LowRobot을 날 수 있는 로봇으로 업그레이드 요청
		lowRobot.setFly(new FlyYes());
		// SuperRobot 날는 부품 업그레이드
		System.out.println("업그레이드 후");
		for (Robot_same_part robot : robots) {
			robot.shape();
			robot.actionWalk();
			robot.actionRun();
			robot.actionFly();
			robot.actionMissile();
			robot.actionKnife();

		}
	}

}
