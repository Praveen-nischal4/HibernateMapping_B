<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.hibernate.*,org.hibernate.cfg.*"%>
    <%@ page import="com.myproject.many.*" %>
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

Department  d = new Department();
d.setDeptno(Integer.parseInt(request.getParameter("deptno")));
d.setDeptname(request.getParameter("dname"));
d.setType(request.getParameter("dtype"));
r.save(d);

Employee e = new Employee();
e.setDept(d);
e.setEmpid(200);
e.setEname("Rajesh");
e.setSalary(336000l);
r.save(e);
t.commit();
out.println("Data inserted");
%>
</body>
</html>