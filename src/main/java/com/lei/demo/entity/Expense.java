package com.lei.demo.entity;

import java.util.Date;

import javax.persistence.*;
//绑定表
@Entity(name="Expense")
public class Expense {

	public Expense(){
		super();
	}
	//设定主键与主键策略	//字段绑定
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)	
	@Column(name="ExpenseID")//报销汇总单ID
	private Integer expenseid;

	@Column(name="ProjectID")//项目代码
	private Integer projectid;
	
	public String getPartment() {
		return partment;
	}

	public void setPartment(String partment) {
		this.partment = partment;
	}
	@Column(name="Partment",length=30)//单位
	private String partment;
		
	@Column(name="Numbers")//单据张数
	private Integer numbers;
	
	@Column(name="Offices")//办公费用
	private Integer offices;
		
	@Column(name="Communication")//通讯、邮寄费用
	private Integer communication;
	
	@Column(name="Daily")//日用品材料费
	private Integer daily;	
	
	@Column(name="Sport")//体育用品购置费
	private Integer sport;		
	
	@Column(name="Service")//技术服务费用
	private Integer service;
	
	@Column(name="Entertain")//业务招待费用
	private Integer entertain;
	
	@Column(name="Advertising")//宣传广告费用
	private Integer advertising;
		
	@Column(name="Book")//图书资料费用
	private Integer book;
	
	@Column(name="Printing")//复印、印刷费用
	private Integer printing;
	
	@Column(name="Traffic")//市内交通费
	private Integer traffic;
	
	@Column(name="Fuel")//燃油、燃料费
	private Integer fuel;
	
	@Column(name="PassLoad")//过路、过桥费用
	private Integer passload;
	
	@Column(name="Insurance")//机动车辆包险费
	private Integer insurance;	
	
	@Column(name="Carmodify")//机动车辆维修费
	private Integer carmodify;	
	
	@Column(name="Meeting")//会议、会务费
	private Integer meeting;

	@Column(name="Test")//材料测试加工费
	private Integer test;	
	
	@Column(name="Asset")//固定资产构建费
	private Integer asset;	
	
	@Column(name="Labor")//劳务费
	private Integer labor;	

	@Column(name="Modify")//设备维修费
	private Integer modify;	
			
	@Column(name="Training")//培训费
	private Integer training;
	
	@Column(name="Otherfare")//其他
	private Integer otherfare;	
	
	@Column(name="TotalExpense")//报销总金额
	private Integer totalexpense;
	
	@Column(name="TeacherID",length=30)//工号
	private String teacherid;
	
	@Column(name="TeacherName",length=30)//姓名
	private String teachername;
	
	@Column(name="Cardfare")//转卡金额
	private Integer cardfare;	
		
	@Column(name="Card",length=30)//建行卡号
	private String card;
	
	@Column(name="ProjectLeader",length=30)//经费主管
	private String projectleader;
	
	@Column(name="Approver",length=20)//报销审批人
	private String approver;
	
	@Column(name="Operator",length=20)//经办人
	private String operator;
	
	@Column(name="PhoneNumber",length=20)//联系电话
	private String phonenumber;
	
	@Column(name="OperateDate",length=50)//报销时间
	private String operatedate;
	
	@Column(name="IsPass",length=50)//报销时间
	private String ispass;
	
	@Column(name="Path",length=400)//文件路径
	private String path;
	
	@Column(name="Filename",length=100)//文件名
	private String filename;
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	

	public Integer getExpenseid() {
		return expenseid;
	}

	public void setExpenseid(Integer expenseid) {
		this.expenseid = expenseid;
	}

	public Integer getProjectid() {
		return projectid;
	}

	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}



	public Integer getNumbers() {
		return numbers;
	}

	public void setNumbers(Integer numbers) {
		this.numbers = numbers;
	}

	public Integer getOffices() {
		return offices;
	}

	public void setOffices(Integer offices) {
		this.offices = offices;
	}

	public Integer getCommunication() {
		return communication;
	}

	public void setCommunication(Integer communication) {
		this.communication = communication;
	}

	public Integer getDaily() {
		return daily;
	}

	public void setDaily(Integer daily) {
		this.daily = daily;
	}

	public Integer getSport() {
		return sport;
	}

	public void setSport(Integer sport) {
		this.sport = sport;
	}

	public Integer getService() {
		return service;
	}

	public void setService(Integer service) {
		this.service = service;
	}

	public Integer getEntertain() {
		return entertain;
	}

	public void setEntertain(Integer entertain) {
		this.entertain = entertain;
	}

	public Integer getAdvertising() {
		return advertising;
	}

	public void setAdvertising(Integer advertising) {
		this.advertising = advertising;
	}

	public Integer getBook() {
		return book;
	}

	public void setBook(Integer book) {
		this.book = book;
	}

	public Integer getPrinting() {
		return printing;
	}

	public void setPrinting(Integer printing) {
		this.printing = printing;
	}

	public Integer getTraffic() {
		return traffic;
	}

	public void setTraffic(Integer traffic) {
		this.traffic = traffic;
	}

	public Integer getFuel() {
		return fuel;
	}

	public void setFuel(Integer fuel) {
		this.fuel = fuel;
	}

	public Integer getPassload() {
		return passload;
	}

	public void setPassload(Integer passload) {
		this.passload = passload;
	}

	public Integer getInsurance() {
		return insurance;
	}

	public void setInsurance(Integer insurance) {
		this.insurance = insurance;
	}

	public Integer getCarmodify() {
		return carmodify;
	}

	public void setCarmodify(Integer carmodify) {
		this.carmodify = carmodify;
	}

	public Integer getMeeting() {
		return meeting;
	}

	public void setMeeting(Integer meeting) {
		this.meeting = meeting;
	}

	public Integer getTest() {
		return test;
	}

	public void setTest(Integer test) {
		this.test = test;
	}

	public Integer getAsset() {
		return asset;
	}

	public void setAsset(Integer asset) {
		this.asset = asset;
	}

	public Integer getLabor() {
		return labor;
	}

	public void setLabor(Integer labor) {
		this.labor = labor;
	}

	public Integer getModify() {
		return modify;
	}

	public void setModify(Integer modify) {
		this.modify = modify;
	}

	public Integer getTraining() {
		return training;
	}

	public void setTraining(Integer training) {
		this.training = training;
	}

	public Integer getOtherfare() {
		return otherfare;
	}

	public void setOtherfare(Integer otherfare) {
		this.otherfare = otherfare;
	}

	public Integer getTotalexpense() {
		return totalexpense;
	}

	public void setTotalexpense(Integer totalexpense) {
		this.totalexpense = totalexpense;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public Integer getCardfare() {
		return cardfare;
	}

	public void setCardfare(Integer cardfare) {
		this.cardfare = cardfare;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getProjectleader() {
		return projectleader;
	}

	public void setProjectleader(String projectleader) {
		this.projectleader = projectleader;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getOperatedate() {
		return operatedate;
	}

	public void setOperatedate(String operatedate) {
		this.operatedate = operatedate;
	}

	public String getIspass() {
		return ispass;
	}

	public void setIspass(String ispass) {
		this.ispass = ispass;
	}

	
	
}
