<%@page import="javax.persistence.criteria.CriteriaQuery"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.hibernate.*,org.hibernate.cfg.*,java.util.*,javax.persistence.criteria.*"%>
    
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
Session r =sf.openSession();
Transaction t = r.beginTransaction();
CriteriaBuilder criteriaBuilder = r.getCriteriaBuilder();

CriteriaQuery<Project> criteriaQuery = criteriaBuilder.createQuery(Project.class);

Root<Project> root = criteriaQuery.from(Project.class);

criteriaQuery.select(root);

//if you want to add contion or restriction using updated method

Predicate pd = criteriaBuilder.greaterThan(root.get("duration"), 6);
criteriaQuery.where(pd);


List<Project> l = r.createQuery(criteriaQuery).getResultList();

out.println("<table border=1>");
out.println("<tr><th>"+"Pid"+" <td>"+"Project Duration"+" <td>"+"Project Title");
for(Project pr : l)
{
	out.println("<tr> <td>"+pr.getPid()+" <td>"+pr.getDuration()+"<td> "+pr.getTitle());
}

out.println("</table>");

t.commit();
r.close();
%>

</body>
</html>