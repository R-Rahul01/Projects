<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<html>
<div id="header">
	<div id="logo">
		<div id="logo_text">
			<!-- class="logo_colour", allows you to change the colour of the text -->
			<h1>
				<a href="#">Fund<span class="logo_colour">Raising System</span></a>
			</h1>
		</div>
	</div>
	<div id="menubar">
		<ul id="menu">
			<%
				String role = (String) request.getSession().getAttribute("role");
				String username = (String) request.getSession().getAttribute("username");
						
				if(role==null || username==null)
				{
					response.sendRedirect("index.jsp");
				}
				else
				{
					if (role.equals("admin")) 
					{
				%>		
						<li><a href="home.jsp">View Events</a></li>
						<li><a href="viewcolleges.jsp">View Colleges</a></li>
			<%
					}
			%>
			<%
					if (role.equals("college")) 
					{
			%>
						<li><a href="addevent.jsp">Add Event</a></li>
						<li><a href="home.jsp">View Events</a></li>
						<li><a href="viewbrandingrequests.jsp">View Branding Requests</a></li>
						<li><a href="viewdonationrequests.jsp">View Fund Requests</a></li>
			<%
					}
			%>
			
			<%
					if (role.equals("company")) 
					{
			%>
						<li><a href="home.jsp">View Events</a></li>
						<li><a href="viewbrandingrequests.jsp">View Branding Requests</a></li>
						<li><a href="viewdonationrequests.jsp">View Fund Requests</a></li>
			<%
					}
			%>
					<li><a href="logout.jsp">Logout</a></li>
			<%
				}
			%>
		</ul>
	</div>
</div>