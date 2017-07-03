package com.lei.demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lei.demo.entity.Project;
import com.lei.demo.service.ProjectService;
import com.lei.demo.service.UserService;




@Controller
@RequestMapping(value = "/view")
public class EchartsController extends HttpServlet{
    @Resource
    private ProjectService echartService;
    
    
    @RequestMapping(value = "/")
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	
    	response.setContentType("text/json; charset=utf-8");
        JSONObject jsonObj=new JSONObject();
    	
         Map<String, Object> map = new HashMap<String, Object>();
         List<String> clist1 = new ArrayList<String>();
         List<Integer> clist2 = new ArrayList<Integer>();
         List<Integer> clist3 = new ArrayList<Integer>();
         
         List<Project> chartList = echartService.findAllProject();
 
         for(Project cl : chartList){
             clist1.add(cl.getProjectleader());
             clist2.add(-cl.getUsedexpense());
            clist3.add(cl.getRestexpense());
         }
         map.put("c_eva",clist1);
         map.put("c_rain",clist2);
         map.put("c_avgt",clist3);
         map.put("success1",true);
         jsonObj.putAll(map);
         response.getWriter().println(jsonObj.toString()); 
     }
 }