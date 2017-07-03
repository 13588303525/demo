package com.lei.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lei.demo.entity.User;


@Repository
@Transactional
public class UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	

	public List<User> getAllUser(){
		String hsql="from f_User";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	
	public void save(User user){
		Session session = getCurrentSession();
		session.saveOrUpdate(user);
	}
	public void update(User user){
		Session session = getCurrentSession();
		session.update(user);
	}
	
	public void updatem(int id,String mname,String mtype){
		String hsql="update f_User set UserName='"+mname+"',UserType='"+mtype+"' where UserID='"+id+"'";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);
		query.executeUpdate();
	}
	
	public void delete(User user){
		Session session = getCurrentSession();
		session.delete(user);
	}
	public void mPwd(int id,String newpsd){
		String hsql="update f_User set Password='"+newpsd+"' where UserID='"+id+"'";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);
		query.executeUpdate();
	}
	public void rPwd(int id){
		String hsql="update f_User set Password='0000' where UserID='"+id+"'";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);
		query.executeUpdate();
	}
	public User findById(Integer id){
		Session session = getCurrentSession();
		return (User)session.get(User.class, id);
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	 public List<User> findUsers(String userName) {
	        return findByCriteria(Restrictions.like("UserName", userName, MatchMode.START));
	    }
	 public List<User> findByCriteria(Criterion criterion) {
	        Criteria criteria = getCurrentSession().createCriteria(User.class);
	        criteria.add(criterion);
	        return criteria.list();
	    }
}
