<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*,
    org.apache.commons.fileupload.disk.*,
    org.apache.commons.fileupload.servlet.*,
    org.apache.commons.io.*,
    java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>Project Information</title>
</head>
<body>
<div>
	<%-- HEAD --%>
	<div class="head"> 
		<%@ include file="head.jsp" %>
	</div>
	<%-- CATEGORY --%>
	<div class="category">
		<%@ include file="category_teacher.jsp" %>
	</div>
	<%-- MAIN --%>
	<div class="main" style="font-family:yg-jalnan;font-size:20px">
	<%
		String id = (String) session.getAttribute("id");
		session.setAttribute("id", id);
		String title = null;
		String sdate = null;
		String fdate = null;
		String content = null;
		String filename = null;
		byte[] file = null;
		
		request.setCharacterEncoding("utf-8");
		
		ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
		List items = sfu.parseRequest(request);
		
		Iterator iter = items.iterator();
		while(iter.hasNext()){
			FileItem item = (FileItem) iter.next();
			String name = item.getFieldName();
			if(item.isFormField()){
				String value = item.getString("utf-8");
				if(name.equals("title")) title = value;
				else if(name.equals("sdate")) sdate = value;
				else if(name.equals("fdate")) fdate = value;
				else if(name.equals("content")) content = value;
			}
			else{
				if(name.equals("file")){
					filename = item.getName();
					file = item.get();
				}
			}
		}
		
		out.print(title+"<br>");
		out.print(sdate+"<br>");
		out.print(fdate+"<br>");
		out.print(content+"<br>");
		out.print(filename+"<br>");
	%>
	</div>
	<%-- FOOTER --%>
	<div class="footer">
		<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>