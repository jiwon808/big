package com.lec.ex4_Object;

public class Card {
	private char kind; // Character은 객체(data,method), char는 기초타입
	private int num;

	public Card(char kind, int num) {
		this.kind = kind;
		this.num = num;
	}// public

	@Override
	public String toString() {
		return "카드 모양은" + kind + " " + num;
	}// public

	@Override // !!중요!!
	public boolean equals(Object obj) {
		// Card yours = new Card('♣',8);
		// Card card = new Card('♣',8);
		// yours.equals(card) -> this는yours, obj는card
		// this.kind와 obj.kind가 같고 this.num과 obj.num이 같으면 true
		if (obj != null && obj instanceof Card) {
			boolean kindChk = this.kind == ((Card) obj).kind;
			boolean numChk = num == ((Card) obj).num;
			return kindChk && numChk;
		}
		return false;
	}

}// class