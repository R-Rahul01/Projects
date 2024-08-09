package com.voidmain.pojo;

public class BrandingRequest {

	private int id;
	private int eventid;
	private String organizationid;
	private String brandingtype;
	private String sponsoredamount;
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrganizationid() {
		return organizationid;
	}
	public void setOrganizationid(String organizationid) {
		this.organizationid = organizationid;
	}
	public String getBrandingtype() {
		return brandingtype;
	}
	public void setBrandingtype(String brandingtype) {
		this.brandingtype = brandingtype;
	}
	public String getSponsoredamount() {
		return sponsoredamount;
	}
	public void setSponsoredamount(String sponsoredamount) {
		this.sponsoredamount = sponsoredamount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getEventid() {
		return eventid;
	}
	public void setEventid(int eventid) {
		this.eventid = eventid;
	}
}
