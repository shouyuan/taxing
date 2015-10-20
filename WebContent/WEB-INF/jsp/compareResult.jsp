
<%@ page import="java.io.*, java.util.*, org.springframework.beans.factory.annotation.Autowired,
org.springframework.stereotype.Controller,
org.springframework.ui.Model,
org.springframework.web.bind.annotation.RequestMapping,
org.springframework.web.bind.annotation.RequestMethod,
org.springframework.web.bind.annotation.RequestParam,
org.springframework.web.servlet.ModelAndView,
com.itextpdf.text.Document,
com.itextpdf.text.Paragraph,
com.itextpdf.text.pdf.AcroFields,
com.itextpdf.text.pdf.AcroFields.Item,
com.itextpdf.text.pdf.PdfReader,
com.itextpdf.text.pdf.PdfStamper,
com.itextpdf.text.pdf.PdfWriter,
java.util.Map.Entry,
java.util.Map" pageEncoding="ISO-8859-1" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme() + "://"  
    + request.getServerName() + ":" + request.getServerPort()  
    + path + "/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>  
    <head>  
        <title>Result</title>  
        <base href="<%=basePath%>"> 
    </head>  

    
<%
out.clear();  
out = pageContext.pushBody();  
response.setContentType("application/pdf"); 
try{
String strPdfPath = new String("/usr/local/createSamplePDF.pdf");   
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
    <body>  
    </body>  
</html> 