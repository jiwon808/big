package com.lec.ex08robot;

public class TestMain {
	public static void main(String[] args) {
		DanceRobot aRobot = new DanceRobot();
		SingRobot bRobot = new SingRobot();
		DrawRobot cRobot = new DrawRobot();
		RobotOrder order = new RobotOrder();
		order.action(aRobot); // 다 시킬 수 있음
		order.action(bRobot);
		Robot[] robots = { aRobot, bRobot, cRobot }; // 배열
		for (Robot robot : robots) {
			order.action(robot);
		}
	}
}
