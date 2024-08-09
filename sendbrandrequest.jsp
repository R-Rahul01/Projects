<%@page import="java.util.Date"%>
<html>
	<%@include file="head.jsp"%>
	<body>
		<div id="main">
			<%@include file="header.jsp"%>
			<div id="site_content">
				<div id="content">
					<!-- insert the page content here -->
					<%
						String status = request.getParameter("status");
			
						if (status != null) {
					%>
					<h1><%=status%></h1>
					<%
						} else {
					%>
					<h1>Send Branding Request</h1>
					<%
						}
					%>
			
					<form action="VoidmainServlet" method="post" name="appform">
					
						<input type="hidden" name="type" value="com.voidmain.pojo.BrandingRequest">
						<input type="hidden" name="redirect" value="sendbrandrequest.jsp">
						<input type="hidden" name="operation" value="add">
						
						<input class="contact" type="hidden" required="required" name="eventid" value="<%=request.getParameter("id")%>"/>
						<input class="contact" type="hidden" required="required" name="organizationid" value="<%=username%>"/>
						<input class="contact" type="hidden" required="required" name="status" value="Pending"/>
						
									
						<div class="form_settings">
			
							<p>
								<span>Branding Type</span><input class="contact" type="text"
									name="brandingtype" required="required" />
							</p>
			
							<p>
								<span>Sponsored Amount</span>
								<input type="number" class="contact" name="sponsoredamount" required="required">
							</p>
			
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="contact_submitted" value="Send Brand Request"
									onclick="return validate()" />
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>

