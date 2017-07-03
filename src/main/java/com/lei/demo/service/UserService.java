package com.lei.demo.service;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lei.demo.entity.Project;
import com.lei.demo.entity.User;

public interface UserService {

    User findByUserName(String userName);
    void saveUser(User user);
    void updateUser(User user);
    void updateUserm(int id,String mname,String mtype);
    void deleteUser(String userName);
    List<User> findUsers(String user);
    List<User> findAllUsers();
    void resetPwd(int i);
    HSSFWorkbook Out(List<Project> u);
    void modifyPwd(int id,String newpsd);
}
