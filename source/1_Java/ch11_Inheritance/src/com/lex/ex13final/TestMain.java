package com.lex.ex13final;

public class TestMain {
	public static void main(String[] args) { // main함수 써야 실행
		Animal animal = new Animal();
		animal.running();
		animal.running();
		animal.stop();
		Dog dog = new Dog();
		dog.running();
		dog.stop();
		dog.method(); // method를 dog에 추가했기에 가능
		Animal dog2 = new Dog();
		dog2.running();
		dog2.stop();
		// dog2.method(); // dog2는 Animal형 변수 --> compile해야 기계어로 바꿔. dog2는 new Dog에서 내용을
		// 가져와 ; 하지만첫과정에서 Animal에 method 가없다. 따라서 compile과정에서 문법적으로 error생김

		// Object dog3 = new Dog();
		// dog3.stop(); //는 object에 있는것 만 올 수 있어  따라서 이거 실행안됨

		Rabbit rabbit = new Rabbit();
		rabbit.running();
		rabbit.stop();
	}
}
