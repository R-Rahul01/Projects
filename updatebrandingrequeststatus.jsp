<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.BrandingRequest"%>
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
				<h1>Update Branding Request</h1>
				<%
					}
				%>

				<form action="updatebrandingrequeststatus.jsp" name="appform">

					<input class="contact" type="hidden" required="required"
						name="brandrequestid" value="<%=request.getParameter("id")%>" />

					<div class="form_settings">

						<p>
							<span>Enter Status</span>
							<textarea class="contact" name="brandrequeststatus"
								required="required"></textarea>
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Update Brand Request"
								onclick="return validate()" />
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%
		String brandrequestid = request.getParameter("brandrequestid");
		String brandrequeststatus = request.getParameter("brandrequeststatus");

		if (brandrequestid != null && brandrequeststatus != null) {

			BrandingRequest brandingRequest = HibernateDAO.getBrandRequestById(Integer.parseInt(brandrequestid));
			brandingRequest.setStatus(brandrequeststatus);

			if (HibernateTemplate.updateObject(brandingRequest) == 1) {
				response.sendRedirect("viewbrandingrequests.jsp?status=success");
			} else {
				response.sendRedirect("viewbrandingrequests.jsp?status=failed");
			}

		}
	%>
	<%@include file="footer.jsp"%>
</body>
</html>

