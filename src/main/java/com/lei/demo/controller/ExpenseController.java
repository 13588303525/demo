package com.lei.demo.controller;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lei.demo.entity.Expense;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.ExpenseService;
import com.lei.demo.entity.Project;
import com.lei.demo.entity.User;
import com.lei.demo.service.ProjectService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/expense")
public class ExpenseController {
	
    @Autowired
    private ExpenseService expenseService;
   
    @Autowired
    private ProjectService projectService;
   
    
    @RequestMapping(value = "/see", method = RequestMethod.GET)
    public String seeExpense( Model model,HttpServletRequest request) {
    	User user=(User)request.getSession().getAttribute("user");   	
        List<Expense> expense1=expenseService.findExpense(user.getUserName());
        model.addAttribute("expense", expense1);
   	 	List<Project> project1=projectService.findlProject(user.getUserName());
   	 	request.getSession().setAttribute("projectlist", project1);
        return "expense";
    }
        
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveUser( Model model, Expense expense,HttpServletRequest request) {
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
//      String savePath = request.getServletContext().getRealPath("/WEB-INF/upload");
    	String savePath ="C:/Users/Administrator/Desktop/备份/demo/src/main/webapp/image";
      String allPath;	
      File file = new File(savePath);
      //判断上传文件的保存目录是否存在
      if (!file.exists() && !file.isDirectory()) {
          System.out.println(savePath+"目录不存在，需要创建");
          //创建目录
          file.mkdir();
      }
      //消息提示
      String message = "";
      try{
          //使用Apache文件上传组件处理文件上传步骤：
          //1、创建一个DiskFileItemFactory工厂
          DiskFileItemFactory factory = new DiskFileItemFactory();
           //2、创建一个文件上传解析器
           ServletFileUpload upload = new ServletFileUpload(factory);
            //解决上传文件名的中文乱码
           upload.setHeaderEncoding("UTF-8"); 
           //3、判断提交上来的数据是否是上传表单的数据

           //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
           List<FileItem> list = upload.parseRequest(request);
           int i=0;
           for(FileItem item : list){
        	   i++;
               //如果fileitem中封装的是普通输入项的数据
               if(item.isFormField()){
                   String name = item.getFieldName();
                   //解决普通输入项的数据的中文乱码问题
                   String value = item.getString("UTF-8");
                   //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                  System.out.println(name + "=" + value);
                  if(i==1){
                	expense.setPartment(value);  
                  }
                  else if(i==2){
                	  expense.setProjectid(Integer.valueOf(value));	  
                  }
                  else if(i==3){
                	  expense.setNumbers(Integer.valueOf(value));  
                  }
                  else if(i==4){
                	  expense.setOffices(Integer.valueOf(value));
                  }	 
                  else if(i==5){
                	  expense.setTraffic(Integer.valueOf(value));
                  }
                  else if(i==6){
                	  expense.setAsset(Integer.valueOf(value));
                  }  
                  else if(i==7){
                	  expense.setCommunication(Integer.valueOf(value));
                  }		  
                  else if(i==8){
                	  expense.setFuel(Integer.valueOf(value));
                  }		 
                  else if(i==9){
                	  expense.setSport(Integer.valueOf(value));
                  }		 
                  else if(i==10){
                	  expense.setService(Integer.valueOf(value));
                  }	
                  else if(i==11){
                	  expense.setPassload(Integer.valueOf(value));
                  }	
                  else if(i==12){
                	  expense.setDaily(Integer.valueOf(value));
                  }		
                  else if(i==13){
                	  expense.setEntertain(Integer.valueOf(value));
                  }
                  else if(i==14){
                	  expense.setCarmodify(Integer.valueOf(value));
                  }	  
  
                  else if(i==15){
                	  expense.setTest(Integer.valueOf(value));
                  }              			  
                  else if(i==16){
                	  expense.setAdvertising(Integer.valueOf(value));
                  }		 
                  else if(i==17){
                	  expense.setInsurance(Integer.valueOf(value));
                  }
                  else if(i==18){
                	  expense.setModify(Integer.valueOf(value));
                  }		 	  
                  else if(i==19){
                	  expense.setBook(Integer.valueOf(value));
                  }		  
                  else if(i==20){
                	  expense.setMeeting(Integer.valueOf(value));
                  }	 
                  else if(i==21){
                	  expense.setLabor(Integer.valueOf(value));
                  }
                  else if(i==22){
                	  expense.setPrinting(Integer.valueOf(value));
                  }	
                  else if(i==23){
                	  expense.setTraining(Integer.valueOf(value));
                  }
                  else if(i==24){
                	  expense.setOtherfare(Integer.valueOf(value));
                  }
                  else if(i==25){
                	  expense.setTeacherid(value);
                  }
                  else if(i==26){
                	  expense.setTeachername(value); 
                  }
                  else if(i==27){
                	  expense.setCardfare(Integer.valueOf(value));
                  }
                  else if(i==28){
                	  expense.setCard(value);
                  }
                  else if(i==29){
                	  expense.setProjectleader(value);
                  }
                  
                  else if(i==30){
                	  expense.setOperator(value);
                  }
                  
                  else if(i==31){
                	  expense.setOperatedate(value);
                  }
                                
              }
               else{//如果fileitem中封装的是上传文件
                  //得到上传的文件名称，
                  String filename = item.getName();
                  System.out.println(filename);
                  if(filename==null || filename.trim().equals("")){
                      continue;
                  }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                  //获取item中的上传文件的输入流
                  InputStream in = item.getInputStream();
                  //创建一个文件输出流
                  FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                   //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                      out.write(buffer, 0, len);
                  } 
                   allPath=savePath + "\\" + filename;
                   expense.setFilename(filename);
                   expense.setPath(allPath);
                  //关闭输入流
                  in.close();
                  //关闭输出流
                  out.close();
                  //删除处理文件上传时生成的临时文件
                  item.delete();
                  message = "文件上传成功！";
                  
              }
          }
      }catch (Exception e) {
          message= "文件上传失败！";
          e.printStackTrace();
          
      }    	
    	expenseService.saveExpense(expense);
    	User user=(User)request.getSession().getAttribute("user");   	
        List<Expense> expense1=expenseService.findExpense(user.getUserName());
        model.addAttribute("expense", expense1);
        return "expense";
    }
    
    @RequestMapping(value = "/getExpense", method = RequestMethod.GET)
    public List<Expense> getTravel(User user) {
        List<Expense> expense = expenseService.findExpense(user.getUserName());        
        return expense;
    }
    
    @RequestMapping(value = "/look/{expenseid}", method = RequestMethod.GET)
    public String getExpense(@PathVariable Integer expenseid,HttpServletRequest request) {
    	List<Expense> expensedetails = expenseService.findByExpenseid(expenseid);     	
    	Expense expensedetail =expensedetails.get(0);
        request.getSession().setAttribute("expensedetail", expensedetail);
        return "lookexpense";
    }
    
    @RequestMapping(value = "/checkdetail/{expenseid}", method = RequestMethod.GET)
    public String getcheckExpense(@PathVariable Integer expenseid,HttpServletRequest request) {
    	List<Expense> expensedetails = expenseService.findByExpenseid(expenseid);     	
    	Expense expensedetail =expensedetails.get(0);
        request.getSession().setAttribute("expensedetail", expensedetail);
        int projectid=expensedetail.getProjectid();
        List<Project> projectdetails=projectService.findByProjectid(projectid);
        Project projectdetail =projectdetails.get(0);
        request.getSession().setAttribute("projectdetail", projectdetail);
        return "check_expense";
    }
    
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public String getallExpense( Model model, HttpServletRequest request) {  	
        List<Expense> expense1=expenseService.findAllExpenses();
        model.addAttribute("expense", expense1);
        return "admin_expense";
    }
    
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public String editExpense( Model model, Expense expense,HttpServletRequest request) {
    	expense.setIspass("待审核");
    	expenseService.modifyExpense(expense);    	
    	User user=(User)request.getSession().getAttribute("user");   	
        List<Expense> expense1=expenseService.findExpense(user.getUserName());
        model.addAttribute("expense", expense1);
        return "expense";
    }
    
    @RequestMapping(value = "/ispass",method = RequestMethod.POST)
    public String passExpense( Model model, Expense expense,HttpServletRequest request) {
    	int expenseid = expense.getExpenseid(); 
    	User user=(User)request.getSession().getAttribute("user"); 
    	String approver=user.getUserName();  	
    	String ispass="审核通过";
    	expenseService.updateExpense(approver ,ispass,expenseid);
    	int projectid=expense.getProjectid();
    	int fare=expense.getTotalexpense();
    	projectService.addUsedexpense(fare, projectid);
        List<Expense> expense1=expenseService.findAllExpenses();
        model.addAttribute("expense", expense1);
        return "admin_expense";
    }
    
    @RequestMapping(value = "/notpass", method = RequestMethod.POST)
    public String notpassExpense( Model model, Expense expense,HttpServletRequest request) {
    	User user=(User)request.getSession().getAttribute("user"); 
    	String approver=user.getUserName();
    	int expenseid = expense.getExpenseid();    	
    	String ispass="审核未通过";
    	expenseService.updateExpense(approver ,ispass,expenseid);
        List<Expense> expense1=expenseService.findAllExpenses();
        model.addAttribute("expense", expense1);
        return "admin_expense";
    }   
}
