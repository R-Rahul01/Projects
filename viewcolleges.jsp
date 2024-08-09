<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<html>
<%@include file="head.jsp"%>
<body>
	<div id="main">
		<%@include file="header.jsp"%>
				<%
					String status = request.getParameter("status");

					if (status != null) {
				%>
				<h1><%=status%></h1>
				<%
					} else {
				%>
				<h1>View Colleges</h1>
				<%
					}
				%>

				<table id="customers">

					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Address</th>
						<th>Web Url</th>
						<th>Status</th>
						<th>Activate</th>
						<th>Deactivate</th>
					</tr>

					<%
						for (User user : HibernateDAO.getUsers()) {

							if (user.getUsertype().equals("college")) {
								
								Login login=HibernateDAO.getLoginById(user.getUsername());
					%>
								<tr>
									<td><%=user.getName()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=user.getMobile()%></td>
									<td><%=user.getAddress()%></td>
									<td><%=user.getWeburl()%></td>
									<td><%=login.getStatus()%></td>
									<td> <a href="viewcolleges.jsp?id=<%=user.getUsername()%>&userstatus=yes">Activate</a></td>
									<td> <a href="viewcolleges.jsp?id=<%=user.getUsername()%>&userstatus=no">Deactivate</a></td>
								</tr>

					<%
							}
						}
					%>
				</table>

				<%
					String id = request.getParameter("id");
					String userstatus=request.getParameter("userstatus");

					if (id != null && userstatus!=null) {
						
						Login login=HibernateDAO.getLoginById(id);
						
						if(login!=null)
						{
							login.setStatus(userstatus);
							
							if(HibernateTemplate.updateObject(login)==1)
							{
								response.sendRedirect("viewcolleges.jsp?status=success");
							}
							else
							{
								response.sendRedirect("viewcolleges.jsp?status=failed");
							}
						}
					}
				%>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>



