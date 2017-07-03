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

import com.lei.demo.entity.Project;
import com.lei.demo.entity.TravelExpense;

@Repository
@Transactional
public class ProjectDAO {
	@Autowired
	private SessionFactory sessionFactory;
	

	public List<Project> getAllProject(){
		String hsql="from Project";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	
	public List<Project> getCurentProject(String username){		
		String hsql="from Project where ProjectLeader = '"+username+"' ";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	public void save(Project project){
		Session session = getCurrentSession();
		session.saveOrUpdate(project);
	}
	public void update(Project project){
		Session session = getCurrentSession();
		session.saveOrUpdate(project);
	}
	public void delete(Project project){
		Session session = getCurrentSession();
		session.delete(project);
	}

	public Project findById(Integer id){
		Session session = getCurrentSession();
		return (Project)session.get(Project.class, id);
	}
	public List<Project> findByProjectid(int projectid){		
		String hsql="from Project where projectid = '"+projectid+"' ";
		Session session = getCurrentSession();
		Query query = session.createQuery(hsql);		
		return query.list();
	}
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	 public List<Project> findProjects(String projectName) {
	        return findByCriteria(Restrictions.like("project_name", projectName, MatchMode.START));
	    }
	 public List<Project> findByCriteria(Criterion criterion) {
	        Criteria criteria = getCurrentSession().createCriteria(Project.class);
	        criteria.add(criterion);
	        return criteria.list();
	    }
}
