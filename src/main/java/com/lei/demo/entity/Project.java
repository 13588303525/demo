package com.lei.demo.entity;

import java.util.Date;

import javax.persistence.*;
//绑定表
@Entity(name="Project")
public class Project {

	public Project(){
		super();
	}
	//设定主键与主键策略
	@Id
	@Column(name="ProjectID")
	private Integer projectid;
	
	
	//字段绑定
	@Column(name="ProjectName",length=32)//项目名称
	private String projectname;
	
	@Column(name="ProjectType",length=50)//项目类别
	private String projecttype;
	
	@Column(name="ProjectField",length=50)//技术管理领域
	private String projectfield;
	
	@Column(name="ProjectOrigin",length=50)//项目技术来源
	private String projectorigin;
	
	@Column(name="BeginTime",length=50)//开始日期
	private  String begintime;
		
	@Column(name="FinishTime",length=50)//结束日期
	private String finishtime;
	
	@Column(name="ProjectExpense")//项目经费
	private Integer projectexpense;
	
	@Column(name="UsedExpense")//已使用经费
	private Integer usedexpense;
	
	@Column(name="RestExpense")//未使用经费
	private Integer restexpense;
	
	@Column(name="ProjectLeader",length=50)//项目负责人
	private String projectleader;
	
	@Column(name="ProjectNumber")//项目成员
	private Integer projectnumber;

	public Integer getProjectid() {
		return projectid;
	}

	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getProjecttype() {
		return projecttype;
	}

	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}

	public String getProjectfield() {
		return projectfield;
	}

	public void setProjectfield(String projectfield) {
		this.projectfield = projectfield;
	}

	public String getProjectorigin() {
		return projectorigin;
	}

	public void setProjectorigin(String projectorigin) {
		this.projectorigin = projectorigin;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}

	public Integer getProjectexpense() {
		return projectexpense;
	}

	public void setProjectexpense(Integer projectexpense) {
		this.projectexpense = projectexpense;
	}

	public Integer getUsedexpense() {
		return usedexpense;
	}

	public void setUsedexpense(Integer usedexpense) {
		this.usedexpense = usedexpense;
	}

	public Integer getRestexpense() {
		return restexpense;
	}

	public void setRestexpense(Integer restexpense) {
		this.restexpense = restexpense;
	}

	public String getProjectleader() {
		return projectleader;
	}

	public void setProjectleader(String projectleader) {
		this.projectleader = projectleader;
	}

	public Integer getProjectnumber() {
		return projectnumber;
	}

	public void setProjectnumber(Integer projectnumber) {
		this.projectnumber = projectnumber;
	}


}
