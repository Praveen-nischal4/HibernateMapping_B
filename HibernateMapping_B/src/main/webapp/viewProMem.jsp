<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.hibernate.*,org.hibernate.cfg.*,java.util.*"%>
    
    <%@ page import="com.myproject.manytomany.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

SessionFactory sf = new Configuration().configure().buildSessionFactory();
Session r = sf.openSession();
Transaction t = r.beginTransaction();

Query<Project> q =r.createQuery("from Project",Project.class);

Iterator<Project> i =q.iterate();

out.println("<table border='1'>");
while(i.hasNext())
{
   Project p =	i.next();
   
   out.println("<tr><td>"+p.getPid()+"<td>"+p.getTitle()+"<td>"+p.getDuration()+"<td>");
   
   Set<Members> members= p.getMember();
   
   Iterator<Members> ii = members.iterator();
   
   out.println("<table border='1'>");
   
     while(ii.hasNext())
     {
    	 Members mb = ii.next();
    	 out.println("<tr><td>"+mb.getEmpid()+"<td>"+mb.getMname()+"<td>"+mb.getMemail());
     }
     
     out.println("</table>");
}

out.println("</table>");


%>
</body>
</html>