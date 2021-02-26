package com.tj.Account;
// (실습예제2) 직육면체의 가로, 세로, 높이, 부피나 직사각형의 가로, 세로, 넓이를 속성으로 갖는 클래스를 구현하라. 

// 부피나 넓이를 구하는 메소드 calVolume()도 구현한다.
//클래스- 데이터: width, height, depth, volume
//메소드: callNsetVolume(); 가로, 세로, 높이를 이용해서 부피를 계산하여 volume 값 셋팅 (depth!=0)
//			가로, 세로를 이용해서 넓이를 계산하여 volume 값 셋팅 (depth==0)

public class BoxOrRect {
	private int width;
	private int height;
	private int depth;
	private int volume;

	public BoxOrRect(int width, int height, int depth) {
		this.width = width;
		this.height = height;
		this.depth = depth;
	}

	public BoxOrRect(int width, int height) {
		this.width = width;
		this.height = height;
	}

	// 반환하는 메소드
	public void callNsetVolume() { // 이부분 중요!!!
		if (depth != 0)
			volume = width * height * depth;
		else
			volume = width * height;
	}

	// setter & getter
	public void setWidth(int width) {
		this.width = width;
	}

	public int getWidth() {
		return width;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getHeight() {
		return height;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getDepth() {
		return depth;
	}

	public int getVolume() {
		return volume;
	}
}
