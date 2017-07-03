package com.lei.demo.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;


@Component
@Transactional
public class TravelExpenseDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<TravelExpense> getAllTravelExpense(){
		String hsql="from TravelExpense";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	
	public List<TravelExpense> getAllProject(){		
		String hsql="from TravelExpense";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public List<TravelExpense> getCurentProject(String username){		
		String hsql="from TravelExpense where Operator = '"+username+"' ";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public List<TravelExpense> findByTravelid(int travelid){		
		String hsql="from TravelExpense where travelid = '"+travelid+"' ";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public void save(TravelExpense travelExpense){
		Session session = getCurrentSession();
		Integer total=travelExpense.getAllowance()+travelExpense.getHotelexpense()+travelExpense.getOtherfees()+travelExpense.getOthertraffic()+travelExpense.getPlane()+travelExpense.getPublicfees()+travelExpense.getTrain();
		travelExpense.setMoney(total);
		travelExpense.setIspass("待审核");
		session.saveOrUpdate(travelExpense);
	}
	public void update(TravelExpense travelExpense){
		Session session = getCurrentSession();
		Integer total=travelExpense.getAllowance()+travelExpense.getHotelexpense()+travelExpense.getOtherfees()+travelExpense.getOthertraffic()+travelExpense.getPlane()+travelExpense.getPublicfees()+travelExpense.getTrain();
		travelExpense.setMoney(total);
		session.saveOrUpdate(travelExpense);
	}
	public void delete(TravelExpense travelExpense){
		Session session = getCurrentSession();
		session.delete(travelExpense);
	}

	public TravelExpense findById(Integer id){
		Session session = getCurrentSession();
		return (TravelExpense)session.get(TravelExpense.class, id);
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public void modify_ispass(String approver ,String ispass,int travelid){
		String hsql="update TravelExpense set IsPass='"+ispass+"',Approver='"+approver+"' where TravelID='"+travelid+"'";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);
		query.executeUpdate();
	}
}