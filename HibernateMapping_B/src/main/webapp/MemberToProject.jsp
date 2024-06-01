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

int pid = Integer.parseInt(request.getParameter("pid"));

int mid = Integer.parseInt(request.getParameter("mid"));

//extract particular members detail and store it in m object
Members m =r.get(Members.class,mid);

//extract particular projects detail and store it in p object
Project p =r.get(Project.class,pid);

Set<Project> p1 = m.getProjects();
p1.add(p);


m.setProjects(p1);
r.save(m);
t.commit();
%>
</body>
</html>