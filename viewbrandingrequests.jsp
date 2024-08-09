<%@page import="com.voidmain.pojo.BrandingRequest"%>
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
				<th>Branding Type</th>
				<th>Sponsored Amount</th>
				<th>Status</th>
				<th>Delete</th>
			</tr>
			<%
				for (BrandingRequest brandingRequest : HibernateDAO.getBrandRequests()) {

						if (brandingRequest.getOrganizationid().equals(username)) {
							Event event = HibernateDAO.getEventById(brandingRequest.getEventid());
			%>
			<tr>
				<td><%=event.getTitle()%></td>
				<td><%=event.getDescription()%></td>
				<td><a href="./appimages/<%=event.getImage()%>" target="_blank"><img
						src="./appimages/<%=event.getImage()%>" height="100" width="100"></a></td>
				<td><%=event.getEventdate()%></td>
				<td><%=event.getEventtype()%></td>
				<td><%=event.getLocation()%></td>
				<td><%=event.getGusets()%></td>
				<td><%=event.getExpectedaudience()%></td>
				<td><%=brandingRequest.getBrandingtype()%></td>
				<td><%=brandingRequest.getSponsoredamount()%></td>
				<td><%=brandingRequest.getStatus()%></td>
				<td><a
					href="viewbrandingrequests.jsp?id=<%=brandingRequest.getId()%>">delete</a></td>
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
				<th>Branding Type</th>
				<th>Sponsored Amount</th>
				<th>Status</th>
				<th>Update Status</th>
				<th>Delete</th>
			</tr>
			<%
				for (BrandingRequest brandingRequest : HibernateDAO.getBrandRequests()) {

						Event event = HibernateDAO.getEventById(brandingRequest.getEventid());

						if (event.getCollegeid().equals(username)) {
			%>
			<tr>
				<td><%=event.getTitle()%></td>
				<td><%=event.getDescription()%></td>
				<td><a href="./appimages/<%=event.getImage()%>" target="_blank"><img
						src="./appimages/<%=event.getImage()%>" height="100" width="100"></a></td>
				<td><%=event.getEventdate()%></td>
				<td><%=event.getEventtype()%></td>
				<td><%=event.getLocation()%></td>
				<td><%=event.getGusets()%></td>
				<td><%=event.getExpectedaudience()%></td>
				<td><%=brandingRequest.getBrandingtype()%></td>
				<td><%=brandingRequest.getSponsoredamount()%></td>
				<td><%=brandingRequest.getStatus()%></td>
				<td><a
					href="updatebrandingrequeststatus.jsp?id=<%=brandingRequest.getId()%>">update
						status</a></td>
				<td><a
					href="viewbrandingrequests.jsp?id=<%=brandingRequest.getId()%>">delete</a></td>
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
				if (HibernateTemplate.deleteObject(BrandingRequest.class, Integer.parseInt(id)) == 1) {
					response.sendRedirect("viewbrandingrequests.jsp?status=success");
				} else {
					response.sendRedirect("viewbrandingrequests.jsp?status=failed");
				}
			}
		%>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>