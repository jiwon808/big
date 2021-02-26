package strategy1.step3;

public class TestMain {
	public static void main(String[] args) {
		SuperRobot superRobot = new SuperRobot();
		StandardRobot standardRobot = new StandardRobot();
		LowRobot lowRobot = new LowRobot();
		Robot_same_part[] robots = { superRobot, standardRobot, lowRobot }; // 배열
		for (Robot_same_part robot : robots) {
			robot.shape();
			robot.actionWalk();
			robot.actionRun();
			robot.actionFly();// low,standard,super에서 "Robot_same_part" override했다. 따라서 밑에 3개도 여기for문에다 바로 쓸 수
								// 있음
			robot.actionMissile();
			robot.actionKnife();
			if (robot instanceof SuperRobot) { // robot라는 객체변수가SuperRobot이니
				SuperRobot tempRobot = (SuperRobot) robot;
				tempRobot.actionFly();
				tempRobot.actionMissile();
				tempRobot.actionKnife();
			} else if (robot instanceof StandardRobot) {
				StandardRobot tempRobot = (StandardRobot) robot; // tempRobot변수이름
				tempRobot.actionFly();
				tempRobot.actionMissile();
				tempRobot.actionKnife();
			} else if (robot instanceof LowRobot) {
				LowRobot tempRobot = (LowRobot) robot;
				tempRobot.actionFly();
				tempRobot.actionMissile();
				tempRobot.actionKnife();
			} // if
		} // for
	}// main
}// class
