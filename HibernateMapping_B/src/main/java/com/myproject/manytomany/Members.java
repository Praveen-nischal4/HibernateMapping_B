package com.myproject.manytomany;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="Members")
public class Members {

	@Id
	int empid;
	String mname;
	String memail;
	
	@ManyToMany(cascade= {CascadeType.ALL})
	@JoinTable(name="Mem_Pro", joinColumns= {@JoinColumn(name="empid")},inverseJoinColumns = {@JoinColumn(name="pid")})
	Set<Project> projects = new HashSet<>();

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}
	
	
	
}
