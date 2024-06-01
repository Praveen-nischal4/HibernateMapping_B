package com.myproject.many;

import javax.persistence.*;

@Entity
@Table(name="Employee")
public class Employee {

	@Id
	int empid;
	String ename;
	long salary;
	
	@ManyToOne
	@JoinColumn(name="deptno")
	Department dept;

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public long getSalary() {
		return salary;
	}

	public void setSalary(long salary) {
		this.salary = salary;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}
	
	
	
	
}
