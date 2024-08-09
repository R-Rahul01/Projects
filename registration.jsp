<!DOCTYPE HTML>
<html>
<head>
<title>Voidmain</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="#">Fund<span class="logo_colour">Raising System</span></a>
					</h1>
				</div>
			</div>
		</div>
		<div id="menubar">
			<ul id="menu">
				<li><a href="index.jsp">Login</a></li>
				<li><a href="registration.jsp">Registration</a></li>
			</ul>
		</div>
		<div id="content_header"></div>
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
						<h1>Register Here</h1>
				<%
					}
				%>
				
				<form action="VoidmainServlet" method="post" name="appform">

					<input type="hidden" name="type" value="com.voidmain.pojo.User">
					<input type="hidden" name="redirect" value="registration.jsp">
					<input type="hidden" name="operation" value="add">

					<div class="form_settings">
						<p>
							<span>Name</span><input class="contact" type="text" name="name"
								required="required" />
						</p>
						<p>
							<span>User Name</span><input class="contact" type="text"
								name="username" required="required" />
						</p>
						<p>
							<span>Password</span><input class="contact" type="password"
								name="password" required="required" />
						</p>
						<p>
							<span>Email Address</span><input class="contact" type="email"
								name="email" required="required" />
						</p>
						<p>
							<span>Mobile</span><input class="contact" type="text"
								name="mobile" required="required" pattern="[6789][0-9]{9}" />
						</p>
						<p>
							<span>Address</span><textarea class="contact" name="address" required="required"></textarea>
						</p>
						<p>
							<span>Website URL</span><input class="contact" type="text"
								name="weburl" required="required"/>
						</p>
						<p>
							<span>Select User Type</span> <select name="usertype"
								required="required">
								<option value="">--select</option>
								<option value="college">College</option>
								<option value="company">Company</option>
							</select>
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Register"
								onclick="return validate()" />
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>