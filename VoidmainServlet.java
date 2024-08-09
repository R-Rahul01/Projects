package com.voidmain.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.voidmain.dao.HibernateDAO;
import com.voidmain.dao.HibernateTemplate;
import com.voidmain.pojo.Event;
import com.voidmain.pojo.Login;
import com.voidmain.pojo.User;

@WebServlet("/VoidmainServlet")
public class VoidmainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest request;
	HttpServletResponse response;

	Object obj=null;
	String redirect=null;
	String type;
	String operation=null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.request=request;
		this.response=response;

		try {
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if(isMultipart) {
				
				Object obj=new Event();
				
				Map<Object,List<String>> map=HttpRequestParser.parseMultiPartRequest(request,obj);
				
				List<String> list=map.get(obj);
				
				Event event=(Event)obj;
				event.setImage(list.get(0));
				
				if(HibernateTemplate.addObject(event)==1)
				{
					response.sendRedirect("addevent.jsp?status=success");
				}
				else
				{
					response.sendRedirect("addevent.jsp?status=failed");
				}
			}
			else
			{
				type=request.getParameter("type");
				redirect=request.getParameter("redirect");
				operation=request.getParameter("operation");

				if(type!=null && redirect!=null && operation!=null)
				{
					obj=Class.forName(type).newInstance();
					Object object=HttpRequestParser.parseRequest(request, obj);
					
					if(type.equals("com.voidmain.pojo.User"))
					{
						User user=(User)object;
						
					
						Login login=new Login();
						login.setUsername(request.getParameter("username"));
						login.setPassword(request.getParameter("password"));
						login.setRole(user.getUsertype());
						
						if(user.getUsertype().equals("college"))
						{
							login.setStatus("no");
						}
						else if(user.getUsertype().equals("company"))
						{
							login.setStatus("yes");
						}
						
						if(!HibernateDAO.isUserRegistred(request.getParameter("username")))
						{
							if(HibernateTemplate.addObject(object)==1 && HibernateTemplate.addObject(login)==1)
							{
								response.sendRedirect(redirect+"?status=success");
							}
							else
							{
								response.sendRedirect(redirect+"?status=failed");
							}
						}
						else
						{
							response.sendRedirect(redirect+"?status=Employee All ready Registred");
						}
					}
					else
					{
						if(operation.equals("add"))
						{
							if(HibernateTemplate.addObject(object)==1)
							{
								response.sendRedirect(redirect+"?status=success");
							}
							else
							{
								response.sendRedirect(redirect+"?status=failed");
							}					
						}
						else if(operation.equals("update"))
						{
							if(HibernateTemplate.updateObject(object)==1)
							{
								response.sendRedirect(redirect+"?status=success");
							}
							else
							{
								response.sendRedirect(redirect+"?status=failed");
							}
						}
					}
				}
			}
			
			//======================================================

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
