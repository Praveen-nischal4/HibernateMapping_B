package com.myproject.manytomany;


import java.util.*;
import javax.persistence.*;

@NamedQueries({
	
	@NamedQuery(name="y", query = "from Project")
})



@Entity
@Table(name="Project")
public class Project {

	@Id
	int pid;
	String title;
	int duration;
	
	@ManyToMany(mappedBy="projects")
	Set<Members> member = new HashSet<>();

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Set<Members> getMember() {
		return member;
	}

	public void setMember(Set<Members> member) {
		this.member = member;
	}
	
	
}
