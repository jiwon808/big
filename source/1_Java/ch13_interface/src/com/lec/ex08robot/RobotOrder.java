package com.lec.ex08robot;

public class RobotOrder {
	public void action(Robot robot) { // 이 안에 있는 robot만 일시킬 수 있다 //Dance타입이면 Dance 시킴
		if (robot instanceof DanceRobot) { // instance of- checks whether an object is an instance of a specific class
											// or an interface.
			((DanceRobot) robot).dance();
//			DanceRobot dRobot =(DanceRobot)robot;
//			dRobot.dance();

		} else if (robot instanceof SingRobot) {
			((SingRobot) robot).sing();
//			SingRobot sRobot = (SingRobot)robot;
//			sRobot.sing();
		} else if (robot instanceof DrawRobot) {
			((DrawRobot) robot).draw();
			// DrawRobot dRobot = (DrawRobot)robot;
			// dRobot.draw();
		}

	}
}