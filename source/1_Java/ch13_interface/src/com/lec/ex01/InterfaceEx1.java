package com.lec.ex01;

//'public상수'와 '추상메소드'만 올 수 있습니다. 
public interface InterfaceEx1 {
	public /* static final */ int CONSTANT_NUM = 10; // interface는 무조건 'public static final' ;     ctrl+shift+/       풀면 ctrl+shift+ \
	public /* abstract */ void method1(); // 일반메소드는 못옴. 추상메소드 만

}
