package com.lei.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lei.demo.entity.Project;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.ProjectService;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/see", method = RequestMethod.GET)
    public String getUserproject( Model model, HttpServletRequest request) {
    	User user=(User)request.getSession().getAttribute("user");   	
        List<Project> project1=projectService.findlProject(user.getUserName());
        model.addAttribute("project", project1);
        return "project";
    }   
    
    @RequestMapping(value = "/getProject", method = RequestMethod.GET)
    public List<Project> getUser( Model model, HttpServletRequest request) {
    	 List<Project> project = projectService.findAllProject() ;
        return project;
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveUser( Model model, Project project,HttpServletRequest request) {
    	projectService.saveProject(project);	
        List<Project> project1 = projectService.findAllProject() ;
        model.addAttribute("project", project1);
        return "admin_project";
    }

    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public String getallProject( Model model, HttpServletRequest request) {  	
        List<Project> project1=projectService.findAllProject();
        model.addAttribute("project", project1);
        return "admin_project";
    }
    
    @RequestMapping(value = "/checkdetail/{projectid}", method = RequestMethod.GET)
    public String getcheckTravel(@PathVariable Integer projectid,HttpServletRequest request) {
        List<Project> projectdetails = projectService.findByProjectid(projectid);  	
    	Project projectdetail =projectdetails.get(0);
        request.getSession().setAttribute("projectdetail", projectdetail);	
        return "check_project";
    } 
    
    
    @RequestMapping(value = "/look/{projectid}", method = RequestMethod.GET)
    public String getTravel(@PathVariable Integer projectid,HttpServletRequest request) {
    	List<Project> projectdetails = projectService.findByProjectid(projectid);  	
    	Project projectdetail =projectdetails.get(0);
        request.getSession().setAttribute("projectdetail", projectdetail);
        return "lookproject";
    }
        
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editTravel( Model model,Project project, HttpServletRequest request) {  	 
    	projectService.modifyProject(project); 	
        List<Project> project1 = projectService.findAllProject() ;
        model.addAttribute("project", project1);
        return "admin_project";
    }

    
}
