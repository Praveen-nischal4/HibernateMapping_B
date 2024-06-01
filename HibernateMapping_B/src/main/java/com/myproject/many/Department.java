package com.myproject.many;

import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="Department")
public class Department {

	@Id
	int deptno;
	String deptname;
	String type;
	
	@OneToMany(mappedBy = "dept")
	Set<Employee> emp;

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Set<Employee> getEmp() {
		return emp;
	}

	public void setEmp(Set<Employee> emp) {
		this.emp = emp;
	}
	
	
}
