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
					<h1>Add Event</h1>
					<%
						}
					%>
			
					<form action="VoidmainServlet" method="post" name="appform" enctype="multipart/form-data">
						
						<input class="contact" type="hidden" name="collegeid" required="required" value="<%=username%>"/>
									
						<div class="form_settings">
			
							<p>
								<span>Event Name</span><input class="contact" type="text"
									name="title" required="required" />
							</p>
			
							<p>
								<span>Event Description</span>
								<textarea class="contact" name="description" required="required"></textarea>
							</p>
			
							<p>
								<span>Select Event Banner</span><input class="contact" type="file"
									name="image" required="required" />
							</p>
			
							<p>
								<span>Select Date of Event</span><input class="contact" type="date"
									name="eventdate" required="required" placeholder="dd-mm-yyyy" />
							</p>
							<p>
								<span>Event Type</span><input class="contact" type="text"
									name="eventtype" required="required"/>
							</p>
							<p>
								<span>Event Location</span><input class="contact" type="text"
									name="location" required="required"/>
							</p>
							<p>
								<span>Gusets Attending</span><input class="contact" type="text"
									name="gusets" required="required"/>
							</p>
							<p>
								<span>Expected Audience</span><input class="contact" type="text"
									name="expectedaudience" required="required"/>
							</p>
			
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="contact_submitted" value="Add Event"
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

