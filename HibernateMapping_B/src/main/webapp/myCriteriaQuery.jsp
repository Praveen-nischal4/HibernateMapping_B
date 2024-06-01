
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.hibernate.*,org.hibernate.cfg.*,java.util.*,org.hibernate.criterion.*"%>
    
    <%@ page import="com.myproject.manytomany.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

//this is old code

SessionFactory sf = new Configuration(). configure().buildSessionFactory();
Session r = sf.openSession();
Transaction t = r.beginTransaction();

Criteria cr = r.createCriteria(Project.class);
cr.add(Restrictions.gt("duration", 7));
cr.addOrder(Order.desc("title"));
//Criterion duration = Restrictions.gt("duration", 8);

out.println("<table border=1>");
out.println("<tr><th>"+"Pid"+" <td>"+"Project Duration"+" <td>"+"Project Title");
List<Project> l = cr.list();

for(Project p :l)
{
	out.println("<tr> <td>"+p.getPid()+" <td>"+p.getDuration()+"<td> "+p.getTitle());
}
out.println("</table>");


%>
</body>
</html>