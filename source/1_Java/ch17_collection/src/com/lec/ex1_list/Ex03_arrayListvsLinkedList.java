package com.lec.ex1_list;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Ex03_arrayListvsLinkedList {
	public static void main(String[] args) {
		ArrayList<String> array = new ArrayList<String>(); // 0인 arraylist가 메모리에 잡힘
		LinkedList<String> linked = new LinkedList<String>();
		System.out.println("arrayList 끝인멕스로 순차적 추가 시간:" + addSeqTime(array));
		System.out.println("linkedList 끝인멕스로 순차적 추가 시간:" + addSeqTime(linked));
		System.out.println("arrayList 중간인덱스로 추가 시간:" + addRandTime(array));
		System.out.println("arrayList 중간인덱스로 추가 시간:" + addRandTime(linked));
		System.out.println("arrayList 끝부터 삭제시간: " + removeSeqTime(array));
		System.out.println("arrayList 끝부터 삭제시간: " + removeSeqTime(linked));
		System.out.println("arrayList 중간부터 삭제 시간:" + removeRandTime(array));
		System.out.println("arrayList 중간부터 삭제 시간:" + removeRandTime(linked));
	}

	private static long removeRandTime(List<String> list) {
		long start = System.currentTimeMillis();
		for (int i = 0; i < list.size(); i++) {
			list.remove(0); // 끝까지 지워짐
		}
		long end = System.currentTimeMillis();
		return end - start;
	}

	private static long removeSeqTime(List<String> list) {
		long start = System.currentTimeMillis(); // 시작시간
		for (int i = list.size() - 1; i < 5000000; i--) { // -1이 맨마지막 index //끝에서부터 지움
			list.remove(i);
		}
		long end = System.currentTimeMillis(); // 종료 시간
		return end - start;
	}

	private static long addRandTime(List<String> list) {
		long start = System.currentTimeMillis(); // for문 수행 전 시간
		for (int i = 0; i < 1000; i++) { // 그 작업을 1000번
			list.add(100, "중간에 추가");
		}
		long end = System.currentTimeMillis(); // for문 수행 후 시간
		return end - start;
	}

	private static long addSeqTime(List<String> list) {
		long start = System.currentTimeMillis(); // 시작시간
		for (int i = 0; i < 5000000; i++) {
			list.add("순차적으로 추가");
		}

		long end = System.currentTimeMillis(); // for문 수행 후 시간
		return end - start;

	}
}
