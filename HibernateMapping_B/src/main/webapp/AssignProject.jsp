<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.hibernate.*,org.hibernate.cfg.*,java.util.*"%>
    
    <%@ page import="com.myproject.manytomany.*"%>
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

//Project pr = new Project();       //and if you want add another project also then 1st add project and then get using get method
//pr.setPid(5);
//pr.setDuration(10);
//pr.setTitle("Hospital Management");

//r.save(pr);



Project p = r.get(Project.class,Integer.parseInt(request.getParameter("pid")));          // this is teacher code

//Project p1 = r.get(Project.class,1);


Set<Project> myPro = new HashSet<Project>();
myPro.add(p);
//myPro.add(p1);

Members s = new Members();
s.setEmpid(Integer.parseInt(request.getParameter("empid")));
s.setMname(request.getParameter("mname"));
s.setMemail(request.getParameter("email"));
s.setProjects(myPro);
r.save(s);
t.commit();
out.println("Assigned");
%>
</body>
</html>