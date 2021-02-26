package strategy1.step4.component;

//missile 쏠 수 있는 부품                     //구현은 여기서 
public class MissileYes implements IMissile {

	@Override
	public void missile() {
		System.out.println("미사일을 쏠 수 있습니다");

	}

}
