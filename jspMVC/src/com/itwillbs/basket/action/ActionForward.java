package com.itwillbs.basket.action;

public class ActionForward {
	// 페이지 이동할때 사용하는 객체
	
	private String path;   // 이동경로 저장
	private boolean isRedirect;  // 이동방식 저장
	// redirect 방식 : true   주소변환 O , 화면변환 O
	// forward 방식 : false   주소변환 X, 화면변환 O
	
	
	
	// alt shift s + r
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() { //get
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	

	// alt shift s + s
	@Override
	public String toString() {
		return "ActionForward [path=" + path + ", isRedirect=" + isRedirect + "]";
	}
	
	

}
