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

Query<Project> q = r.createNamedQuery("y", Project.class);

List<Project> p =q.getResultList();

Iterator<Project> i = p.iterator();
out.println("<table border='2'>");
out.println("<tr><th>"+"Pid"+"<td>"+"Duration"+"<td>"+"Name");
while(i.hasNext())
{
	Project p2 =i.next();
	
	out.println("<tr> <td>"+p2.getPid()+"<td> "+p2.getDuration()+"<td> "+p2.getTitle());
}
out.println("</table>");
%>
</body>
</html>