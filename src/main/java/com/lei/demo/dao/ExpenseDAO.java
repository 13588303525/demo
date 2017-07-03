package com.lei.demo.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import net.sf.ehcache.hibernate.HibernateUtil;

import com.lei.demo.entity.Expense;
import com.lei.demo.entity.TravelExpense;


@Repository
@Transactional
public class ExpenseDAO {
	@Autowired
	private SessionFactory sessionFactory;
	

	public List<Expense> getAllExpense(){
		String hsql="from Expense";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public List<Expense> getCurentProject(String username){		
		String hsql="from Expense where Operator = '"+username+"' ";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public List<Expense> findByExpenseid(int expenseid){		
		String hsql="from Expense where expenseid = '"+expenseid+"' ";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public void modify_ispass(String approver ,String ispass,int expenseid){
		String hsql="update Expense set IsPass='"+ispass+"',Approver='"+approver+"' where ExpenseID='"+expenseid+"'";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);
		query.executeUpdate();
	}
	public void save(Expense expense){
		Session session = getCurrentSession();
		Integer total=expense.getAdvertising()+expense.getEntertain()+expense.getBook()+expense.getCarmodify()+expense.getCommunication()+expense.getDaily()+expense.getFuel()+expense.getInsurance()+expense.getLabor()+expense.getMeeting()+expense.getModify()+expense.getOffices()+expense.getOtherfare()+expense.getPrinting()+expense.getService()+expense.getSport()+expense.getTest()+expense.getTraffic()+expense.getTraining()+expense.getPassload()+expense.getAsset();
		expense.setTotalexpense(total) ;
		expense.setIspass("待审核");
		session.saveOrUpdate(expense);
	}
	public void update(Expense expense){
		Session session = getCurrentSession();
		Integer total=expense.getAdvertising()+expense.getEntertain()+expense.getBook()+expense.getCarmodify()+expense.getCommunication()+expense.getDaily()+expense.getFuel()+expense.getInsurance()+expense.getLabor()+expense.getMeeting()+expense.getModify()+expense.getOffices()+expense.getOtherfare()+expense.getPrinting()+expense.getService()+expense.getSport()+expense.getTest()+expense.getTraffic()+expense.getTraining()+expense.getPassload()+expense.getAsset();
		expense.setTotalexpense(total) ;
		session.saveOrUpdate(expense);
	}
	public void delete(Expense expense){
		Session session = getCurrentSession();
		session.delete(expense);
	}

	public Expense findById(Integer id){
		Session session = getCurrentSession();
		return (Expense)session.get(Expense.class, id);
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	 public List<Expense> findExpenses(String expenseName) {
	        return findByCriteria(Restrictions.like("expense_name", expenseName, MatchMode.START));
	    }
	 public List<Expense> findByCriteria(Criterion criterion) {
	        Criteria criteria = getCurrentSession().createCriteria(Expense.class);
	        criteria.add(criterion);
	        return criteria.list();
	    }
}
