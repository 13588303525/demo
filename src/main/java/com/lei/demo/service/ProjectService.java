package com.lei.demo.service;


import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lei.demo.entity.Project;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;

public interface ProjectService {
    void saveProject(Project project);
    List<Project> findByProjectid(int project);
    List<Project> findAllProject();
    List<Project> findlProject(String username);
    void modifyProject(Project project);
    void addUsedexpense(int usedexpense,int projectid);
}