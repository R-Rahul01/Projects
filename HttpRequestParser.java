package com.voidmain.servlets;

import java.io.File;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

public class HttpRequestParser {

	public static Map<Object,List<String>> parseMultiPartRequest(HttpServletRequest request,Object obj)
	{
		Map<Object,List<String>> map=new HashMap<Object, List<String>>();

		if(ServletFileUpload.isMultipartContent(request))
		{
			// Root Directory.
			String uploadRootPath = request.getServletContext().getRealPath("")+"/appimages/";

			File uploadRootDir = new File(uploadRootPath);
			// Create directory if it not exists.
			if (!uploadRootDir.exists()) {
				uploadRootDir.mkdirs();
			}
			
			try {

				List<String> files=new ArrayList<String>();

				for (FileItem item : new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request))) {

					if (!item.isFormField()) {
						item.write(new File(uploadRootPath+item.getName()));
						files.add(item.getName());
					}
					else
					{
						String fieldName = item.getFieldName();
						String fieldValue = item.getString();

						Method[] methods=obj.getClass().getDeclaredMethods();

						for(Method method : methods)
						{
							String methodName=method.getName();

							if(methodName.equalsIgnoreCase("set"+fieldName))
							{
								try {

									method.setAccessible(true);

									String type=method.getParameterTypes()[0].getName();

									if(type.equals("java.lang.String"))
									{
										method.invoke(obj,fieldValue);

									}else if(type.equals("int"))
									{
										method.invoke(obj,Integer.parseInt(request.getParameter(fieldValue)));
									}else if(type.equals("float"))
									{
										method.invoke(obj,Float.parseFloat(request.getParameter(fieldValue)));
									}else if(type.equals("long"))
									{
										method.invoke(obj,Long.parseLong(request.getParameter(fieldValue)));
									}else if(type.equals("dobule"))
									{
										method.invoke(obj,Double.parseDouble(request.getParameter(fieldValue)));
									}else if(type.equals("boolean"))
									{
										method.invoke(obj,Boolean.parseBoolean(request.getParameter(fieldValue)));
									}else if(type.equals("java.util.Date"))
									{
										System.out.println("Date:"+fieldValue);
										String[] tokens=fieldValue.split("-");
										String idate=tokens[2]+"-"+tokens[1]+"-"+tokens[0];
										System.out.println("IDate:"+idate);
										method.invoke(obj,new SimpleDateFormat("dd-MM-yyyy").parse(idate));
									}
									

								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						}
					}
				}
				
				map.put(obj,files);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	public static Object parseRequest(HttpServletRequest request,Object obj)
	{
		Enumeration<String> enumeration=request.getParameterNames();

		while(enumeration.hasMoreElements())
		{
			String parameterName=enumeration.nextElement();

			Method[] methods=obj.getClass().getDeclaredMethods();

			for(Method method : methods)
			{
				String methodName=method.getName();

				if(methodName.equalsIgnoreCase("set"+parameterName))
				{
					try {

						method.setAccessible(true);

						String type=method.getParameterTypes()[0].getName();

						if(type.equals("java.lang.String"))
						{
							method.invoke(obj,request.getParameter(parameterName));
						}else if(type.equals("int"))
						{
							method.invoke(obj,Integer.parseInt(request.getParameter(parameterName)));
						}else if(type.equals("float"))
						{
							method.invoke(obj,Float.parseFloat(request.getParameter(parameterName)));
						}else if(type.equals("long"))
						{
							method.invoke(obj,Long.parseLong(request.getParameter(parameterName)));
						}else if(type.equals("dobule"))
						{
							method.invoke(obj,Double.parseDouble(request.getParameter(parameterName)));
						}else if(type.equals("boolean"))
						{
							method.invoke(obj,Boolean.parseBoolean(request.getParameter(parameterName)));
						}
						else if(type.equals("java.util.Date"))
						{
							System.out.println("Date:"+request.getParameter(parameterName));
							String[] tokens=request.getParameter(parameterName).split("-");
							String idate=tokens[2]+"-"+tokens[1]+"-"+tokens[0];
							System.out.println("IDate:"+idate);
							method.invoke(obj,new SimpleDateFormat("dd-MM-yyyy").parse(idate));
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		return obj;
	}
}
