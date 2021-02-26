package com.lec.ex03actor;

public class TestMain {

	public static void main(String[] args) {
		Actor park = new Actor("박보검"); // 객체 만들기
		park.canCatchCriminal();
		park.canSearch();
		park.makePizza();
		park.makeSpaghetti();
		park.outFire();
		park.saveMan(); //park안에는 주소가 들은것. 객체가 아니라
		FireFighter firePark = park;
		firePark.outFire();
		firePark.saveMan();
		//firePark.canCatchCriminal(); // 변수의 타입이 다르기때문에 (변수의 다양성)
		//1000번지에 가면 . 이제 firepark에도 1000번지가 있다.  
		//Park에 1000번지가 있다. 1000번지에 가면 6개가 있다; 이번 fireP도 1000번지가 있다. 두변수 다 '박보검'을 가르키고있다.
		//Actor가 3군데로부터 implement를해서 지금 잘 출력
		PoliceMan policePark = park;
		policePark.canCatchCriminal();
		policePark.canSearch();
		Chef chefPark = park;
		chefPark.makePizza();
		chefPark.makeSpaghetti();
		//chefPark.saveMan();

	}

}
