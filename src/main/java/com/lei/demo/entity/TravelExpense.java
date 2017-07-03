package com.lei.demo.entity;

import java.awt.Image;
import java.util.Date;

import javax.persistence.*;
//绑定表
@Entity(name="TravelExpense")
public class TravelExpense {

	public TravelExpense(){
		super();
	}
	//设定主键与主键策略	//字段绑定
		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="TravelID")//出差报销单ID
	private Integer travelid;
	
	@Column(name="ProjectID")//项目代码
	private Integer projectid;
		
	@Column(name="Partment",length=30)//单位
	private String partment;
		
	@Column(name="TravellerName",length=20)//出差人姓名
	private String travellername;
		
	@Column(name="TravellerTitle",length=30)//出差人职称
	private String travellertitle;
		
	@Column(name="TravelReason",length=50)//出差人事由
	private String travelreason;
		
	@Column(name="Number")//附单据数
	private Integer number;

	@Column(name="TravelPlace",length=50)//出差地点
	private String travelplace;
		
	@Column(name="TravelBegin",length=50)//出差开始时间
	private String travelbegin;
			
	@Column(name="TravelFinish",length=50)//出差结束时间
	private String travelfinish;
			
	@Column(name="TravelDays")//出差天数
	private Integer traveldays;
		
	@Column(name="Plane")//飞机费
	private Integer plane;
		
	@Column(name="Train")//火车费
	private Integer train ;
		
	@Column(name="OtherTraffic")//其他交通费用
	private Integer othertraffic;			
		
	@Column(name="HotelExpense")//住宿费
	private Integer hotelexpense;
		
	@Column(name="Allowance")//伙食补助费用
	private Integer allowance ;
		
	@Column(name="PublicFees")//公杂费
	private Integer publicfees ;
		
	@Column(name="OtherFees")//其它费用
	private Integer otherfees ;
		
	@Column(name="Money")//报销金额
	private Integer money ;
		
	@Column(name="TeacherID",length=30)//工号
	private String teacherid;
		
	@Column(name="CardName",length=20)//转卡姓名
	private String cardname;
		
	@Column(name="CardID",length=30)//建行卡号
	private String cardid;
			
	@Column(name="CardAmount")//转卡金额
	private Integer cardamount;	
		
	@Column(name="Approver",length=30)//报销审批人
	private String approver;
		
	@Column(name="OperateDate",length=50)//报销时间
	private String operatedate;
			
	@Column(name="Operator",length=20)//经办人
	private String operator;
		
	@Column(name="IsPass",length=20)//是否审核通过
	private String ispass;

	@Column(name="Path",length=400)//文件路径
	private String path;
	
	@Column(name="Filename",length=100)//文件名
	private String filename;
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public Integer getTravelid() {
		return travelid;
	}

	public void setTravelid(Integer travelid) {
		this.travelid = travelid;
	}

	public Integer getProjectid() {
		return projectid;
	}

	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}

	public String getPartment() {
		return partment;
	}

	public void setPartment(String partment) {
		this.partment = partment;
	}

	public String getTravellername() {
		return travellername;
	}

	public void setTravellername(String travellername) {
		this.travellername = travellername;
	}

	public String getTravellertitle() {
		return travellertitle;
	}

	public void setTravellertitle(String travellertitle) {
		this.travellertitle = travellertitle;
	}

	public String getTravelreason() {
		return travelreason;
	}

	public void setTravelreason(String travelreason) {
		this.travelreason = travelreason;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getTravelplace() {
		return travelplace;
	}

	public void setTravelplace(String travelplace) {
		this.travelplace = travelplace;
	}

	public String getTravelbegin() {
		return travelbegin;
	}

	public void setTravelbegin(String travelbegin) {
		this.travelbegin = travelbegin;
	}

	public String getTravelfinish() {
		return travelfinish;
	}

	public void setTravelfinish(String travelfinish) {
		this.travelfinish = travelfinish;
	}

	public Integer getTraveldays() {
		return traveldays;
	}

	public void setTraveldays(Integer traveldays) {
		this.traveldays = traveldays;
	}

	public Integer getPlane() {
		return plane;
	}

	public void setPlane(Integer plane) {
		this.plane = plane;
	}

	public Integer getTrain() {
		return train;
	}

	public void setTrain(Integer train) {
		this.train = train;
	}

	public Integer getOthertraffic() {
		return othertraffic;
	}

	public void setOthertraffic(Integer othertraffic) {
		this.othertraffic = othertraffic;
	}

	public Integer getHotelexpense() {
		return hotelexpense;
	}

	public void setHotelexpense(Integer hotelexpense) {
		this.hotelexpense = hotelexpense;
	}

	public Integer getAllowance() {
		return allowance;
	}

	public void setAllowance(Integer allowance) {
		this.allowance = allowance;
	}

	public Integer getPublicfees() {
		return publicfees;
	}

	public void setPublicfees(Integer publicfees) {
		this.publicfees = publicfees;
	}

	public Integer getOtherfees() {
		return otherfees;
	}

	public void setOtherfees(Integer otherfees) {
		this.otherfees = otherfees;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	public String getCardname() {
		return cardname;
	}

	public void setCardname(String cardname) {
		this.cardname = cardname;
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid;
	}

	public Integer getCardamount() {
		return cardamount;
	}

	public void setCardamount(Integer cardamount) {
		this.cardamount = cardamount;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getOperatedate() {
		return operatedate;
	}

	public void setOperatedate(String operatedate) {
		this.operatedate = operatedate;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getIspass() {
		return ispass;
	}

	public void setIspass(String ispass) {
		this.ispass = ispass;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}



	
	
}
