<%@ page import="java.io.*, java.util.*" pageEncoding="ISO-8859-1" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme() + "://"  
    + request.getServerName() + ":" + request.getServerPort()  
    + path + "/";  
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>

<head>
<base href="<%=basePath%>">  
<title>welcome</title>
<style type="text/css">
body {
	background-image: url('http://crunchify.com/bg.png');
}
</style>
</head>
<body>${message} 
        <h1>Hello welcome.jsp!</h1>  
 
	<br>
	<br>

<%
out.clear();  
out = pageContext.pushBody();  
response.setContentType("application/pdf"); 
try{
String strPdfPath = new String("/home/ec2-user/tmp/cs549/ftp-test/createSamplePDF.pdf");   
File file = new File(strPdfPath);  
if (file.exists()) {  
 DataOutputStream temps = new DataOutputStream(response  
   .getOutputStream());  
 DataInputStream in = new DataInputStream(  
   new FileInputStream(strPdfPath));  

 byte[] b = new byte[2048];  
 while ((in.read(b)) != -1) {  
  temps.write(b);  
  temps.flush();  
 }  

 in.close();  
 temps.close();  
} else {  
    out.print(strPdfPath + "not found");  
   }  
 
  } catch (Exception e) {  
   out.println(e.getMessage());  
  }  
%>
</body>
</html>