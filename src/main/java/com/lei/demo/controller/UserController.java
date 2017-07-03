package com.lei.demo.controller;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lei.demo.entity.Project;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.ProjectService;
import com.lei.demo.service.TravelService;
import com.lei.demo.service.UserService;


import com.lei.demo.controller.travelController;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private TravelService TravelService;
    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showUserForm(Model model) {
        return "main";
    }
    
    @RequestMapping(value = "/d", method = RequestMethod.GET)
    public String dUser(Model model) {
    	model.addAttribute("user",new User());
        return "login";
    }
    
    @RequestMapping(value = "/m", method = RequestMethod.GET)
    public String mUser(Model model) {
        return "modify_pwd";
    }
    @ResponseBody
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public  Object saveUser( Model model, User user) throws IOException {       
        Map<String,String> a=new HashMap<String,String>();     
        if(user.getUserName().equals("")){
        	a.put("info","用户名不能为空！");
        	a.put("status","0");
        }
        else{
        User existing = userService.findByUserName(user.getUserName());
        if (existing != null) {
        	a.put("info","用户名已存在！");
        	a.put("status","0");
        }
        else if(user.getPassword().equals("")){
        	a.put("info","密码不能为空！");
        	a.put("status","0");
        }
        else{
	        userService.saveUser(user);	        
	        model.addAttribute("saved", "success");
	        a.put("info","新增成功！");       
        	a.put("status","1");
        }
        }
        List<User>  ul=userService.findAllUsers();
        model.addAttribute("users", ul);
        return a;
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchUser(Model model, User user) {
        List<User> users = userService.findUsers(user.getUserName());
        model.addAttribute("users", users);
        	return "index";
    }
    
    @RequestMapping(value = "/search_u", method = RequestMethod.POST)
    public String searchUser_u(Model model, User user) {
        List<User> users = userService.findUsers(user.getUserName());
        model.addAttribute("users", users);
        	return "us";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginUser(Model model, User user,HttpServletRequest request) {
    	if(user.getUserName().equals("")||user.getUserName()==null){
    		model.addAttribute("status", "none");
            return "login";
    	}
    	 User existing = userService.findByUserName(user.getUserName());
         if (existing==null) {
             model.addAttribute("status", "notexist");
             return "login";
         }
         if(!existing.getPassword().equals(user.getPassword())){
        	 model.addAttribute("status", "psdwrong");
        	 return "login";    	
         }
         if(existing.getUserType().equals("")||existing.getUserType()==null){
        	 model.addAttribute("status", "wrongifm");
             return "login";
         }
         model.addAttribute("user", existing);
         request.getSession().setAttribute("user", user);
         
         if(existing.getUserType().equals("user")){    	
        	 List<TravelExpense> travelexpense=TravelService.findTravelExpense(user.getUserName());
        	 model.addAttribute("travelexpense", travelexpense);
        	 List<Project> project1=projectService.findlProject(user.getUserName());
        	 request.getSession().setAttribute("projectlist", project1);
        	 return "travelexpense";
         }
         else{
        	 List<TravelExpense> travelexpense1=TravelService.findAllTravelExpensenses();
             model.addAttribute("travelexpense", travelexpense1);
        	 return "admin_travelexpense";}
    }
    
    @RequestMapping(value = "/edit/{userName}", method = RequestMethod.GET)
    public String updateUser(Model model,@PathVariable String userName,HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("utf-8");
        User user = userService.findByUserName(userName);
        model.addAttribute("user", user);
        request.getSession().setAttribute("eu",user);
        return "Edit";
    }

    @RequestMapping(value = "/update_u", method = RequestMethod.POST)
    public String updateUser_u( Model model, User user) {
        userService.saveUser(user);
        model.addAttribute("saved", "success");
        return "us";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser( Model model,HttpServletRequest request) {
    	String mname=request.getParameter("musername");
    	String musertype=request.getParameter("musertype");
    	int muserid=Integer.valueOf(request.getParameter("muserid"));
        userService.updateUserm(muserid,mname,musertype);
        List<User>  ul=userService.findAllUsers();
        model.addAttribute("users", ul);
        model.addAttribute("saved", "success");
        return "Ne";
    }
    
    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public String restp( Model model,HttpServletRequest request) {
    	String mname=request.getParameter("musername");
    	User user=userService.findByUserName(mname);
    	 userService.resetPwd(user.getUserID());
    	 List<User>  ul=userService.findAllUsers();
         model.addAttribute("users", ul);
        return "Ne";
    }
    
    @RequestMapping(value = "/manager_u", method = RequestMethod.GET)
    public String managerUser( Model model) {
    	List<User>  ul=userService.findAllUsers();
        model.addAttribute("users", ul);
        return "Ne";
    }
    
    @RequestMapping(value = "/modify_pwd", method = RequestMethod.POST)
    public String modify_pwd( Model model,HttpServletRequest request) {
    	String uname=request.getParameter("uname");
    	User user=userService.findByUserName(uname);
    	  if (user==null) {
              model.addAttribute("status", "notexist");
              return "modify_pwd";
          }
    	String pwd=request.getParameter("pwd");
    	if(!pwd.equals(user.getPassword())){
    		model.addAttribute("status", "psdwrong");
    		return "modify_pwd";
    	}
    	if(user.getPassword().equals(request.getParameter("newpwd"))){
    		model.addAttribute("status", "newsame");
    		return "modify_pwd";
    	}
    	if(!request.getParameter("newpwd").equals(request.getParameter("confirmpwd"))){
    		model.addAttribute("status", "nmatch");
    		return "modify_pwd";
    	}
        userService.modifyPwd(user.getUserID(),request.getParameter("newpwd"));
        model.addAttribute("user", user);
        model.addAttribute("status", "success");
        return "main";
    }
    
    @RequestMapping(value = "/delete/{userName}", method = RequestMethod.GET)
    public String deleteUser(Model model, @PathVariable String userName,HttpServletRequest request) {
        userService.deleteUser(userName);
        model.addAttribute("deleted", "success");
        model.addAttribute("user", new User());
        List<User>  ul=userService.findAllUsers();
        model.addAttribute("users", ul);
        return "Ne";
    }
    
    @RequestMapping(value = "/charts", method = RequestMethod.GET)
    public String getCharts(Model model) {
        return "charts";
    }
    
    @RequestMapping(value = "/print", method = RequestMethod.GET)
    public String printUser( Model model,HttpServletResponse response) throws IOException {
    	List<Project> u=projectService.findAllProject();
    	HSSFWorkbook wb=userService.Out(u);
    	String filename="user.xls";
    	response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes()));  
        OutputStream os= new BufferedOutputStream(response.getOutputStream());  
        response.setContentType("application/vnd.ms-excel;charset=gb2312");  
        wb.write(os);  
        os.flush();  
        os.close();  
    	/*FileOutputStream output=new FileOutputStream("e:\\user.xls");  
    	wb.write(output); 
    	model.addAttribute("print", "success");
    	output.flush();
    	output.close();*/
    	return "Ne";
    }

}
