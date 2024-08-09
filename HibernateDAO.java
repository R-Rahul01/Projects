package com.voidmain.dao;

import java.util.List;

import com.voidmain.pojo.User;
import com.voidmain.pojo.BrandingRequest;
import com.voidmain.pojo.DonationRequest;
import com.voidmain.pojo.Event;
import com.voidmain.pojo.Login;

public class HibernateDAO {

	public static String isValidUser(String username,String password)
	{
		String result=null;

		Login login=getLoginById(username);

		if(login!=null && login.getPassword().equals(password) && login.getStatus().equals("yes"))
		{
			result=login.getRole();
		}

		return result;
	}

	public static boolean isUserRegistred(String username)
	{
		boolean isRegistred=false;

		for(Login login : getLogins())
		{
			if(login.getUsername().toLowerCase().equals(username.toLowerCase()))
			{
				isRegistred=true;

				break;
			}
		}

		return isRegistred;
	}

	//================================================================================

	public static Login getLoginById(String username)
	{
		return (Login)HibernateTemplate.getObject(Login.class,username);
	}

	public static int deleteLogin(String username)
	{
		return HibernateTemplate.deleteObject(Login.class,username);
	}

	public static List<Login> getLogins()
	{
		List<Login> logins=(List)HibernateTemplate.getObjectListByQuery("From Login");

		return logins;
	}


	//================================================================================

	public static User getUserById(String user)
	{
		return (User)HibernateTemplate.getObject(User.class,user);
	}

	public static int deleteUser(String user)
	{
		return HibernateTemplate.deleteObject(User.class,user);
	}

	public static List<User> getUsers()
	{
		List<User> users=(List)HibernateTemplate.getObjectListByQuery("From User");

		return users;
	}

	//================================================================================

	public static BrandingRequest getBrandRequestById(int brandRequestId)
	{
		return (BrandingRequest)HibernateTemplate.getObject(BrandingRequest.class,brandRequestId);
	}

	public static int deleteBrandRequest(int brandRequestId)
	{
		return HibernateTemplate.deleteObject(BrandingRequest.class,brandRequestId);
	}

	public static List<BrandingRequest> getBrandRequests()
	{
		List<BrandingRequest> brandRequests=(List)HibernateTemplate.getObjectListByQuery("From BrandingRequest");

		return brandRequests;
	}

	//================================================================================

	public static Event getEventById(int id)
	{
		return (Event)HibernateTemplate.getObject(Event.class,id);
	}

	public static int deleteEvent(int id)
	{
		return HibernateTemplate.deleteObject(Event.class,id);
	}

	public static List<Event> getEvents()
	{
		List<Event> events=(List)HibernateTemplate.getObjectListByQuery("From Event");

		return events;
	}

	//================================================================================

	public static DonationRequest getDonationRequestById(int donationRequestId)
	{
		return (DonationRequest)HibernateTemplate.getObject(DonationRequest.class,donationRequestId);
	}

	public static int deleteDonationRequest(int donationRequestId)
	{
		return HibernateTemplate.deleteObject(DonationRequest.class,donationRequestId);
	}

	public static List<DonationRequest> getDonationRequests()
	{
		List<DonationRequest> donationRequests=(List)HibernateTemplate.getObjectListByQuery("From DonationRequest");

		return donationRequests;
	}
}
