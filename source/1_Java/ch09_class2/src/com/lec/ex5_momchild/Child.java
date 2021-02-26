package com.lec.ex5_momchild;

// Child child1 = new Child ("첫째 ")
// child1.takeMoney(100);
public class Child {
	private String name;
	static MomPouch momPouch = new MomPouch();; // static

	public Child(String name) { // 생성자,return type없어야하고,class name똑같에야하고
		this.name = name;
		momPouch = new MomPouch();
	}

	public void takeMoney(int money) {
		if (momPouch.getMoney() >= money) {
//			momPouch.money = momPouch.money - money;
			momPouch.setMoney(momPouch.getMoney() - money);
			System.out.println(name + "가" + money + "가져가서 엄마지갑엔" + momPouch.getMoney());
		} else {
			System.out.println(name + "가 돈을 못받음. 현재 엄마 돈은" + momPouch.getMoney());
		}
	}
}