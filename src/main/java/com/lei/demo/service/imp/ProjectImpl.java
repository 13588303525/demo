package com.lei.demo.service.imp;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lei.demo.dao.ProjectDAO;
import com.lei.demo.entity.Project;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.ProjectService;

@Service("projectService")
@Transactional(readOnly = true)
public class ProjectImpl implements ProjectService{
	
	@Autowired
	private ProjectDAO projectDao;
	
    @Transactional(readOnly = false)
    public void saveProject(Project project) {
    	project.setRestexpense(project.getProjectexpense());
    	projectDao.save(project);
    }
    
    @Transactional(readOnly = false)
    public List<Project> findlProject(String username) {
    	return projectDao.getCurentProject(username);
    	
    }
    
    @Transactional(readOnly = false)
    public List<Project> findByProjectid(int project){
    	return projectDao.findByProjectid(project);
    }
    @Transactional(readOnly = false)
    public List<Project> findAllProject(){
    	return projectDao.getAllProject();
    }

    @Transactional(readOnly = false)
	public void modifyProject(Project project) {
    	projectDao.update(project);		
	}
    
    @Transactional(readOnly = false)
	public void addUsedexpense(int usedexpense,int projectid) {
    	List<Project> projectdetails = projectDao.findByProjectid(projectid);  	
    	Project projectdetail =projectdetails.get(0);
    	int projectusedexpense=projectdetail.getUsedexpense()+usedexpense;
    	int projectrestexpense=projectdetail.getRestexpense()-usedexpense;
    	projectdetail.setUsedexpense(projectusedexpense);
    	projectdetail.setRestexpense(projectrestexpense);
    	projectDao.update(projectdetail);		
	}
    
}
