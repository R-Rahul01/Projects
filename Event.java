package com.voidmain.pojo;

import java.util.Date;

public class Event {
	
	private int id;
	private String collegeid;
	private String title;
	private String description;
	private String image;
	private Date eventdate;
	private String eventtype;
	private String location;
	private String gusets;
	private String expectedaudience;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getEventdate() {
		return eventdate;
	}
	public void setEventdate(Date eventdate) {
		this.eventdate = eventdate;
	}
	public String getEventtype() {
		return eventtype;
	}
	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGusets() {
		return gusets;
	}
	public void setGusets(String gusets) {
		this.gusets = gusets;
	}
	public String getExpectedaudience() {
		return expectedaudience;
	}
	public void setExpectedaudience(String expectedaudience) {
		this.expectedaudience = expectedaudience;
	}
	public String getCollegeid() {
		return collegeid;
	}
	public void setCollegeid(String collegeid) {
		this.collegeid = collegeid;
	}
}
