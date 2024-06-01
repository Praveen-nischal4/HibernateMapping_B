<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.hibernate.*,org.hibernate.cfg.*,java.util.*"%>
    <%@ page import="com.myproject.many.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
SessionFactory sf = new  Configuration().configure().buildSessionFactory();
Session  r = sf.openSession();
Transaction t = r.beginTransaction();

Query<Department> q = r.createQuery("from Department",Department.class);

Iterator<Department> i = q.iterate();

out.println("<table border=2>");
 while(i.hasNext())
 {
	 Department d =i.next();
	out.println("<tr><td>"+d.getDeptno()+" <td>"+d.getType()+"<td> "+d.getDeptname());
	
	Set<Employee> e = d.getEmp();
	
	out.println("<table border=2>");
	for(Employee ee:e)
	{
		out.println("<tr> <td>"+ee.getEmpid()+" <td>"+ee.getEname()+"<td> "+"<td>"+ee.getSalary());
	}
	
	out.println("</table>");
 }
out.println("</table>");



// List<Department> sl =q.getResultList();

// for(Department dd :sl)
// {
	
// 	out.println(dd.getDeptno()+dd.getDeptname()+dd.getType());
// }



//out.println("</table>");


// Set<Department> resultSet = new HashSet<>(q.getResultList());

// out.println("<table border=2>");
// for (Department dd : resultSet) {
//     out.println("<tr><td>" + dd.getDeptno() + "</td><td>" + dd.getType() + "</td><td>" + dd.getDeptname() + "</td></tr>");
// }





%>
</body>
</html>