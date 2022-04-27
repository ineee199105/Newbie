package com.itwillbs.bean;

// Phone객체(모델명,색상)
public class Phone {
	
	private String model;
	private String color;
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "Phone [model=" + model + ", color=" + color + "]";
	}
	
	
	
	
}
