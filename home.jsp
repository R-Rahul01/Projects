<%@page import="com.voidmain.pojo.Event"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>

<%@page import="java.util.Date"%>
<html>
<%@include file="head.jsp"%>
<body>
	<div id="main">
		<%@include file="header.jsp"%>
		<div id="site_content">
			<div id="content">

				<%
					String status = request.getParameter("status");

					if (status != null) {
				%>
				<script type="text/javascript">alert("<%=status%>
					");
				</script>
				<%
					}
				%>

				<%
					if (role.equals("admin")) {
				%>
				<table id="customers">
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Image</th>
						<th>Date</th>
						<th>Event Type</th>
						<th>Event Location</th>
						<th>Event Guests</th>
						<th>Expected Audience</th>
						<th>Delete</th>
					</tr>
					<%
						for (Event event : HibernateDAO.getEvents()) {
					%>
					<tr>
						<td><%=event.getTitle()%></td>
						<td><%=event.getDescription()%></td>
						<td><a href="./appimages/<%=event.getImage()%>"
							target="_blank"><img src="./appimages/<%=event.getImage()%>"
								height="100" width="100"></a></td>
						<td><%=event.getEventdate()%></td>
						<td><%=event.getEventtype()%></td>
						<td><%=event.getLocation()%></td>
						<td><%=event.getGusets()%></td>
						<td><%=event.getExpectedaudience()%></td>
						<td><a href="home.jsp?id=<%=event.getId()%>">delete</a></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>

				<%
					if (role.equals("college")) {
				%>
				<table id="customers">
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Image</th>
						<th>Date</th>
						<th>Event Type</th>
						<th>Event Location</th>
						<th>Event Guests</th>
						<th>Expected Audience</th>
						<th>Send Fund Request</th>
						<th>Delete</th>
					</tr>
					<%
						for (Event event : HibernateDAO.getEvents()) {

								if (event.getCollegeid().equals(username)) {
					%>
					<tr>
						<td><%=event.getTitle()%></td>
						<td><%=event.getDescription()%></td>
						<td><a href="./appimages/<%=event.getImage()%>"
							target="_blank"><img src="./appimages/<%=event.getImage()%>"
								height="100" width="100"></a></td>
						<td><%=event.getEventdate()%></td>
						<td><%=event.getEventtype()%></td>
						<td><%=event.getLocation()%></td>
						<td><%=event.getGusets()%></td>
						<td><%=event.getExpectedaudience()%></td>
						<td><a href="senddonationrequest.jsp?id=<%=event.getId()%>">send fund request</a></td>
						<td><a href="home.jsp?id=<%=event.getId()%>">delete</a></td>
					</tr>
					<%
						}
							}
					%>
				</table>
				<%
					}
				%>

				<%
					if (role.equals("company")) {
				%>
				<table id="customers">
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Image</th>
						<th>Date</th>
						<th>Event Type</th>
						<th>Event Location</th>
						<th>Event Guests</th>
						<th>Expected Audience</th>
						<th>Send Request</th>
					</tr>
					<%
						for (Event event : HibernateDAO.getEvents()) {
					%>
					<tr>
						<td><%=event.getTitle()%></td>
						<td><%=event.getDescription()%></td>
						<td><a href="./appimages/<%=event.getImage()%>"
							target="_blank"><img src="./appimages/<%=event.getImage()%>"
								height="100" width="100"></a></td>
						<td><%=event.getEventdate()%></td>
						<td><%=event.getEventtype()%></td>
						<td><%=event.getLocation()%></td>
						<td><%=event.getGusets()%></td>
						<td><%=event.getExpectedaudience()%></td>
						<td><a href="sendbrandrequest.jsp?id=<%=event.getId()%>">send
								request</a></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>



				<%
					String id = request.getParameter("id");

					if (id != null) {
						if (HibernateTemplate.deleteObject(Event.class, Integer.parseInt(id)) == 1) {
							response.sendRedirect("home.jsp?status=success");
						} else {
							response.sendRedirect("home.jsp?status=failed");
						}
					}
				%>

			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>