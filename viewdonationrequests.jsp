<%@page import="com.voidmain.pojo.DonationRequest"%>
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
				<th>Request Description</th>
				<th>Update Status</th>
				<th>Status</th>
				<th>Delete</th>
			</tr>
			<%
				for (DonationRequest donationRequest : HibernateDAO.getDonationRequests()) {

						if (donationRequest.getCompanyid().equals(username)) {
							
							Event event = HibernateDAO.getEventById(donationRequest.getEventid());
			%>
							<tr>
								<td><%=event.getTitle()%></td>
								<td><%=event.getDescription()%></td>
								<td><a href="./appimages/<%=event.getImage()%>" target="_blank"><img src="./appimages/<%=event.getImage()%>" height="100" width="100"></a></td>
								<td><%=event.getEventdate()%></td>
								<td><%=event.getEventtype()%></td>
								<td><%=event.getLocation()%></td>
								<td><%=event.getGusets()%></td>
								<td><%=event.getExpectedaudience()%></td>
								<td><%=donationRequest.getDescription()%></td>
								<td><%=donationRequest.getStatus()%></td>
								<td><a href="updatedonationrequeststatus.jsp?id=<%=donationRequest.getId()%>">update status</a></td>
								<td><a href="viewdonationrequests.jsp?id=<%=donationRequest.getId()%>">delete</a></td>
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
				<th>Request Description</th>
				<th>Status</th>
				
				<th>Delete</th>
			</tr>
			<%
				for (DonationRequest donationRequest : HibernateDAO.getDonationRequests()) 
				{
					if (donationRequest.getCollegeid().equals(username)) 
					{
						Event event = HibernateDAO.getEventById(donationRequest.getEventid());
			%>
						<tr>
							<td><%=event.getTitle()%></td>
							<td><%=event.getDescription()%></td>
							<td><a href="./appimages/<%=event.getImage()%>" target="_blank"><img src="./appimages/<%=event.getImage()%>" height="100" width="100"></a></td>
							<td><%=event.getEventdate()%></td>
							<td><%=event.getEventtype()%></td>
							<td><%=event.getLocation()%></td>
							<td><%=event.getGusets()%></td>
							<td><%=event.getExpectedaudience()%></td>
							<td><%=donationRequest.getDescription()%></td>
							<td><%=donationRequest.getStatus()%></td>
							<td><a href="viewdonationrequests.jsp?id=<%=donationRequest.getId()%>">delete</a></td>
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
			String id = request.getParameter("id");

			if (id != null) {
				if (HibernateTemplate.deleteObject(DonationRequest.class, Integer.parseInt(id)) == 1) {
					response.sendRedirect("viewdonationrequests.jsp?status=success");
				} else {
					response.sendRedirect("viewdonationrequests.jsp?status=failed");
				}
			}
		%>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>