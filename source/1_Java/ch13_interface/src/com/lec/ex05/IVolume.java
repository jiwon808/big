package com.lec.ex05;

public interface IVolume {
	public int TV_MAX_VOLUME = 50; // final변수 선언
	public int RADIO_MAX_VOLUME = 30; // final변수 선언
	public int MIN_VOLUME = 0; // final변수 선언

	public void volumeUp();

	public void volumeUp(int level);

	public void volumeDown();

	public void volumeDown(int level);

	public default void mute() { // default:When no access modifier is specified for a class, method, or data
									// member
		System.out.println("무음처리합니다");
	}
}
