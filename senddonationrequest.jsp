<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.DonationRequest"%>
<%@page import="com.voidmain.pojo.User"%>
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
					<h1>Send Fund Request</h1>
					<%
						}
					%>
			
					<form action="senddonationrequest.jsp" name="appform">
						
						<input class="contact" type="hidden" required="required" name="eventid" value="<%=request.getParameter("id")%>"/>
						
						<div class="form_settings">
			
							<p>
								<span>Select Company</span>
								<select class="contact" name="companyid" required="required" multiple="multiple">
									<option value="">--select--</option>
									<%
										for(User user : HibernateDAO.getUsers())
										{
											if(user.getUsertype().equals("company"))
											{
									%>
												<option value="<%=user.getUsername()%>"><%=user.getName()%></option>
									<%			
											}
										}
									%>
								</select>
							</p>
			
							<p>
								<span>Description</span>
								<textarea class="contact" name="description" required="required"></textarea>
							</p>
			
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="contact_submitted" value="Send Donation Request"
									onclick="return validate()" />
							</p>
						</div>
					</form>
				</div>
				
				<%
					String[] companies=request.getParameterValues("companyid");
					String description=request.getParameter("description");
					String eventid=request.getParameter("eventid");
					
					if(companies!=null && description!=null && eventid!=null)
					{
						for(String company : companies)
						{
							DonationRequest donationRequest=new DonationRequest();
							donationRequest.setCollegeid(username);
							donationRequest.setCompanyid(company);
							donationRequest.setDescription(description);
							donationRequest.setEventid(Integer.parseInt(eventid));
							donationRequest.setStatus("Pending");
							
							HibernateTemplate.addObject(donationRequest);
						}
						
						response.sendRedirect("viewdonationrequests.jsp");
					}
					
					
				%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>

